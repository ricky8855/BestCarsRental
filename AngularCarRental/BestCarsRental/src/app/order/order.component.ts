import { Component, OnInit } from '@angular/core';
import { OrderService } from './../shared/services/order.service';
import { CarService } from './../shared/services/car.service';
import { CustomerService } from './../shared/services/customer.service';
import { Order } from './../shared/models/order.model';
import { OrdersListComponent } from '../orders-list/orders-list.component';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'app-order',
    templateUrl: './order.component.html',
    styleUrls: ['./order.component.css']
})

export class OrderComponent implements OnInit {
    order: Order = new Order();
    orderID: number = 0;

    addedSuccess: boolean = false;
    deleteSuccess: boolean = false;

    constructor(private orderService: OrderService, private customerService: CustomerService, private carService: CarService) { }
 
    ngOnInit() {
        this.customerService.getCustomers();
        this.carService.getCars();
    }

    onSearchOrder() {
        let func: (a: Order) => void = (a: Order) => {
            this.order = a;
        }
        this.orderService.getOrder(this.orderID, func);
    }

    onNewOrder() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.orderService.addOrder(this.order, func);
    }

    onUpdateOrder() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.orderService.updateOrder(this.order, func);
    }

    onResetOrder() {
        this.addedSuccess = false;
        this.order = new Order();
    }
}
