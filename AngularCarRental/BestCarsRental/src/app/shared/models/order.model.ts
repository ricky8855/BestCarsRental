import { Car } from './car.model';
import { Customer } from './customer.model';

    export class Order {
        OrderID: number;
        StartDate: Date = new Date();
        ExpectedReturnDate: Date = new Date();
        ActualReturnDate: Date = new Date();

		Car: Car = new Car();
		Customer: Customer = new Customer();
    }
