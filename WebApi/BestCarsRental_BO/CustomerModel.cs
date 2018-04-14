using BestCarsRental_DAL;
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    public class CustomerModel
    {
        [Required, MinLength(6), MaxLength(50)]
        public string FullName { get; set; }

        [Required, NumberIDValidation]
        public string IDNumber { get; set; }

        [Required, MinLength(6), MaxLength(10)]
        public string UserName { get; set; }

        [Required]
        public System.DateTime BirthDate { get; set; }

        [Required]
        public int Gender { get; set; }

     //   [DataType(DataType.EmailAddress)]
        public string EMail { get; set; }

        [Required, MinLength(8), MaxLength(256)]
       // [DataType(DataType.Password)]
        public string Password { get; set; }

        [MaxLength(50)]
        public string Photo { get; set; }
    }
}
