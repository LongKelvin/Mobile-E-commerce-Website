using MOBILE_SHOPPING_WEBSITE.Models.BUS;
using MobileShopConnectionString;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MOBILE_SHOPPING_WEBSITE.Controllers
{
    public class ShopController : Controller
    {
        // GET: Shop
        public ActionResult Index()
        {
            var db =  MobileShopOnlineBUS.ListAllProducts();
        
            return View(db);
        }


        // GET: Shop/Details/5
        public ActionResult Details(string id)
        {
            return View();
        }

        public JsonResult GetProductImageByID(string productImageID)
        {
            if (productImageID == null || String.IsNullOrEmpty(productImageID))
                return Json("Null value", JsonRequestBehavior.AllowGet);

            var db = MobileShopOnlineBUS.GetProductImageByID(productImageID);
            var result =  db.Select(x => x.ProductImage).First();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // GET: Shop/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Shop/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Shop/Edit/5
        public ActionResult Edit(string id)
        {
            return View();
        }

        // POST: Shop/Edit/5
        [HttpPost]
        public ActionResult Edit(string id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Shop/Delete/5
        public ActionResult Delete(string id)
        {
            return View();
        }

        // POST: Shop/Delete/5
        [HttpPost]
        public ActionResult Delete(string id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
