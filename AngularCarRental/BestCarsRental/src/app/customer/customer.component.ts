import { Component, OnInit } from '@angular/core';
import { CustomerService } from './../shared/services/customer.service';
import { Customer } from './../shared/models/customer.model';
import { CustomersListComponent } from '../customers-list/customers-list.component';

@Component({
    selector: 'app-customer',
    templateUrl: './customer.component.html',
    styleUrls: ['./customer.component.css']
})

export class CustomerComponent implements OnInit {
    customer: Customer = new Customer();
    fullName: string = "Name";
    newCustomer: Customer = new Customer();
    addedSuccess: boolean = false;
    deleteSuccess: boolean = false;

    constructor(private customerService: CustomerService) { }

    ngOnInit() {
    }

    onSearchCustomer() {
        let func: (a: Customer) => void = (a: Customer) => {
            this.customer = a;
        }
        this.customerService.getCustomer(this.fullName, func);
    }

    onNewCustomer() {
        this.addedSuccess = false;
        this.customer.Password = "qwertyqwerty";
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.customerService.addCustomer(this.customer, func);
    }

    onUpdateCustomer() {
        this.addedSuccess = false;
        this.customer.Password = "qwertyqwerty";
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.customerService.updateCustomer(this.customer, func);
    }

    onResetCustomer() {
        this.addedSuccess = false;
        this.customer = new Customer();
    }
}
