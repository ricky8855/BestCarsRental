import { Component, OnInit } from '@angular/core';
import { OrderService } from './../shared/services/order.service';
import { Order } from './../shared/models/order.model';
import { OrderComponent } from '../order/order.component';

@Component({
    selector: 'app-orders-list',
    templateUrl: './orders-list.component.html',
    styleUrls: ['./orders-list.component.css']
})

export class OrdersListComponent implements OnInit {

    ordersList: Order[];
    deleteSuccess: boolean = false;

    constructor(private orderService: OrderService, private orderComponent: OrderComponent) { }

    ngOnInit() {
        this.orderService.getOrders();
    }

    showForEdit(order: Order) {
        Object.assign(this.orderComponent.order, order);
    }


    onDeleteOrder(orderID: number) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.orderService.deleteOrder(orderID, func);
    }
}
