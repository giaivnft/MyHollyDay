using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MagazineProject.Controllers
{
    public class StudentController : Controller
    {
        MagazineEntities db = new MagazineEntities();
        // GET: Student
        public ActionResult StudentHomePage()
        {
            if (checkSessionStudent() == false)
            {
                return RedirectToAction("Login","Login");
            }
            var period = db.Magazine_period.OrderByDescending(s => s.period_id).First();
            if (period.closure_post_date < DateTime.Now)
            {
                TempData["Disable"] = "Disable";
                return View();
            }
            
            return View();
        }
        public bool checkSessionStudent()
        {
            if (Session["student"] != null)
            {
                return true;
            }
            else
            {
                return false;
            }                
        }
        [HttpGet]
        public ActionResult PostArticle()
        {
            if (checkSessionStudent() == false)
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }
        [HttpPost]
        public ActionResult PostArticle(string title, string content,HttpPostedFileBase file, HttpPostedFileBase image)
        {
            if (checkSessionStudent() == false)
            {
                return RedirectToAction("Login", "Login");
            }
            var period = db.Magazine_period.OrderByDescending(s => s.period_id).First();
            if (period.closure_post_date < DateTime.Now)
            {
                ModelState.AddModelError("", "");
                return View();
            }
            if (string.IsNullOrEmpty(title) || file == null || image == null)
            {
                var ErrorMessage = "Please input and upload all files.";
                ModelState.AddModelError("", ErrorMessage);
                return View();
            }
            try
            {   
                var filesize = 20;
                var supportedTypes = new[] { "doc", "docx", "pdf", "zip" };
                var fileExt = System.IO.Path.GetExtension(file.FileName).Substring(1);                
                if (!supportedTypes.Contains(fileExt))
                {
                    var ErrorMessage = "File Article Is InValid - Only Upload WORD/PDF/ZIP File";
                    ModelState.AddModelError("", ErrorMessage);
                    return View();
                }
                else if (file.ContentLength > (filesize * 1024 * 1024))
                {
                    var ErrorMessage = "File size Should Be UpTo " + filesize + "MB";
                    ModelState.AddModelError("", ErrorMessage);
                    return View();
                }
                else
                {
                    string pathFile = System.IO.Path.GetFileName(image.FileName);
                    string pathFileFormat = DateTime.Now.ToString("yyyy_MM_dd_mm_ss") + pathFile;
                    string folder = System.IO.Path.Combine(
                        Server.MapPath("~/img"), pathFileFormat);
                    image.SaveAs(folder);
                    var idStudent = Session["student"].ToString();                    
                    var idPeriod = period.period_id;
                    var namePeriod = period.period_name;
                    Article newArticle = new Article();
                    newArticle.student_id = idStudent;
                    newArticle.period_id = idPeriod;
                    newArticle.article_tittle = "[" + namePeriod + "]" + title;
                    newArticle.arrticle_content = content;
                    newArticle.article_post_date = DateTime.Now;                    
                    newArticle.article_avatar_img = "~/img/" + pathFileFormat;
                    newArticle.article_status = "Waiting";
                    db.Articles.Add(newArticle);
                    db.SaveChanges();
                        
                    File_post newFilePost = new File_post();                    
                    newFilePost.article_id = newArticle.article_id;
                    string fileName = System.IO.Path.GetFileName(file.FileName);
                    string fileNameFormat = "[" + idStudent + "]" + "["+ newArticle.article_tittle + "[" + fileName ;
                    string attach = System.IO.Path.Combine(
                        Server.MapPath("~/Attachment"), fileNameFormat);
                    file.SaveAs(attach);
                    newFilePost.file_url = "~/Attachment/" + fileNameFormat;
                    newFilePost.time_post = DateTime.Now;
                    newFilePost.file_status = "Editing";
                    db.File_post.Add(newFilePost);
                    db.SaveChanges();
                    ModelState.AddModelError("","Successfully! Please wait new comment...!");
                    return View();
                }
            }
            catch (Exception ex)
            {
                var ErrorMessage = ex;
                ModelState.AddModelError("", ErrorMessage);
                
            }
            return View();
        }

        public ActionResult ViewAllArticle()
        {
            if (checkSessionStudent() == false)
            {
                return RedirectToAction("Login", "Login");
            }
            var id = Session["student"].ToString();
            var listArt = db.Articles.Where(s => s.student_id.Equals(id)).OrderBy(s=>s.article_post_date).ToList();
            return View(listArt);
        }

        public ActionResult Detail(string id)
        {
            var detail = db.CoordinatorHomePages.Where(s=>s.article_id.Equals(id)).ToList();
            return View(detail);
        }
    }
}