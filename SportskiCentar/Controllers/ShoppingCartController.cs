using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SportskiCentar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportskiCentar.Controllers
{
    public class ShoppingCartController : Controller
    {
        private SportskiCentarEntities entities;
 
        public ShoppingCartController()
        {
            entities = new SportskiCentarEntities();

        }
        public JsonResult Test(string id)
        {
            string JMBG = HttpContext.GetOwinContext()
             .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;
            ShoppingCart cart = new ShoppingCart();
            if (!entities.ShoppingCarts.Where(c => c.CustomerJMBG == customerID).Any())
            {
                cart.CustomerJMBG = customerID;
                entities.ShoppingCarts.Add(cart);
                entities.SaveChanges();
            }

            //popunjavanje item-a
            ShoppingCartItem item = new ShoppingCartItem();
            item.ShoppingCartID = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
            int maxOrdinal = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == item.ShoppingCartID).Select(c => c.OrdinalNum).DefaultIfEmpty().Max();
            item.OrdinalNum = maxOrdinal + 1;
            item.ServiceID = Convert.ToInt32(id);
            //promeniti ovo nije cena
            item.Amount = entities.Services.Where(s => s.ServiceID == item.ServiceID).Select(s => s.Price).Single();

            entities.ShoppingCartItems.Add(item);
            entities.SaveChanges();

            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == item.ShoppingCartID).Count();
            return Json(totalNumOfItems, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            string JMBG = HttpContext.GetOwinContext()
             .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;
            var shoppinCartID = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
            var shoppingCartItemToDelete = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppinCartID && s.ServiceID == id).ToList();

            entities.ShoppingCartItems.Remove(shoppingCartItemToDelete[0]);
            entities.SaveChanges();
            int shoppingCartID = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == shoppingCartID).Count();
            ViewBag.ShowCart = totalNumOfItems;
            List<Service> services = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartID).Select(s => s.Service).ToList();


            return View("ShoppingCartForm", services);
        }
        public ActionResult Checkout()
        {

            string JMBG = HttpContext.GetOwinContext()
             .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;
            int index = 0;
            decimal? totalPrice = 0;
            int shoppingCartID = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
            List<int> services = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartID).Select(s => s.ServiceID).ToList();
            for (int i = 0; i < services.Count(); i++)
            {
                index = services[i];
                totalPrice += entities.Services.Where(s => s.ServiceID == index).Select(s => s.Price).Single();
            }
            var crediCard = entities.CreditCards.SingleOrDefault(c => c.CustomerJMBG == customerID);
            if (crediCard.Balance >= totalPrice)
            {
                crediCard.Balance -= Convert.ToDecimal(totalPrice);
                //brisanje svih item-a iz korpe
                var shoppingCartToDelete = entities.ShoppingCarts.SingleOrDefault(s => s.CustomerJMBG == customerID);
                if (shoppingCartToDelete != null)
                {
                    List<ShoppingCartItem> shoppingCartItemsToDelete = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartToDelete.ShoppingCartID).ToList();
                    foreach (ShoppingCartItem s in shoppingCartItemsToDelete)
                        entities.ShoppingCartItems.Remove(s);
                    entities.SaveChanges();
                    entities.ShoppingCarts.Remove(shoppingCartToDelete);
                }
                entities.SaveChanges();
                TempData["CheckoutOK"] = "true";
                return RedirectToAction("ShoppingCartForm");
            }


            int shoppingCartIDD = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == shoppingCartID).Count();
            ViewBag.ShowCart = totalNumOfItems;
            List<Service> servicess = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartID).Select(s => s.Service).ToList();
            TempData["CheckoutOK"] = "false";

            return RedirectToAction("ShoppingCartForm", servicess);
        }
        public ActionResult ShoppingCartForm()
        {
            string JMBG = HttpContext.GetOwinContext()
            .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;
            
            if (entities.ShoppingCarts.Where(c => c.CustomerJMBG == customerID).Any())
            {
                int shoppingCartID = entities.ShoppingCarts.Where(s => s.CustomerJMBG == customerID).Select(s => s.ShoppingCartID).Single();
                int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == shoppingCartID).Count();
                ViewBag.ShowCart = totalNumOfItems;
                List<Service> services = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartID).Select(s => s.Service).ToList();

                return View(services);
            }
            else
                return View();

        }
    }
}