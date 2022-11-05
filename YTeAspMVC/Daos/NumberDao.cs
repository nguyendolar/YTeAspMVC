using YTeAspMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace YTeAspMVC.Daos
{
    public class NumberDao
    {
        YTeDBContext myDb = new YTeDBContext();
        public List<Number> GetNumberByUser(int id)
        {
            return myDb.Numbers.Where(x => x.IdUser == id).OrderByDescending(x => x.IdNumber).ToList();
        }

        public Number GetById(int id)
        {
            return myDb.Numbers.FirstOrDefault(x => x.IdNumber == id);
        }
    }
}