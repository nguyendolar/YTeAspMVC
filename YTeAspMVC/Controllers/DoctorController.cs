using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YTeAspMVC.Daos;

namespace YTeAspMVC.Controllers
{
    public class DoctorController : Controller
    {
        DoctorDao doctorDao = new DoctorDao();
        // GET: Doctor
        public ActionResult Index()
        {
            ViewBag.List = doctorDao.GetAll();
            return View();
        }
    }
}