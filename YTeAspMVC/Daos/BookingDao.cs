using YTeAspMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YTeAspMVC.Daos
{
    public class BookingDao
    {
        YTeDBContext myDb = new YTeDBContext();

        public void Add(Booking booking)
        {
            myDb.Bookings.Add(booking);
            myDb.SaveChanges();
        }

        public List<Booking> GetBookingByUser(int idUser)
        {
            return myDb.Bookings.Where(x => x.IdUser == idUser).ToList();
        }

        public List<Booking> GetBookingByDoctor(int idDoctor)
        {
            return myDb.Bookings.Where(x => x.IdDoctor == idDoctor).ToList();
        }


        public List<Booking> GetAll()
        {
            return myDb.Bookings.ToList();
        }

        public Booking GetDetail(int id)
        {
            return myDb.Bookings.FirstOrDefault(x => x.IdBooking == id);
        }

        public void Approve(int id)
        {
            var obj = myDb.Bookings.FirstOrDefault(x => x.IdBooking == id);
            obj.Status = 1;
            myDb.SaveChanges();
        }
    }
}