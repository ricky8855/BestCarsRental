
using BestCarsRental_BO;
using BestCarsRental_DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BestCarsRental_BLL
{
    public class OrderManager
    {
        public List<OrderModel> GetAllOrders()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Orders.Select(a => new OrderModel
                {
                    OrderID = a.OrderID,
                    StartDate = a.StartDate,
                    ExpectedReturnDate = a.ExpectedReturnDate,
                    ActualReturnDate = a.ActualReturnDate,
                    Car = new CarModel
                    {
                        CarNumber = a.Car.CarNumber,
                        Mileage = a.Car.Mileage,
                        Image = a.Car.Image,
                        BestCondition = a.Car.BestCondition
                    },
                    Customer = new CustomerModel
                    {
                        FullName = a.Customer.FullName,
                        IDNumber = a.Customer.IDNumber,
                        UserName = a.Customer.UserName,
                        BirthDate = a.Customer.BirthDate,
                        Gender = a.Customer.Gender,
                        EMail = a.Customer.EMail,
                        Password = a.Customer.Password,
                        Photo = a.Customer.Photo
                    }
                    }).ToList();
            }
        }

        public OrderModel GetOrder(int orderID)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Order a = db.Orders.FirstOrDefault(at => at.OrderID == orderID);

                if (a != null)
                {
                    return new OrderModel
                    {
                        OrderID = a.OrderID,
                        StartDate = a.StartDate,
                        ExpectedReturnDate = a.ExpectedReturnDate,
                        ActualReturnDate = a.ActualReturnDate
                    };
                }

                return null;
            }
        }

        public bool AddOrder(OrderModel order)
        {
          //  string errorMessage = "";
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    Car car = db.Cars.Where(c => c.CarNumber == order.Car.CarNumber).FirstOrDefault();
                    if (car == null)
                    {
                   //     errorMessage = "Car not found";
                        return false;
                    }
                    Customer customer = db.Customers.Where(u => u.UserName == order.Customer.UserName).FirstOrDefault();
                    if (customer == null)
                    {
                  //      errorMessage = "User not found";
                        return false;
                    }
                    db.Orders.Add(new Order
                    {
                        CarID = car.CarID,
                        CustomerID = customer.CustomerID,
                        
                        StartDate = order.StartDate,
                        ExpectedReturnDate = order.ExpectedReturnDate,
                        ActualReturnDate = order.ActualReturnDate
                    });
                    db.SaveChanges();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool AddOrder2(OrderModel order)
        {
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    db.Orders.Add(new Order
                    {
                        StartDate = order.StartDate,
                        ExpectedReturnDate = order.ExpectedReturnDate,
                        ActualReturnDate = order.ActualReturnDate

                    });
                    db.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool DeleteOrder(int orderID)
        {
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    Order a = db.Orders.FirstOrDefault(c3 => c3.OrderID == orderID);
                    if (a != null)
                    {
                        db.Orders.Remove(a);
                        db.SaveChanges();
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                var t = ex.InnerException;
                return false;
            }
        }

        public bool EditOrder(OrderModel a)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                try
                {
                    Order at = db.Orders.FirstOrDefault(c3 => c3.OrderID == a.OrderID);
                    if (at != null)
                    {
                        at.ActualReturnDate = a.ActualReturnDate;
                        db.SaveChanges();
                        return true;
                    }
                    return false;

                }
                catch (Exception)
                {
                    return false;
                }
            }
        }
    }
}
