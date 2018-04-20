
using BestCarsRental_BO;
using BestCarsRental_DAL;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BestCarsRental_BLL
{
    public class CarTypeManager
    {
        public List<CarTypeModel> GetAllCarTypes()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.CarTypes.Select(carType => new CarTypeModel
                {
                    Manufacturer = carType.Manufacturer,
                    Model = carType.Model,
                    PricePerDay = carType.PricePerDay,
                    PricePerLateDay = carType.PricePerLateDay,
                    ProductionYear = carType.ProductionYear,
                    GearboxType = carType.GearboxType
                }).ToList();
            }
        }

        public List<string> GetAllCarTypesModels()
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                return db.CarTypes.Select(a => a.Model).ToList();
            }
        }

        public CarTypeModel GetCarType(string model)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
                CarType carType = db.CarTypes.FirstOrDefault(at => at.Model == model);

                if (carType != null)
                {
                    return new CarTypeModel
                    {
                        Manufacturer = carType.Manufacturer,
                        Model = carType.Model,
                        PricePerDay = carType.PricePerDay,
                        PricePerLateDay = carType.PricePerLateDay,
                        ProductionYear = carType.ProductionYear,
                        GearboxType = carType.GearboxType
                    };
                }

                return null;
            }
        }

        public bool AddCarType(CarTypeModel carType)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				db.CarTypes.Add(new CarType
				{
					Manufacturer = carType.Manufacturer,
					Model = carType.Model,
					PricePerDay = carType.PricePerDay,
					PricePerLateDay = carType.PricePerLateDay,
					ProductionYear = carType.ProductionYear,
					GearboxType = carType.GearboxType
				});
				db.SaveChanges();
				return true;
			}
        }

        public bool DeleteCarType(string model)
        {
			using (BestCarsRentalEntities db = new BestCarsRentalEntities())
			{
				CarType c2 = db.CarTypes.FirstOrDefault(c3 => c3.Model == model);
				if (c2 != null)
				{
					db.CarTypes.Remove(c2);
					db.SaveChanges();
					return true;
				}
			}
			return false;
        }

        public bool EditCarType(CarTypeModel carType)
        {
            using (BestCarsRentalEntities db = new BestCarsRentalEntities())
            {
				CarType c2 = db.CarTypes.FirstOrDefault(c3 => c3.Model == carType.Model);
				if (c2 != null)
				{
					c2.PricePerDay = carType.PricePerDay;
					c2.PricePerLateDay = carType.PricePerLateDay;
					db.SaveChanges();
					return true;
				}
				return false;

            }
        }
    }
}
