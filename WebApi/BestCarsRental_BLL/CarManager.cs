using BestCarsRental_BO;
using BestCarsRental_DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BestCarsRental_BLL
{
    public class CarManager
    {
        BranchManager branchManager = new BranchManager();
        CarTypeManager carTypeManager = new CarTypeManager();

        public BranchModel GetBranch(string name)
        {
            return branchManager.GetBranch(name);
        }
        public CarTypeModel GetCarType(string model)
        {
            return carTypeManager.GetCarType(model);
        }
        public List<CarModel> GetAllCars()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Cars.Select(a => new CarModel
                {
                    CarNumber = a.CarNumber,
                    Mileage = a.Mileage,
                    Image = a.Image,
                    BestCondition = a.BestCondition,
                    Branch = new BranchModel
                    {
                        Latitude = a.Branch.Latitude,
                        Longitude = a.Branch.Longitude,
                        BranchName = a.Branch.BranchName,
                        Address = a.Branch.Address
                    },
                    CarType = new CarTypeModel
                    {
                        Manufacturer = a.CarType.Manufacturer,
                        Model = a.CarType.Model,
                        PricePerDay = a.CarType.PricePerDay,
                        PricePerLateDay = a.CarType.PricePerLateDay,
                        ProductionYear = a.CarType.ProductionYear,
                        GearboxType = a.CarType.GearboxType
                    }
                }).ToList();
            }
        }

        public List<string> GetAllCarsNumbers()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.Cars.Select(a => a.CarNumber).ToList();
            }
        }

        public List<CarModel> GetCarsByBranchModel(string branch, string model)
        {
            List<CarModel> emptyList = new List<CarModel>();
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Branch branch1 = db.Branches.Where(br => br.BranchName == branch).FirstOrDefault();
                if (branch == null)
                {
                  
                    return emptyList;
                }
                CarType carType1 = db.CarTypes.Where(c => c.Model == model).FirstOrDefault();
                if (carType1 == null)
                {
                    
                    return emptyList;
                }

                return db.Cars.Where(a => a.BranchID == branch1.BranchID && a.CarTypeID == carType1.CarTypeID)
                             .Select(a => new CarModel
                             {
                                 CarNumber = a.CarNumber,
                                 Mileage = a.Mileage,
                                 Image = a.Image,
                                 BestCondition = a.BestCondition,
                                 Branch = new BranchModel
                                 {
                                     Latitude = a.Branch.Latitude,
                                     Longitude = a.Branch.Longitude,
                                     BranchName = a.Branch.BranchName,
                                     Address = a.Branch.Address
                                 },
                                 CarType = new CarTypeModel
                                 {
                                     Manufacturer = a.CarType.Manufacturer,
                                     Model = a.CarType.Model,
                                     PricePerDay = a.CarType.PricePerDay,
                                     PricePerLateDay = a.CarType.PricePerLateDay,
                                     ProductionYear = a.CarType.ProductionYear,
                                     GearboxType = a.CarType.GearboxType
                                 }
                             }).ToList();

            }
        }

        public CarModel GetCar(string carNumber)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                Car bestCar = db.Cars.FirstOrDefault(at => at.CarNumber == carNumber);

                if (bestCar != null)
                {
                    return new CarModel
                    {
                        CarNumber = bestCar.CarNumber,
                        Mileage = bestCar.Mileage,
                        Image = bestCar.Image,
                        BestCondition = bestCar.BestCondition,
                        Branch = new BranchModel(bestCar.Branch),
                        CarType = new CarTypeModel
                        {
                            Manufacturer = bestCar.CarType.Manufacturer,
                            Model = bestCar.CarType.Model,
                            PricePerDay = bestCar.CarType.PricePerDay,
                            PricePerLateDay = bestCar.CarType.PricePerLateDay,
                            ProductionYear = bestCar.CarType.ProductionYear,
                            GearboxType = bestCar.CarType.GearboxType
                        }
                    };
                }
                return null;
            }
        }

        public bool AddCar(CarModel carModel)
        {
             try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    Branch branch = db.Branches.Where(br => br.BranchName == carModel.Branch.BranchName).FirstOrDefault();
                    if (branch == null)
                    {
                        //     errorMessage = "Car not found";
                        return false;
                    }
                    CarType carType = db.CarTypes.Where(c => c.Model == carModel.CarType.Model).FirstOrDefault();
                    if (carType == null)
                    {
                        //      errorMessage = "User not found";
                        return false;
                    }
                    db.Cars.Add(new Car
                    {
                        BranchID = branch.BranchID,
                        CarTypeID = carType.CarTypeID,
                        CarNumber = carModel.CarNumber,
                        Mileage = carModel.Mileage,
                        Image = carModel.Image,
                        BestCondition = carModel.BestCondition
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


        public bool DeleteCar(string carNumber)
        {
            try
            {
                using (BestCarsRentalEntities db = new BestCarsRentalEntities())
                {
                    Car bestCar = db.Cars.FirstOrDefault(c3 => c3.CarNumber == carNumber);
                    if (bestCar != null)
                    {
                        db.Cars.Remove(bestCar);
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

        public bool EditCar(CarModel car)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                try
                {
                    Car car2 = db.Cars.FirstOrDefault(car3 => car3.CarNumber == car.CarNumber);
                    if (car2 != null)
                    {
                        car2.Mileage = car.Mileage;
                        car2.BestCondition = car.BestCondition;
                        car2.Image = car.Image;
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
