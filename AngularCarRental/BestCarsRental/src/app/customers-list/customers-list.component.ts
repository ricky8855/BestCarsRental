import { Component, OnInit } from '@angular/core';
import { CustomerService } from './../shared/services/customer.service';
import { Customer } from './../shared/models/customer.model';
import { CustomerComponent } from '../customer/customer.component';

@Component({
    selector: 'app-customers-list',
    templateUrl: './customers-list.component.html',
    styleUrls: ['./customers-list.component.css']
})

export class CustomersListComponent implements OnInit {

  
    deleteSuccess: boolean = false;

    constructor(private customerService: CustomerService, private empComponent: CustomerComponent) { }

    ngOnInit() {
        this.customerService.getCustomers();
    }

    showForEdit(customer: Customer) {
        this.empComponent.customer= customer;
    }

    onDeleteCustomer(fullName: string) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.customerService.deleteCustomer(fullName, func);
    }
}
