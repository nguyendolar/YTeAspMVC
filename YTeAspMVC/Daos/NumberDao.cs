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
        /*public List<Insurance> GetInsuranceDown()
        {
            return myDb.insurances.OrderBy(x => x.price).Take(6).ToList();
        }
        public Insurance GetInsurance(int id)
        {
            return myDb.insurances.FirstOrDefault(x => x.idInsurance == id);
        }
        public List<Insurance> GetAll()
        {
            return myDb.insurances.ToList();
        }

        public List<Insurance> GetInsurance(int page, int pagesize)
        {
            var arrIdInsurances = myDb.insurances.Where(x => x.status == 1).Select(x => x.idInsurance).ToList();
            return myDb.insurances.ToList().Skip((page - 1) * pagesize).Take(pagesize).ToList();
        }
        public int GetNumberRoom()
        {
            var arrIdRoom = myDb.insurances.Where(x => x.status == 1).Select(x => x.idInsurance).ToList().Count();
           *//* int total = myDb.insurances.Where(x => !arrIdRoom.Contains(x.idInsurance)).ToList().Count;*//*
            int count = 0;
            count = arrIdRoom / 6;
            if (arrIdRoom % 6 != 0)
            {
                count++;
            }
            return count;
        }

        public void Add(Insurance insurance)
        {
            myDb.insurances.Add(insurance);
            myDb.SaveChanges();
        }

        public void Update(Insurance insurance)
        {
            var obj = myDb.insurances.FirstOrDefault(x => x.idInsurance == insurance.idInsurance);
            obj.name = insurance.name;
            obj.description = insurance.description;
            obj.image = insurance.image;
            obj.price = insurance.price;
            myDb.SaveChanges();
        }
        public void Delete(int id)
        {
            var obj = myDb.insurances.FirstOrDefault(x => x.idInsurance == id);
            myDb.insurances.Remove(obj);
            myDb.SaveChanges();
        }*/
    }
}