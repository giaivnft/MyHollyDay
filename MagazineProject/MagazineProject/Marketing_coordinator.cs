//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MagazineProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class Marketing_coordinator
    {
        public string coordinator_id { get; set; }
        public string faculty_id { get; set; }
        public string coor_password { get; set; }
        public string coor_name { get; set; }
        public string coor_email { get; set; }
        public string coor_phone { get; set; }
    
        public virtual Faculty Faculty { get; set; }
    }
}
