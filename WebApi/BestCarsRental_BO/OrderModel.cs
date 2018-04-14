using System;
using System.ComponentModel.DataAnnotations;


namespace BestCarsRental_BO
{
    public class OrderModel
    {
        public int OrderID { get; set; }

        [Required]
        public System.DateTime StartDate { get; set; }

        [Required]
        public System.DateTime ExpectedReturnDate { get; set; }

        [Required]
        public Nullable<System.DateTime> ActualReturnDate { get; set; }

        [Required]
        public CarModel Car { get; set; }

        [Required]
        public CustomerModel Customer { get; set; }
    }
}
