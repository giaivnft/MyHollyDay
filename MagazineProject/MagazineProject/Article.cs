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
    
    public partial class Article
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Article()
        {
            this.File_post = new HashSet<File_post>();
            this.Reviews = new HashSet<Review>();
        }
    
        public int article_id { get; set; }
        public string student_id { get; set; }
        public Nullable<int> period_id { get; set; }
        public string article_tittle { get; set; }
        public string arrticle_content { get; set; }
        public Nullable<System.DateTime> article_post_date { get; set; }
        public Nullable<System.DateTime> article_public_date { get; set; }
        public string article_avatar_img { get; set; }
        public string article_status { get; set; }
    
        public virtual Magazine_period Magazine_period { get; set; }
        public virtual Student Student { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<File_post> File_post { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
