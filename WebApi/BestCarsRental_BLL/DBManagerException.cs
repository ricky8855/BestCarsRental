using System;

namespace BestCarsRental_BLL
{
    public class DBManagerException : Exception
    {
        public virtual string exMessage { get; }
        public DBManagerException(string message, Exception inner) : base(message)
        {
            exMessage = message;
        }
    }
}
