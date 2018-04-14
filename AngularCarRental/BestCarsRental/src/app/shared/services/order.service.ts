import { Injectable } from '@angular/core';
import { Order } from './../models/order.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';


@Injectable()
export class OrderService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    ordersList: Order[];

    constructor(private myHttpClient: HttpClient) { }

    getOrders(): void {
        let func: (a: Array<Order>) => void = (a: Array<Order>) => {
            this.ordersList = a;
        }
       
        this.myHttpClient.get<Array<Order>>(this.webApiUrl.url + "/api/order/all")
            .subscribe(
            func
            );
    }

    getOrder(id: number, callBack: (b: Order) => void): void {
        this.myHttpClient.get<Order>(this.webApiUrl.url + "/api/order/" + id)
            .subscribe(
            callBack
            );
    }

    deleteOrder(id: number, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/order/" + id)
            .subscribe(
            callBack
            );
    }

    addOrder(order: Order, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/order/add", order)
            .subscribe(
            callBack
            );
    }

    updateOrder(order: Order, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/order/edit", order)
            .subscribe(
            callBack
            );
    }
}