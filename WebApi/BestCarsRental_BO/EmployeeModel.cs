using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class EmployeeModel
    {
        [Required, MinLength(6), MaxLength(15)]
        public string UserName { get; set; }

        [Required, MinLength(2), MaxLength(50)]
        public string Title { get; set; }

        [Required, MinLength(8), MaxLength(256)]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
