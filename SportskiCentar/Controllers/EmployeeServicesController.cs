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
    public class EmployeeServicesController : Controller
    {

        private SportskiCentarEntities entities;


        public ActionResult Delete(int id)
        {
            var toDelete = entities.Services.SingleOrDefault(s => s.ServiceID == id);
            var itemsToDelete = entities.ShoppingCartItems.Where(s => s.ServiceID == toDelete.ServiceID).ToList();
            if (itemsToDelete != null)
            {
                for (int i = 0; i < itemsToDelete.Count(); i++)
                {
                    ShoppingCartItem item = itemsToDelete[i];
                    entities.ShoppingCartItems.Remove(item);
                    entities.SaveChanges();
                }
            }

            entities.Services.Remove(toDelete);
            entities.SaveChanges();
            ViewBag.DisplayToastrServices = string.Format("displayToastr()");
            return View("AllServices", entities.Services.ToList());

        }
        public EmployeeServicesController()
        {
            entities = new SportskiCentarEntities();
        }

        public ActionResult AddNewService(Service service)
        {
            if (ModelState.IsValid)
            {
                string JMBG = HttpContext.GetOwinContext()
                .GetUserManager<ApplicationUserManager>().FindById(User.Identity.GetUserId()).JMBG;
               
                var employeeID = JMBG;
                Service toAdd = new Service()
                {
                    EmployeeJMBG = employeeID,
                    Name = service.Name,
                    Type = service.Type,
                    Price = service.Price
                };
                entities.Services.Add(toAdd);
                entities.SaveChanges();
                ViewBag.NewServiceNotification = string.Format("NewServiceNotification()");
            }
            else
            {
                return View("AddNewServiceForm", service);
            }


            return View("AllServices", entities.Services.ToList());
        }

        public ActionResult AddNewServiceForm()
        {
            return View();
        }


        public ActionResult AllServices()
        {
            return View(entities.Services.ToList());
        }

        public ActionResult SaveEdited(FormCollection service, List<Service> validation)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.ServicesValidation = string.Format("StayOpen()");
                return View("AllServices", entities.Services.ToList());
            }

            int buttonID = Convert.ToInt32(service["submit"]) - 100;
            string serviceID = service[string.Format("[{0}].ServiceID", buttonID)];
            int id = Convert.ToInt32(serviceID);
            var toChange = entities.Services.SingleOrDefault(c => c.ServiceID == id);
            if (toChange == null)
                return View("Error", "ERROR 404: Customer with requested JMBG not found.");
            else
            {
                //vadimo iz reda, u kojem se nalazi pritisnuto dugme, vrednosti iz textbox-ova.

                toChange.Name = service[string.Format("[{0}].Name", buttonID)];
                toChange.Type = service[string.Format("[{0}].Type", buttonID)];

                string price = service[string.Format("[{0}].Price", buttonID)];
                toChange.Price = Convert.ToDecimal(price);
                entities.SaveChanges();
            }
            return RedirectToAction("AllServices", "EmployeeServices");
        }
    }
}