﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MagazineEntities : DbContext
    {
        public MagazineEntities()
            : base("name=MagazineEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Academy_info> Academy_info { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Article> Articles { get; set; }
        public virtual DbSet<Faculty> Faculties { get; set; }
        public virtual DbSet<File_post> File_post { get; set; }
        public virtual DbSet<Magazine_period> Magazine_period { get; set; }
        public virtual DbSet<Marketing_coordinator> Marketing_coordinator { get; set; }
        public virtual DbSet<Marketing_Manager> Marketing_Manager { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<CoordinatorHomePage> CoordinatorHomePages { get; set; }
        public virtual DbSet<ManagerPage> ManagerPages { get; set; }
        public virtual DbSet<StudentPostFile> StudentPostFiles { get; set; }
    }
}
