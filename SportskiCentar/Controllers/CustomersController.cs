using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using SportskiCentar.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SportskiCentar.Controllers
{

    public class CustomersController : Controller
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

        public CustomersController()
        {
            entities = new SportskiCentarEntities();
        }
        [Authorize(Roles = "Employee")]
        public ActionResult AddNewCustomerForm()
        {
            return View();
        }


        public ActionResult DeleteCreditCard(string id, string JMBG)
        {
            CreditCard toDelete = entities.CreditCards.SingleOrDefault(c => c.CreditCardNumber == id);
            entities.CreditCards.Remove(toDelete);
            entities.SaveChanges();
            ViewBag.CreditCardDeleteToastr = string.Format("displayToastr()");


            return RedirectToAction("CustomerDetails", new
            {
                id = JMBG,
                toastr = "true"
            });
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
                return RedirectToAction("CustomerDetails", new
                {
                    id = card.CustomerJMBG
                });
            }
            else
                return View("AddCreditCardForm", card);
        }

        public ActionResult AddCreditCardForm(string id)
        {
            ShowCartNumber();
            CreditCard card = new CreditCard()
            {
                CustomerJMBG = id
            };

            return View(card);
        }

        public ActionResult ModifyCreditCard(CreditCard card)
        {
            if (ModelState.IsValid)
            {
                var toModify = entities.CreditCards.SingleOrDefault(c => c.CreditCardNumber == card.CreditCardNumber);
                toModify.FirstName = card.FirstName;
                toModify.LastName = card.LastName;
                toModify.PIN = card.PIN;
                toModify.PostalCode = card.PostalCode;
                toModify.ExpirationDate = card.ExpirationDate;
                toModify.Address = card.Address;
                toModify.Balance = card.Balance;
                entities.SaveChanges();
                return RedirectToAction("CustomerDetails", new
                {
                    id = card.CustomerJMBG
                });
            }
            else
            {
                return View("ModifyCreditCardForm", card);
            }
        }

        public ActionResult ModifyCreditCardForm(string id)
        {
            CreditCard card = entities.CreditCards.SingleOrDefault(c => c.CustomerJMBG == id);


            return View(card);
        }
        public ActionResult Delete(string id)
        {
            var customer = entities.Customers.FirstOrDefault(c => c.JMBG == id);
            if (customer == null)
                return View("Error", "ERROR 404: Customer with requested JMBG not found.");
            //brisanje redom da ne bi doslo do foreign key exception-a
            var shoppingCartToDelete = entities.ShoppingCarts.SingleOrDefault(s => s.CustomerJMBG == id);
            if (shoppingCartToDelete != null)
            {
                List<ShoppingCartItem> shoppingCartItemsToDelete = entities.ShoppingCartItems.Where(s => s.ShoppingCartID == shoppingCartToDelete.ShoppingCartID).ToList();
                foreach (ShoppingCartItem s in shoppingCartItemsToDelete)
                    entities.ShoppingCartItems.Remove(s);
                entities.SaveChanges();
                entities.ShoppingCarts.Remove(shoppingCartToDelete);
            }

            var creditCardToDelete = entities.CreditCards.SingleOrDefault(c => c.CustomerJMBG == id);
            if (creditCardToDelete != null)
                entities.CreditCards.Remove(creditCardToDelete);
            //mora prvo kartica da se obrise pa onda customer
            entities.SaveChanges();
            entities.Customers.Remove(customer);
            entities.SaveChanges();
            //ukoliko je uspesno brisanje prikazuje se notifikacija
            ViewBag.DisplayToastr = string.Format("displayToastr()");

            return View("AllCustomers", entities.Customers.ToList());
        }


        //mora da ostane obavezno i lista List<Customer>validation iako se ne koristi zbog validacije inace prolazi sa praznim poljem!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //(zato sto mvc gleda model koji si prosledio u action i na osnovu njega i anotacija u modelu gleda da li je sve u redu-dupla provera takodje ne mozes da stavis prazno kad menjas u bazi
        //(jedanput gleda sto se tice html-a- @Html.ValidationMessageFor to hvata ModelState.IsValid zbog cega i treba ova lista, drugi put pre upisa u bazu-s obzirom da prodje is valid dodje do baze i izbaci exception ))
        [HttpPost]
        public ActionResult SaveEdited(FormCollection customer, List<Customer> validation)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.JavaScriptFunction = string.Format("StayOpen()");
                return View("AllCustomers", entities.Customers.ToList());
            }
            else
            {
                //koje dugme je pritisnuto
                int buttonID = Convert.ToInt32(customer["submit"]) - 100;

                string customerID = customer[string.Format("[{0}].JMBG", buttonID)];
                var toChange = entities.Customers.SingleOrDefault(c => c.JMBG == customerID);


                if (toChange == null)
                    return View("Error", "ERROR 404: Customer with requested JMBG not found.");
                else
                {
                    //vadimo iz reda, u kojem se nalazi pritisnuto dugme, vrednosti iz textbox-ova.

                    toChange.FirstName = customer[string.Format("[{0}].FirstName", buttonID)];
                    toChange.LastName = customer[string.Format("[{0}].LastName", buttonID)];
                    toChange.Address = customer[string.Format("[{0}].Address", buttonID)];
                    try
                    {
                        entities.SaveChanges();
                        TempData["CustomerUpdatedNotification"] = "CustomerUpdatedNotification()";
                    }
                    catch (DbEntityValidationException e)
                    {
                        foreach (var eve in e.EntityValidationErrors)
                        {
                            System.Diagnostics.Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                                eve.Entry.Entity.GetType().Name, eve.Entry.State);
                            foreach (var ve in eve.ValidationErrors)
                            {
                                System.Diagnostics.Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                    ve.PropertyName, ve.ErrorMessage);
                            }
                        }
                        throw;
                    }
                    // entities.SaveChanges();

                    return RedirectToAction("AllCustomers", "Customers");
                }
            }
        }

        [HttpPost]
        public ActionResult AddNewCustomer(Customer customer)
        {
            if (ModelState.IsValid)
            {
                entities.Customers.Add(customer);
                try
                {
                    entities.SaveChanges();
                    ViewBag.NewCustomerNotification = string.Format("NewCustomerNotification()");
                    return View("AllCustomers", entities.Customers.ToList());
                }
                catch (System.Data.Entity.Infrastructure.DbUpdateException)
                {
                    ViewBag.NewCustomerNotification = string.Format("NewCustomerNotification()");
                    return View("AddNewCustomerForm", customer);
                }
            }
            else
            {
                return View("AddNewCustomerForm", customer);
            }
        }

        public ActionResult AllCustomers()
        {
            return View(entities.Customers.ToList());
        }


        public ActionResult CustomerDetails(string id, string toastr)
        {
            var customer = entities.Customers.SingleOrDefault(c => c.JMBG == id);
            if (toastr != null)
                ViewBag.CreditCardDeleteToastr = string.Format("displayToastr()");
            else
                ViewBag.CreditCardDeleteToastr = null;
            if (customer == null)
                return View("Error", "ERROR 404: Customer with requested JMBG not found.");
            else
                return View(customer);
        }
    }
}