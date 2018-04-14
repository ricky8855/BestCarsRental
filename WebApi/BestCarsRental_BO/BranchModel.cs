using BestCarsRental_DAL;
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class BranchModel
    {

        public BranchModel() { }
        public BranchModel(Branch branch)
        {
            Latitude = branch.Latitude;
            Longitude = branch.Longitude;
            BranchName = branch.BranchName;
            Address = branch.Address;
        }

        [Required, Range(2, 100)]
        public decimal Latitude { get; set; }

        [Required, Range(2, 100)]
        public decimal Longitude { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string BranchName { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string Address { get; set; }
    }
}
