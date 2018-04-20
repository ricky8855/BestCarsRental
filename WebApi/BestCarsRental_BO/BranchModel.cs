
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class BranchModel
    {
        [Required, Range(-90, 90)]
        public decimal Latitude { get; set; }

        [Required, Range(-180, 180)]
        public decimal Longitude { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string BranchName { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string Address { get; set; }
    }
}
