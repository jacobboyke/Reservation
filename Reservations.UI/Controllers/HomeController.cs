using System;
using System.Web.Mvc;
using System.Web;
using System.Net.Mail;
using System.Net;
using Reservations.UI.Models;

namespace Reservations.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            //cvm variable above represents the form the user just filled out.
            //so if we call cvm.Name, we're getting the value the user typed in the Name textbox.

            if (ModelState.IsValid)//process the form & send email
            {
                string body = $"Message sent from Reservations Site for {cvm.Name} ({cvm.Email}) as follows:<br>" +
                    $"<blockquote>{cvm.Message}</blockquote><br/>";
                //note: ternary operator w/ string interpolation is known issue... it chockes on the : symbol
                //because it thinks it's a format specifier. FIX: just add parentheses (as above)

                //string subject = $"MVC1Intro site message from {cvm.Name} on {DateTime.Today:g}";

                MailMessage m = new MailMessage(
                    "admin@jboyke.com"//FROM email address-must match your smarterasp
                    , "jacob.boyke14@gmail.com"//TO email address that you actually check
                      , cvm.Subject//, subject //complicate enough, we pre-made this as a variable
                    , body //complicate enough, we pre-made this as a variable
                    );

                //update the message special properties as desired
                m.IsBodyHtml = true;
                m.ReplyToList.Add(cvm.Email);//sets Reply to go to  user, not to our SmarterASP email

                //to send the message, we need a server - protocol for sending email is SMTP
                //Here, must be mail."smarterasp-domain"
                SmtpClient client = new SmtpClient("mail.jboyke.com");
                client.Credentials = new NetworkCredential(
                    "admin@jboyke.com"//smarterasp email address
                    , "P@ssw0rd"//password for that account
                    );

                //add as possible troubleshooting item if failing for no reason
                client.EnableSsl = false;
                client.Port = 25;


                //next step is to send the message - but this is a good example "dangerous code"
                //--ie: there are times when it just might fail...
                //so use a try-catch to handle possible errors.
                //Also, for performance/efficiency, use a USING BLOCK to auto-delete the client when done.
                using (client)
                {
                    try
                    {
                        client.Send(m);
                        ViewBag.ErrorMessage = null;
                        ViewBag.ErrorDetails = null;
                    }
                    catch (Exception ex)
                    {
                        //this failed for some reason, but we will catch the exception to
                        //handle it more gracefully. HERE: capture error info and show to user.
                        ViewBag.ErrorMessage = "There was an error sending your email.";
                        ViewBag.ErrorDetails = ex.Message + "<br><br>" + ex.GetType() + "<br><br>" +
                            ex.StackTrace;
                        return View(cvm);//kick them back to view for error info (show VB error details)
                    }
                }//this using block auto-disposes the client when curly brace closes here

                //SUCCESS! Send them to confirmation details page
                return View("ContactConfirmation", cvm);
            }

            //if model wasn't valid, kick them back to view with errors & try again
            return View(cvm);
        }
    }
}