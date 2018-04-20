
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class CarModel
    {    
        [Required]
        public int Mileage { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string Image { get; set; }

        [Required]
        public int BestCondition { get; set; }

        [Required, MinLength(6), MaxLength(12)]
        public string CarNumber { get; set; }

        [Required]
        public BranchModel Branch { get; set; }

        [Required]
        public CarTypeModel CarType { get; set; }
    }
}
