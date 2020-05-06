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
    public class ReservationsController : Controller
    {
        private ReservationEntities db = new ReservationEntities();

        // GET: Reservations
        [Authorize(Roles = "Admin, Customer, Employees")]
        public ActionResult Index()
        {
            if (User.IsInRole("Customer"))
            {
                string currentUserID = User.Identity.GetUserId();
                var thisUserreservation = db.Reservations.Where(p => p.OwnerAsset.OwnerId == currentUserID).Include(r => r.Location).Include(r => r.OwnerAsset);
                return View(thisUserreservation.ToList());
            }
            else
            {
                var reservations = db.Reservations.Include(r => r.Location).Include(r => r.OwnerAsset);
                return View(reservations.ToList());
            }

        }

        // GET: Reservations/Details/5
        [Authorize(Roles = "Admin, Customer, Employees")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // GET: Reservations/Create
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Create()
        {
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationName");
            if (User.IsInRole("Customer"))
            {
                string currentUserID = User.Identity.GetUserId();
                var thisUserAsset = db.OwnerAssets1.Where(p => p.OwnerId == currentUserID).Include(r => r.UserDetail);
                ViewBag.OwnerAssetId = new SelectList(thisUserAsset, "OwnerAssetId", "AssetName");
            }
            else
            {
                //admin and employees
                ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName");
            }

            return View();
        }

        // POST: Reservations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReservationId,OwnerAssetId,LocationId,ReservationDate")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                //checked the pull up locationid check res limit vs the count of reservations made on that date at that location (only matter if you are not an admin) otherwise you can add the reservation
                if (User.IsInRole("Admin"))
                {
                    db.Reservations.Add(reservation);
                    db.SaveChanges();
                }
                else
                //check res for that day and location  and get a count()
                {
                    int res = db.Reservations.Where(r => r.LocationId == reservation.LocationId && r.ReservationDate == reservation.ReservationDate).Count();

                    Locations loc = db.Locations1.Where(l => l.LocationId == reservation.LocationId).SingleOrDefault();

                    //if count is less then res limit add reservation
                    //if (res < reservation.Locations.ReservationLimit)
                    if (res < loc.ReservationLimit)
                    {
                        db.Reservations.Add(reservation);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    //else
                    //show message that res are full must be over ridden.
                    else
                    {
                        ViewBag.ResLimit = "The reservation date you requested is currently full. Please contact a manager for further assistance. Thank you!";

                        string currentUserID = User.Identity.GetUserId();
                        var thisUser = db.OwnerAssets1.Where(p => p.OwnerId == currentUserID).Include(r => r.UserDetail);

                        ViewBag.OwnerID = new SelectList(thisUser, "OwnerId", "GroupName");
                        ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationName", reservation.LocationId);

                        return View(reservation);
                    }
                }
                db.Reservations.Add(reservation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationName", reservation.LocationId);
            //ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName", reservation.OwnerAssetId);
            if (User.IsInRole("Customer"))
            {
                string currentUserID = User.Identity.GetUserId();
                var thisUserAsset = db.OwnerAssets1.Where(p => p.OwnerId == currentUserID).Include(r => r.UserDetail);
                ViewBag.OwnerAssetId = new SelectList(thisUserAsset, "OwnerAssetId", "AssetName", reservation.LocationId);
            }
            else
            {
                //admin and employees
                ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName", reservation.LocationId);
            }
            return View(reservation);
        }

        // GET: Reservations/Edit/5
        [Authorize(Roles = "Admin, Customer, Employees")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationName", reservation.LocationId);
            ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName", reservation.OwnerAssetId);
            return View(reservation);
        }

        // POST: Reservations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReservationId,OwnerAssetId,LocationId,ReservationDate")] Reservation reservation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationName", reservation.LocationId);
            if (User.IsInRole("Customer"))
            {
                string currentUserID = User.Identity.GetUserId();
                var thisUserAsset = db.OwnerAssets1.Where(p => p.OwnerId == currentUserID).Include(r => r.UserDetail);
                ViewBag.OwnerAssetId = new SelectList(thisUserAsset, "OwnerAssetId", "AssetName", reservation.OwnerAssetId);
            }
            else
            {
                //admin and employees
                ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName", reservation.OwnerAssetId);
            }

            return View(reservation);
        }

        // GET: Reservations/Delete/5
        [Authorize(Roles = "Admin, Customer")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservation reservation = db.Reservations.Find(id);
            if (reservation == null)
            {
                return HttpNotFound();
            }
            return View(reservation);
        }

        // POST: Reservations/Delete/5
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservation reservation = db.Reservations.Find(id);
            db.Reservations.Remove(reservation);
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
