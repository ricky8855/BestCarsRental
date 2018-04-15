using BestCarsRental_DAL;
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class CarTypeModel
    {
 
        [Required, MinLength(2), MaxLength(20)]
        public string Manufacturer { get; set; }

        [Required, MinLength(2), MaxLength(20)]
        public string Model { get; set; }

        [Required, Range(1, 500)]
        public decimal PricePerDay { get; set; }

        [Required, Range(2, 1000)]
        public decimal PricePerLateDay { get; set; }

        [Required]
        public string ProductionYear { get; set; }

        [Required]
        public int GearboxType { get; set; }
    }
}
