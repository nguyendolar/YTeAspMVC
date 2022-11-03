using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YTeAspMVC.Daos;

namespace YTeAspMVC.Controllers
{
    public class HomeController : Controller
    {
        DoctorDao doctorDao = new DoctorDao();
        ServiceDao serviceDao = new ServiceDao();
        PostDao postDao = new PostDao();
        public ActionResult Index()
        {
            ViewBag.Doctor = doctorDao.GetTop3();
            ViewBag.Service = serviceDao.GetTop3();
            ViewBag.Post = postDao.GetTop3();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}