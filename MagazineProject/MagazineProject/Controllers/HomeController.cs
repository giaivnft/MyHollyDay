using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using MagazineProject.Controllers;
namespace MagazineProject.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        MagazineEntities db = new MagazineEntities();
        VoidClass vc = new VoidClass();
        public ActionResult Index()
        {                        
            return View();
        }

        public ActionResult Test()
        {
            var model = db.StudentPostFiles.ToList();            
            return View(model);
        }
        public ActionResult Send()
        {
            return Content("<script language='javascript' type='text/javascript'>alert('Thanks for Feedback!');</script>");

        }
        public ActionResult SendMail()
        {
            try
            {               
                var e_to = "vinhtien90@gmail.com";
                var subject = "Test nha";
                var body = "Tu dong gui mail :D";
                if (vc.mail(e_to,subject,body))
                {
                    return Content("<script language='javascript' type='text/javascript'>alert('Thanks for Feedback!');</script>");
                }
            }
            catch (Exception e)
            {
                TempData["Mess"] = e.StackTrace;
                throw;
            }
            return RedirectToAction("Index");
        }
    }
}