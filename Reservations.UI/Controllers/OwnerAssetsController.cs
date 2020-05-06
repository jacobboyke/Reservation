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
            if (User.IsInRole("Customer"))
            {
                string currentUserID = User.Identity.GetUserId();
                var thisUserAsset = db.OwnerAssets1.Where(p => p.OwnerId == currentUserID).Include(o => o.UserDetail);
                ViewBag.OwnerAssetId = new SelectList(thisUserAsset, "OwnerAssetId", "AssetName");
                return View(thisUserAsset);
            }
            else
            {
                //admin 
                //ViewBag.OwnerAssetId = new SelectList(db.OwnerAssets1, "OwnerAssetId", "AssetName");
                var ownerAssets1 = db.OwnerAssets1.Include(o => o.UserDetail);
                return View(ownerAssets1.ToList());
            }
            //ownerAssets.OwnerId = User.Identity.GetUserId();

            
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
            //new SelectList(datasource, "Value to use", "Text to display")
            if (User.IsInRole("Admin"))
            {
                ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FullName");
            }
            return View();
        }

        // POST: OwnerAssets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OwnerAssetId,AssetName,OwnerId,AssetPhoto,SpecialNotes,IsActive")] OwnerAssets ownerAssets, HttpPostedFileBase assetImage)
        {
            if (ModelState.IsValid)
            {
                //--updating for PostCreate file upload:
                //--1) add HttpPostedFileBase param for fup (fupBookImage)
                //--2) set up processing logic in the If(ModelState.IsValid)
                #region Post-Create's Image Upload
                string imageName = "noImage.jpeg";//default value in case no image was uploaded

                try
                {
                    //did the user upload a file? if so, continue processing it
                    if (assetImage != null)
                    {
                        //yes, they uploaded a file.
                        imageName = assetImage.FileName;

                        //find extension
                        string ext = imageName.Substring(imageName.LastIndexOf("."));

                        //declare list of valid extensions
                        string[] goodExts = { ".jpg", ".jpeg", ".gif", ".png" };

                        //check the ext against allowed types & that it's 4MB or less (ASP.NET default max size)
                        if (goodExts.Contains(ext.ToLower()) && (assetImage.ContentLength <= 4194304))
                        {
                            //good extension & file size -- make filename unique
                            //easiest way is to use a GUID. downside - not meaningful.
                            imageName = Guid.NewGuid() + ext;//calls Guid's ToString() behind scenes

                            //save the file to the webserver at correct folder - account for
                            //dynamically determining where web root folded is on THIS machine
                            assetImage.SaveAs(
                                Server.MapPath("~/Content/assetimages/" + imageName));
                            //note path ends in filename. (also, last folder ends in /)
                        }//if good ext & filesize
                        else
                        {
                            //could do different things to response - bad ext or filesize
                            //Ex: just use NoImage.png and call it day -- we used this
                            imageName = "noImage.jpeg";

                            //Ex: throw a generic or specific error
                            //throw new ApplicationException();

                            //Ex: create a ViewBag variable for error message, return to view
                            //to try again and show that message if it exists.
                            //ViewBag.Message = "There was an error with your file upload - size or type";

                            ////copied ddl collections
                            //ViewBag.BookID = new SelectList(db.BookRoyalties, "BookID", "BookID", book.BookID);
                            //ViewBag.BookStatusID = new SelectList(db.BookStatuses, "BookStatusID", "BookStatusName", book.BookStatusID);
                            //ViewBag.GenreID = new SelectList(db.Genres, "GenreID", "GenreName", book.GenreID);
                            //ViewBag.PublisherID = new SelectList(db.Publishers, "PublisherID", "PublisherName", book.PublisherID);

                            //return View();



                        }//else - bad ext or filesize

                    }//if file was uploaded
                }//end try for file upload processing
                catch (Exception)
                {
                    throw new Exception("Sorry, something went wrong with your file upload");
                }//end catch some exception occurred

                //no matter what, add the imagename to the object before we add object to db
                //NEED to have correct image filename on file for that record
                ownerAssets.AssetPhoto = imageName;
                #endregion

                ownerAssets.DateAdded = DateTime.Now;
                if (User.IsInRole("Customer"))
                {
                    ownerAssets.OwnerId = User.Identity.GetUserId();
                }
                db.OwnerAssets1.Add(ownerAssets);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //if errors in form send back
            if (User.IsInRole("Admin"))
            {
                //Viewbag.OwnerID = new SelectList(datasource, "Value to use", "Text to display", currently selected item); dropdown list
                ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FullName", ownerAssets.OwnerId);
            }
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
            if (User.IsInRole("Admin"))
            {
                //Viewbag.OwnerID = new SelectList(datasource, "Value to use", "Text to display", currently selected item); dropdown list
                ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FullName", ownerAssets.OwnerId);
            }
            return View(ownerAssets);
        }

        // POST: OwnerAssets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Customer")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OwnerAssetId,AssetName,OwnerId,AssetPhoto,SpecialNotes,IsActive,DateAdded")] OwnerAssets ownerAssets, HttpPostedFileBase assetImage)
        {
            if (ModelState.IsValid)
            {
                #region Post-Edit's Image Upload
                //EDIT-Variation: there is no default image for edit

                try
                {
                    //did the user upload a file? if so, continue processing it
                    if (assetImage != null)
                    {
                        //EDIT-Variation: variable below is instantiated here now.
                        //yes, they uploaded a file.
                        string imageName = assetImage.FileName;

                        //find extension
                        string ext = imageName.Substring(imageName.LastIndexOf("."));

                        //declare list of valid extensions
                        string[] goodExts = { ".jpg", ".jpeg", ".gif", ".png" };

                        //check the ext against allowed types & that it's 4MB or less (ASP.NET default max size)
                        if (goodExts.Contains(ext.ToLower()) && (assetImage.ContentLength <= 4194304))
                        {
                            //good extension & file size -- make filename unique
                            //easiest way is to use a GUID. downside - not meaningful.
                            imageName = Guid.NewGuid() + ext;//calls Guid's ToString() behind scenes

                            //save the file to the webserver at correct folder - account for
                            //dynamically determining where web root folded is on THIS machine
                            assetImage.SaveAs(
                                Server.MapPath("~/Content/assetimages/" + imageName));
                            //note path ends in filename. (also, last folder ends in /)

                            //EDIT-Variation: delete image old image on file if it's not No-Image
                            if (ownerAssets.AssetPhoto != null && ownerAssets.AssetPhoto != "noImage.jpeg")
                            {
                                System.IO.File.Delete(
                                    Server.MapPath("~/Content/assetimages/" + ownerAssets.AssetPhoto));
                            }

                            //EDIT-Variation:
                            //only save the image on file if it changed
                            ownerAssets.AssetPhoto = imageName;
                        }//if good ext & filesize
                        else
                        {
                            //EDIT-Variation:No else needed
                            //lots of options for how to handle, but we'll just fall back to
                            //the old image on file if new image uploaded was no good...
                            //no code needed (not even this else) because of HiddenFor()
                        }//else - bad ext or filesize

                    }//if file was uploaded
                }//end try for file upload processing
                catch (Exception)
                {
                    throw new Exception("Sorry, something went wrong with your file upload");
                }//end catch some exception occurred
                #endregion

                db.Entry(ownerAssets).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (User.IsInRole("Admin"))
            {
                //Viewbag.OwnerID = new SelectList(datasource, "Value to use", "Text to display", currently selected item); dropdown list
                ViewBag.OwnerId = new SelectList(db.UserDetails1, "UserId", "FullName", ownerAssets.OwnerId);
            }
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
            if (ownerAssets.AssetPhoto != null && ownerAssets.AssetPhoto != "noImage.jpeg")
            {
                System.IO.File.Delete(
                    Server.MapPath("~/Content/assetimages/" + ownerAssets.AssetPhoto));
            }
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
