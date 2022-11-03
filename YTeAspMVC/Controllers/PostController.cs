using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YTeAspMVC.Daos;

namespace YTeAspMVC.Controllers
{
    public class PostController : Controller
    {
        PostDao serviceDao = new PostDao();
        // GET: Post
        public ActionResult Index()
        {
            ViewBag.List = serviceDao.GetAll();
            return View();
        }
    }
}