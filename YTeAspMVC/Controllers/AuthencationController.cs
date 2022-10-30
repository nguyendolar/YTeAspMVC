using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YTeAspMVC.Controllers
{
    public class AuthencationController : Controller
    {
        // GET: Authencation
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Singup()
        {
            return View();
        }
    }
}