
using BestCarsRental_BO;
using BestCarsRental_DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BestCarsRental_BLL
{
    public class CustomerManager
    {
        public List<CustomerModel> GetAllCustomers()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Customers.Select(customer => new CustomerModel
                {
                    FullName = customer.FullName,
                    IDNumber = customer.IDNumber,
                    UserName = customer.UserName,
                    BirthDate = customer.BirthDate,
                    Gender = customer.Gender,
                    Email = customer.Email,
                    Password = customer.Password,
                    Photo = customer.Photo
                }).ToList();
            }
        }

        public List<string> GetAllCustomersUserNames()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Customers.Select(a => a.UserName).ToList();
            }
        }

        public CustomerModel GetCustomer(string name)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Customer customer = db.Customers.FirstOrDefault(at => (at.FullName == name || at.UserName == name ));

                if (customer != null)
                {
                    return new CustomerModel
                    {
                        FullName = customer.FullName,
                        IDNumber = customer.IDNumber,
                        UserName = customer.UserName,
                        BirthDate = customer.BirthDate,
                        Gender = customer.Gender,
                        Email = customer.Email,
                        Password = customer.Password,
                        Photo = customer.Photo
                    };
                }

                return null;
            }
        }

        public bool AddCustomer(CustomerModel customer)
        {
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    // Check if already exist
                    Customer c2 = db.Customers.Where(c => c.IDNumber == customer.IDNumber).FirstOrDefault();
                    if (c2 != null)
                    {   
                        return false;
                    }

                    db.Customers.Add(new Customer
                    {
                        FullName = customer.FullName,
                        IDNumber = customer.IDNumber,
                        UserName = customer.UserName,
                        BirthDate = customer.BirthDate,
                        Gender = customer.Gender,
                        Email = customer.Email,
                        Password = customer.Password,
                        Photo = customer.Photo

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

        public bool DeleteCustomer(string name)
        {
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    Customer customer = db.Customers.FirstOrDefault(c3 => c3.FullName == name);
                    if (customer != null)
                    {
                        db.Customers.Remove(customer);
                        db.SaveChanges();
                        return true;
                    }
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EditCustomer(CustomerModel customer)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                try
                {
                    Customer at = db.Customers.FirstOrDefault(c3 => c3.FullName == customer.FullName);
                    if (at != null)
                    {
                        at.Password = customer.Password;
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
