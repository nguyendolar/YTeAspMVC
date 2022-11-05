using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YTeAspMVC.Daos;
using YTeAspMVC.Models;

namespace YTeAspMVC.Controllers
{
    public class AuthencationController : Controller
    {
        UserDao userDao = new UserDao();
        NumberDao numberDao = new NumberDao();
        // GET: Authencation
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Singup()
        {
            return View();
        }

        public ActionResult Information(string msg)
        {
            User user = (User)Session["USER"];
            ViewBag.mess = msg;
            ViewBag.User = userDao.getById(user.IdUser);
            return View();
        }

        public ActionResult HistoryNumber()
        {
            User user = (User)Session["USER"];
            ViewBag.List = numberDao.GetNumberByUser(user.IdUser);
            return View();
        }

        public ActionResult Print(int id)
        {
            ViewBag.Number = numberDao.GetById(id);
            return View();
        }

        public ActionResult HistoryBooking()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(User user)
        {
            bool checkLogin = userDao.checkLogin(user.Email, user.Password);
            if (checkLogin)
            {
                var userInformation = userDao.getUserByEmail(user.Email);
                Session.Add("USER", userInformation);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.mess = "Error";
                return View("Login");
            }

        }

        [HttpPost]
        public ActionResult Singup(User user)
        {
            
            bool checkExistUserName = userDao.checkExistEmail(user.Email);
            if (checkExistUserName)
            {
                ViewBag.mess = "ErrorExist";
                return View("Singup");
            }
            else
            {
                user.IdRole = 1;
                user.Status = 1;
                user.Created = DateTime.Now.ToString();
                userDao.Add(user);
                ViewBag.mess = "Success";
                return View("Singup");
            }
        }

        [HttpPost]
        public ActionResult Update(User user)
        {
            userDao.Update(user);
            return RedirectToAction("Information", new { msg = "Success" });
        }
        public ActionResult Logout()
        {
            Session.Remove("User");
            return Redirect("/Home/Index");
        }
    }
}