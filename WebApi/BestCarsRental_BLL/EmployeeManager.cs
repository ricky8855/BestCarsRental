using BestCarsRental_BO;
using BestCarsRental_DAL;

using System.Collections.Generic;
using System.Linq;

namespace BestCarsRental_BLL
{
    public class EmployeeManager
    {
        public List<EmployeeModel> GetAllEmployees()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Employees.Select(emp => new EmployeeModel
                {
                    UserName = emp.UserName,
                    Title = emp.Title,
                    Password = emp.Password
                }).ToList();
            }
        }


        public EmployeeModel GetEmployee(string name)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Employee emp = db.Employees.FirstOrDefault(at => at.UserName == name);

                if (emp != null)
                {
                    return new EmployeeModel
                    {
                        UserName = emp.UserName,
                        Title = emp.Title,
                        Password = emp.Password
                    };
                }
                return null;
            }
        }

        public bool AddEmployee(EmployeeModel emp)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				db.Employees.Add(new Employee
				{
					UserName = emp.UserName,
					Title = emp.Title,
					Password = emp.Password
				});
				db.SaveChanges();
				return true;
			}
        }


        public bool DeleteEmployee(string name)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				Employee emp = db.Employees.FirstOrDefault(e3 => e3.UserName == name);
				if (emp != null)
				{
					db.Employees.Remove(emp);
					db.SaveChanges();
					return true;
				}
			}
			return false;

        }


        public bool EditEmployee(EmployeeModel emp)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
				Employee e2 = db.Employees.FirstOrDefault(e3 => e3.UserName == emp.UserName);
				if (e2 != null)
				{
					e2.Password = emp.Password;
					db.SaveChanges();
					return true;
				}
				return false;
            }
        }
    }
}
