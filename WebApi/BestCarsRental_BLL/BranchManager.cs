using BestCarsRental_BO;
using System;
using System.Collections.Generic;
using System.Linq;
using BestCarsRental_DAL;

namespace BestCarsRental_BLL
{
    public class BranchManager
    {
        public List<BranchModel> GetAllBranches()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Branches.Select(a => new BranchModel
                {
                    BranchName = a.BranchName,
                    Address = a.Address,
                    Latitude = a.Latitude,
                    Longitude = a.Longitude
                }).ToList();
            }
        }

        public List<string> GetAllBranchesNames()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Branches.Select(a => a.BranchName).ToList();
            }
        }

        public BranchModel GetBranch(string name)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Branch a = db.Branches.FirstOrDefault(at => at.BranchName == name);

                if (a != null)
                {
                    return new BranchModel
                    {
                        BranchName = a.BranchName,
                        Address = a.Address,
                        Latitude = a.Latitude,
                        Longitude = a.Longitude
                    };
                }

                return null;
            }
        }

        public bool AddBranch(BranchModel a)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				db.Branches.Add(new Branch
				{
					BranchName = a.BranchName,
					Address = a.Address,
					Latitude = a.Latitude,
					Longitude = a.Longitude
				});
				db.SaveChanges();
				return true;
			}
        }

        public bool DeleteBranch(string name)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				Branch br = db.Branches.FirstOrDefault(br3 => br3.BranchName == name);
				if (br != null)
				{
					db.Branches.Remove(br);
					db.SaveChanges();
					return true;
				}
			}
			return false;
	}

        public bool EditBranch(BranchModel branchModel)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
				Branch br = db.Branches.FirstOrDefault(br3 => br3.BranchName == branchModel.BranchName);
				if (br != null)
				{
					br.Address = branchModel.Address;
					db.SaveChanges();
					return true;
				}
				return false;
             }
        }
    }
}
