//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Reservations.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reservations
    {
        public int ReservationId { get; set; }
        public int OwnerAssetId { get; set; }
        public int LocationId { get; set; }
        public System.DateTime ReservationDate { get; set; }
    
        public virtual Locations Location { get; set; }
        public virtual OwnerAssets OwnerAsset { get; set; }
    }
}
