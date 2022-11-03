using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YTeAspMVC.Daos;

namespace YTeAspMVC.Controllers
{
    public class ServiceController : Controller
    {
        ServiceDao postDao = new ServiceDao();
        // GET: Service
        public ActionResult Index()
        {
            ViewBag.List = postDao.GetAll();
            return View();
        }
    }
}