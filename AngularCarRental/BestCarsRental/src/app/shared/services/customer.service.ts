import { Injectable } from '@angular/core';
import { Customer } from './../models/customer.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';


@Injectable()
export class CustomerService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    customersList: Customer[];

    constructor(private myHttpClient: HttpClient) { }

    getCustomers(): void {
        let func: (a: Array<Customer>) => void = (a: Array<Customer>) => {
            this.customersList = a;
        }
         
        this.myHttpClient.get<Array<Customer>>(this.webApiUrl.url + "/api/customer/all")
            .subscribe(
            func
            );
    }

    getAllCustomersUserNames________(callBack: (b: Array<string>) => void): void {
        this.myHttpClient.get<Array<string>>(this.webApiUrl.url + "/api/customer/usernames")
            .subscribe(
            callBack
            );
    }
 
    getCustomer(customerName: string, callBack: (b: Customer) => void): void {
        this.myHttpClient.get<Customer>(this.webApiUrl.url + "/api/customer/" + customerName)
            .subscribe(
                callBack
            );
    }

    deleteCustomer(customerName: string, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/customer/" + customerName)
            .subscribe(
            callBack
            );
    }


    registerCustomer(customer: Customer, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/users/cregister", customer)
            .subscribe(
            callBack
            );
    }

    addCustomer(customer: Customer, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/customer/add", customer)
            .subscribe(
            callBack
            );
    }

    updateCustomer(customer: Customer, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/customer/edit", customer)
            .subscribe(
            callBack
            );
    }
}