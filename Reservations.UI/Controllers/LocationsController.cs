﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Reservations.DATA.EF;

namespace Reservations.UI.Controllers
{
    public class LocationsController : Controller
    {
        private ReservationEntities db = new ReservationEntities();

        // GET: Locations
        
        public ActionResult Index()
        {
            return View(db.Locations1.ToList());
        }

        // GET: Locations/Details/5
        
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            return View(locations);
        }

        // GET: Locations/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LocationId,LocationName,Address,City,State,ZipCode,ReservationLimit")] Locations locations)
        {
            if (ModelState.IsValid)
            {
                db.Locations1.Add(locations);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(locations);
        }

        // GET: Locations/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            return View(locations);
        }

        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LocationId,LocationName,Address,City,State,ZipCode,ReservationLimit")] Locations locations)
        {
            if (ModelState.IsValid)
            {
                db.Entry(locations).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(locations);
        }

        // GET: Locations/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            return View(locations);
        }

        // POST: Locations/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Locations locations = db.Locations1.Find(id);
            db.Locations1.Remove(locations);
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
