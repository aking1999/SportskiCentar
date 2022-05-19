using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SportskiCentar.Helpers;
using SportskiCentar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportskiCentar.Controllers
{
    public class ServicesController : Controller
    {
        private SportskiCentarEntities entities;

        public ServicesController()
        {
            entities = new SportskiCentarEntities();
        }

        public ActionResult ServiceDetails(int id)
        {
            var service = entities.Services.SingleOrDefault(c => c.ServiceID == id);
            return View(service);
        }




        public ActionResult AllServices()
        {
            string JMBG = HttpContext.GetOwinContext()
             .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;

            var customer = entities.Customers.SingleOrDefault(c => c.JMBG == customerID);
            if (customer != null && customer.ShoppingCarts.Any())
            {
                var cart = entities.ShoppingCarts.SingleOrDefault(c => c.CustomerJMBG == customer.JMBG);
                int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID).Count();
                ViewBag.ShowCart = totalNumOfItems;
                return View(entities.Services.ToList());
            }

            //ako nema korpu uposte mu se ne prikazuje cart
            return View(entities.Services.ToList());
        }

        public ActionResult AddToCart(FormCollection service)
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
            item.ServiceID = Convert.ToInt32(service["submit"]);
            item.Amount = entities.Services.Where(s => s.ServiceID == item.ServiceID).Select(s => s.Price).Single();

            entities.ShoppingCartItems.Add(item);
            entities.SaveChanges();

            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == item.ShoppingCartID).Count();
            ViewBag.ShowCart = totalNumOfItems;

            return RedirectToAction("AllServices", entities.Services.ToList());

        }
        public ActionResult SearchServices(CustomerSearchService searchService)
        {
            //showCartNumber
            string JMBG = HttpContext.GetOwinContext()
           .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
            var cart = entities.ShoppingCarts.SingleOrDefault(c => c.CustomerJMBG == JMBG);
            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID).Count();
            ViewBag.ShowCart = totalNumOfItems;
            if (ModelState.IsValid)
            {
                //if(string.IsNullOrEmpty(searchService.Name) || !string.IsNullOrWhiteSpace(searchService.Name) ||
                //    searchService.Price == default)
                //    return    ----------------- OVU VALIDACIJU URADITI KROZ ANOTACIJE ---------------------

                var services = entities.Services.Where(s =>
                                                            ((searchService.Name != null && searchService.Name != string.Empty && searchService.Name != " ") ? s.Name.ToLower().StartsWith(searchService.Name) : true) &&
                                                            ((searchService.Price != default && searchService.Price != null) ? s.Price == searchService.Price : true)).ToList();

                return View(services);
            }
            else
            {
                return View("SearchServicesForm", searchService);
            }
        }
        public ActionResult SearchServicesForm()
        {
            string JMBG = HttpContext.GetOwinContext()
           .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
            var cart = entities.ShoppingCarts.SingleOrDefault(c => c.CustomerJMBG == JMBG);
            int totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID).Count();
            ViewBag.ShowCart = totalNumOfItems;
            return View();
        }
    }
}