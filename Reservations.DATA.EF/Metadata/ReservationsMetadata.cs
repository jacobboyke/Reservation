using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Reservations.DATA.EF/*.Metadata*/
{
    public class ReservationsMetadata
    {
        //public int ReservationId { get; set; }
        //public int OwnerAssetId { get; set; }
        //public int LocationId { get; set; }

        [Display(Name = "Reservation Date")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime ReservationDate { get; set; }
    }
    
    public class LocationsMetadata
    {
        //public int LocationId { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Location")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string LocationName { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(100, ErrorMessage = "* Value must be 100 characters or less.")]
        public string Address { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(100, ErrorMessage = "* Value must be 100 characters or less.")]
        public string City { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
        public string State { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(5, ErrorMessage = "* Value must be 5 characters or less.")]
        public string ZipCode { get; set; }

        //[Display(Name = "Reservation Limit")]
        //public byte ReservationLimit { get; set; }
    }

    public class OwnerAssetsMetadata
    {
        //public int OwnerAssetId { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Group Name")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string AssetName { get; set; }

        //public string OwnerId { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Photo")]
        public string AssetPhoto { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Notes")]
        [StringLength(300, ErrorMessage = "* Value must be 300 characters or less.")]
        public string SpecialNotes { get; set; }

        [Display(Name = "Active")]
        public bool IsActive { get; set; }

        [Display(Name = "Date Joined")]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public System.DateTime DateAdded { get; set; }
    }

    public class UserDetailsMetadata
    {
        //public string UserId { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string LastName { get; set; }
    }

    [MetadataType(typeof(UserDetailsMetadata))]
    public partial class UserDetails
    {
        [Display(Name = "Full Name")]
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }

    }
}
