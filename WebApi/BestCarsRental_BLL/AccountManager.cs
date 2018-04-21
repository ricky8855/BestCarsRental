using BestCarsRental_BO;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using BestCarsRental_DAL;

namespace BestCarsRental_BLL
{
    public class AccountManager
    {
        public List<string> GetAllUserNames()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Users.Select(a => a.UserName).ToList();
            }
        }

        public bool AddCustomer(CustomerModel model)
        {        
            var userStore = new UserStore<ApplicationUser>(new ApplicationDbContext());
            var manager = new UserManager<ApplicationUser>(userStore);
            CustomerIdentityUser customer = new CustomerIdentityUser
            {
                FullName = model.FullName,
                IDNumber = model.IDNumber,
                BirthDate = model.BirthDate,
                Gender = model.Gender,
                Password = model.Password,
                Photo = model.Photo,

                UserName = model.UserName,
                Email = model.Email
            };

            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 3
            };
            IdentityResult result = manager.Create(customer, model.Password);
            return true;
        }

        public bool AddEmployee(EmployeeModel model)
        {
            var userStore = new UserStore<ApplicationUser>(new ApplicationDbContext());
            var manager = new UserManager<ApplicationUser>(userStore);
            EmployeeIdentityUser employee = new EmployeeIdentityUser
            {
                UserName = model.UserName,
                Email = model.Email
            };

            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 3
            };
            IdentityResult result = manager.Create(employee, model.Password);
            return true;
        }
    }
}
