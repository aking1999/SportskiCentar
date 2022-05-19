using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SportskiCentar.Models;

namespace SportskiCentar.Controllers
{
    [AllowAnonymous]
    public class HomeController : Controller
    {

        private void ShowCartNumber()
        {
            if(!User.IsInRole("Employee") && User.Identity.IsAuthenticated)
            {
                string JMBG = HttpContext.GetOwinContext()
                .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
                var cart = entities.ShoppingCarts.SingleOrDefault(c => c.CustomerJMBG == JMBG);
                int totalNumOfItems = 0;
                if(entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID) != null && cart != null)
                {
                    totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID).Count();
                }
           
                ViewBag.ShowCart = totalNumOfItems;
            }
           
        }
        private SportskiCentarEntities entities;

        public HomeController()
        {
            entities = new SportskiCentarEntities();
        }
        public ActionResult Index()
        {
            ShowCartNumber();
            return View();
        }

        public ActionResult About()
        {
            ShowCartNumber();
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult TEST()
        {
            return View();
        }

        public ActionResult Contact()
        {
            ShowCartNumber();
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}