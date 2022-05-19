using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SportskiCentar.Models;

namespace SportskiCentar.Controllers
{
    public class UsersController : Controller
    {
        private SportskiCentarEntities entities;

        private void ShowCartNumber()
        {
            if (!User.IsInRole("Employee") && User.Identity.IsAuthenticated)
            {
                string JMBG = HttpContext.GetOwinContext()
                .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
                var cart = entities.ShoppingCarts.SingleOrDefault(c => c.CustomerJMBG == JMBG);
                int totalNumOfItems = 0;
                if (entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID) != null && cart != null)
                {
                    totalNumOfItems = entities.ShoppingCartItems.Where(c => c.ShoppingCartID == cart.ShoppingCartID).Count();
                }

                ViewBag.ShowCart = totalNumOfItems;
            }

        }

        public UsersController()
        {
            entities = new SportskiCentarEntities();
        }

        public ActionResult UserDetails()
        {
            string JMBG = HttpContext.GetOwinContext()
            .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;

            string customerID = JMBG;
            var customer = entities.Customers.SingleOrDefault(c => c.JMBG == customerID);

            if (customer == null)
                return View("Error", (object)"Error 404: Customer with requested ID not found.");

            ShowCartNumber();

            return View(customer);
        }

        public ActionResult DeleteCreditCard(string id, string JMBG)
        {
            CreditCard toDelete = entities.CreditCards.SingleOrDefault(c => c.CreditCardNumber == id);
            entities.CreditCards.Remove(toDelete);
            entities.SaveChanges();
            ViewBag.CreditCardDeleteToastr = string.Format("displayToastr()");


            return RedirectToAction("UserDetails", new
            {
                id = JMBG,
                toastr = "true"
            });
        }

        public ActionResult EditForm(string id)
        {
            var userToEdit = entities.Customers.SingleOrDefault(c => c.JMBG == id);
            ShowCartNumber();
            if (userToEdit == null)
                return View("Error", (object)"Error 404: Customer with requested JMBG not found.");

            return View(userToEdit);
        }

        public ActionResult Edit(Customer customer)
        {
            if (ModelState.IsValid)
            {
                var customerInDatabase = entities.Customers.SingleOrDefault(c => c.JMBG == customer.JMBG);

                if (customerInDatabase == null)
                    return View("Error", (object)"Error 404: Customer with requested JMBG not found.");

                customerInDatabase.FirstName = customer.FirstName;
                customerInDatabase.LastName = customer.LastName;
                customerInDatabase.Address = customer.Address;

                entities.SaveChanges();

                return RedirectToAction("UserDetails");
            }
            else
            {
                return View("EditForm", customer);
            }
        }

        public ActionResult AddCreditCardForm()
        {
            string JMBG = HttpContext.GetOwinContext()
            .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
            ShowCartNumber();

            string loggedUser = JMBG;
            CreditCard card = new CreditCard();
            card.CustomerJMBG = loggedUser;
            return View(card);
        }

        public ActionResult AddCreditCard(CreditCard card)
        {
            if (ModelState.IsValid)
            {
                CreditCard toAdd = new CreditCard()
                {
                    CreditCardNumber = card.CreditCardNumber,
                    FirstName = card.FirstName,
                    LastName = card.LastName,
                    PIN = card.PIN,
                    CustomerJMBG = card.CustomerJMBG,
                    Balance = card.Balance,
                    ExpirationDate = card.ExpirationDate,
                    PostalCode = card.PostalCode,
                    Address = card.Address
                };
                entities.CreditCards.Add(toAdd);
                entities.SaveChanges();
                return RedirectToAction("UserDetails", new
                {
                    id = card.CustomerJMBG
                });
            }
            else
                return View("AddCreditCardForm", card);
       
        }

        public ActionResult EditCreditCardForm(string id)
        {
            ShowCartNumber();
            var creditCardToEdit = entities.CreditCards.SingleOrDefault(c => c.CustomerJMBG == id);

            if (creditCardToEdit == null)
                return View("Error", (object)"Error 404: Credit card with requested number not found.");

            return View(creditCardToEdit);
        }

        public ActionResult EditCreditCard(CreditCard creditCard)
        {
            if (ModelState.IsValid)
            {
                var creditCardInDatabase = entities.CreditCards.SingleOrDefault(c => c.CreditCardNumber == creditCard.CreditCardNumber);

                if (creditCardInDatabase == null)
                    return View("Error", (object)"Error 404: Customer with requested JMBG not found.");

                creditCardInDatabase.FirstName = creditCard.FirstName;
                creditCardInDatabase.LastName = creditCard.LastName;
                creditCardInDatabase.PIN = creditCard.PIN;
                creditCardInDatabase.Address = creditCard.Address;
                creditCardInDatabase.Balance = creditCard.Balance;
                creditCardInDatabase.ExpirationDate = creditCard.ExpirationDate;
                creditCardInDatabase.PostalCode = creditCard.PostalCode;

                entities.SaveChanges();

                return RedirectToAction("UserDetails");
            }
            else
            {
                return View("EditCreditCardForm", creditCard);
            }
        }
    }
}