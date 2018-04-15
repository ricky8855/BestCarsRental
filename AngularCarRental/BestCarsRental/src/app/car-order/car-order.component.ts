import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Car } from './../shared/models/car.model';
import { Order } from './../shared/models/order.model';
import { Customer } from './../shared/models/customer.model';
import { CarService } from './../shared/services/car.service';
import { OrderService } from './../shared/services/order.service';
import { CustomerService } from './../shared/services/customer.service';

@Component({
    selector: 'app-car-order',
    templateUrl: './car-order.component.html',
    styleUrls: ['./car-order.component.css']
})
export class CarOrderComponent implements OnInit {
    carNumber: string = "";

    order: Order = new Order();
    daysNumber: number;
    totalPrice: number;
    toatlCalculated: boolean = false;
    userName: string;
    addedSuccess: boolean = false;

    constructor(private route: ActivatedRoute, private orderService: OrderService, private carService: CarService, private customerService: CustomerService) {
    }

    ngOnInit() {
        let getCarNumber: (strnumber: string) => void = (strnumber: string) => {
            this.carNumber = strnumber;
        }
        this.route.params.subscribe(params => getCarNumber(params['carnumber']));

        let getCar: (c: Car) => void = (c: Car) => {
            this.order.Car = c;
        }
        this.carService.getCar(this.carNumber, getCar);
    }

    calcDaysAndPrice() {
        var startD = new Date(this.order.StartDate);
        var endD = new Date(this.order.ExpectedReturnDate);
        var startD_ms = startD.getTime();
        var endD_ms = endD.getTime();

        this.daysNumber = Math.round((endD_ms - startD_ms) / (1000 * 60 * 60 * 24));
        this.totalPrice = this.daysNumber * this.order.Car.CarType.PricePerDay;

        if (this.daysNumber > 0 && this.totalPrice > 0) {
            this.toatlCalculated = true;
        }

    }

    makeOrder() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.orderService.addOrder(this.order, func);
    }
    
    onNewOrder() {
        let func: (c: Customer) => void = (c: Customer) => {
            this.order.Customer = c
            console.log(" Ready to order");
            this.makeOrder();
        }
        this.customerService.getCustomer(this.userName, func);

    }
}
