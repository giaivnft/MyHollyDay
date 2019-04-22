using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MagazineProject.Controllers
{
    public class LoginController : Controller
    {
        MagazineEntities db = new MagazineEntities();
        VoidClass function = new VoidClass();
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username,string password)
        {
            if (username == "" || password == "")
            {
                ModelState.AddModelError("", "Please input Username and Password!");
                return View();
            }

            var listAdmin = db.Admins.ToList();
            var listStudent = db.Students.ToList();
            var listCoordinator = db.Marketing_coordinator.ToList();
            var listManager = db.Marketing_Manager.ToList();
            string pw = function.encodeMD5(password);
            var admin = listAdmin.SingleOrDefault(a=> a.admin_id.Equals(username) && a.admin_password.Equals(pw));
            if (admin != null)
            {
                Session["admin"] = username;
                Session["adname"] = admin.admin_name;
                return RedirectToAction("Index", "Home");
            }
            var student = listStudent.SingleOrDefault(s=> s.student_id.Equals(username) && s.student_password.Equals(pw));
            if (student != null)
            {
                Session["student"] = username;
                Session["studentname"] = student.student_name;
                return RedirectToAction("Index", "Home");
            }
            var coor = listCoordinator.SingleOrDefault(c=>c.coordinator_id.Equals(username) && c.coor_password.Equals(password));
            if (coor != null)
            {
                Session["coordinator"] = username;
                Session["coorname"] = student.student_name;
                return RedirectToAction("Index", "Home");
            }
            var manager = listManager.SingleOrDefault(c => c.manager_id.Equals(username) && c.manager_password.Equals(password));
            if (manager != null)
            {
                Session["manager"] = username;
                Session["managername"] = student.student_name;
                return RedirectToAction("Index", "Home");
            }
            ModelState.AddModelError("", "Wrong id or password. Please try again or contact the adminstrator");
            return View();
        }
    }
}