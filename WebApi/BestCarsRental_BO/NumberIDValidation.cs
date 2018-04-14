using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BestCarsRental_BO
{
    class NumberIDValidation : ValidationAttribute
    {
        private int sumDigits(int num)
        {
            int sum = 0;
            while (num > 0)
            {
                sum += num % 10;
                num = (int)(num / 10);
            }
            return sum;
        }

        public override bool IsValid(object value)
        {
            string idNumber = (string)(value);   
            int sum = 0;
            int n2;

            if ( ! idNumber.All(Char.IsDigit) )
            {
                return false;
            }

            idNumber = idNumber.PadLeft(9, '0');

            sum += idNumber[0] - '0';
            for (int i = 1; i < idNumber.Length - 1; i += 2)
            {
                n2 = (int)(idNumber[i] - '0') * 2;

                if (n2 >= 10)
                {
                    n2 = this.sumDigits(n2);
                }
                sum += n2;
                sum += idNumber[i + 1] - '0';
            }

            if (sum % 10 != 0)
            {
                return false;
            }
            return true;
        }
    }
}
