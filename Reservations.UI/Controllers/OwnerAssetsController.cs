using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Reservations.DATA.EF;
using Microsoft.AspNet.Identity;

namespace Reservations.UI.Controllers
{
    public class OwnerAssetsController : Controller
    {
        private ReservationEntities db = new ReservationEntities();

        // GET: OwnerAssets
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Index()
        {
            var ownerAssets1 = db.OwnerAssets1.Include(o => o.UserDetail);
            return View(ownerAssets1.ToList());
        }

        // GET: OwnerAssets/Details/5
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAssets ownerAssets = db.OwnerAssets1.Find(id);
            if (ownerAssets == null)
            {
                return HttpNotFound();
            }
            return View(ownerAssets);
        }

        // GET: OwnerAssets/Create
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Create()
        {
            ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FirstName");
            return View();
        }

        // POST: OwnerAssets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerAssetId,AssetName,OwnerId,AssetPhoto,SpecialNotes,IsActive,DateAdded")] OwnerAssets ownerAssets)
        {
            if (ModelState.IsValid)
            {
                db.OwnerAssets1.Add(ownerAssets);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FirstName", ownerAssets.OwnerId);
            return View(ownerAssets);
        }

        // GET: OwnerAssets/Edit/5
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAssets ownerAssets = db.OwnerAssets1.Find(id);
            if (ownerAssets == null)
            {
                return HttpNotFound();
            }
            ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FirstName", ownerAssets.OwnerId);
            return View(ownerAssets);
        }

        // POST: OwnerAssets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerAssetId,AssetName,OwnerId,AssetPhoto,SpecialNotes,IsActive,DateAdded")] OwnerAssets ownerAssets)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ownerAssets).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FirstName", ownerAssets.OwnerId);
            return View(ownerAssets);
        }

        // GET: OwnerAssets/Delete/5
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OwnerAssets ownerAssets = db.OwnerAssets1.Find(id);
            if (ownerAssets == null)
            {
                return HttpNotFound();
            }
            return View(ownerAssets);
        }

        // POST: OwnerAssets/Delete/5
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OwnerAssets ownerAssets = db.OwnerAssets1.Find(id);
            db.OwnerAssets1.Remove(ownerAssets);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
