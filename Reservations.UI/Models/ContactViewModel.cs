using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace Reservations.UI.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "Name is required***")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Email address is required***")]
        [EmailAddress(ErrorMessage = "Email address must be in correct format")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Subject is required***")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "Message is required")]
        [UIHint("MultilineText")]//converts text-box to textaread for EditorFor
        public string Message { get; set; }
    }
}