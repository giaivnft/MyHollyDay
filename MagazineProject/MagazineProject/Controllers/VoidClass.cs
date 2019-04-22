using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Web.Mvc;
using System.Web.UI;
using System.Text;
using System.Security.Cryptography;

namespace MagazineProject.Controllers
{
    public class VoidClass
    {
        public bool mail(string e_to,string subject,string body)
        {
            try
            {
                var e_from = "OlyzonTac@gmail.com";                             
                MailMessage message = new MailMessage();
                message.To.Add(e_to);
                message.From = new MailAddress(e_from);
                message.Subject = subject;
                message.Body = body;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("OlyzonTac@gmail.com", "a555z555");
                client.Send(message);
                return true;
            }
            catch (Exception e)
            {
                return false;
                throw;
            }
        }

        public string encodeMD5(string str)
        {
            string pw = "";
            byte[] buffer = Encoding.UTF8.GetBytes(str);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            for (int i = 0; i < buffer.Length; i++)
            {
                pw += buffer[i].ToString("x2");
            }
            return pw;
        }
        
    }
}