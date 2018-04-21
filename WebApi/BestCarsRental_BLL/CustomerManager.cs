
using BestCarsRental_BO;
using BestCarsRental_DAL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
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
                return db.Users.Select(customer => new CustomerModel
                {
                    FullName = customer.FullName,
                    IDNumber = customer.IDNumber,
                    UserName = customer.UserName,
                //    BirthDate = customer.BirthDate,
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
                return db.Users.Select(a => a.UserName).ToList();
            }
        }

        public CustomerModel GetCustomer(string name)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                User customer = db.Users.FirstOrDefault(at => (at.FullName == name || at.UserName == name ));

                if (customer != null)
                {
                    return new CustomerModel
                    {
                        FullName = customer.FullName,
                        IDNumber = customer.IDNumber,
                        UserName = customer.UserName,
                    //    BirthDate = customer.BirthDate,
                        Gender = customer.Gender,
                        Email = customer.Email,
                        Password = customer.Password,
                        Photo = customer.Photo
                    };
                }

                return null;
            }
        }

        public bool AddCustomer(CustomerModel customerModel)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				// Check if already exist
				User c2 = db.Users.Where(c => c.IDNumber == customerModel.IDNumber).FirstOrDefault();
				if (c2 != null)
				{   
					return false;
				}
                var userStore = new UserStore<ApplicationUser>(new ApplicationDbContext());
                var userManager = new UserManager<ApplicationUser>(userStore);
                CustomerIdentityUser customerIdentity = new CustomerIdentityUser
                {
                    FullName = customerModel.FullName,
                    IDNumber = customerModel.IDNumber,
                    BirthDate = customerModel.BirthDate,
                    Gender = customerModel.Gender,
                    Password = customerModel.Password,
                    Photo = customerModel.Photo,

                    UserName = customerModel.UserName,
                    Email = customerModel.Email
                };

                IdentityResult result = userManager.Create(customerIdentity, customerModel.Password);
               
				return true;
			}
        }

        public bool DeleteCustomer(string name)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				User customer = db.Users.FirstOrDefault(c3 => c3.FullName == name);
				if (customer != null)
				{
					db.Users.Remove(customer);
					db.SaveChanges();
					return true;
				}
			}
			return false;
        }

        public bool EditCustomer(CustomerModel customer)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
				User at = db.Users.FirstOrDefault(c3 => c3.FullName == customer.FullName);
				if (at != null)
				{
					at.Password = customer.Password;
					db.SaveChanges();
					return true;
				}
				return false;
            }
        }
    }
}
