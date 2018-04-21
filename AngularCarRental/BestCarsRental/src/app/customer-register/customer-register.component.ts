import { Component, OnInit } from '@angular/core';
import { CustomerService } from './../shared/services/customer.service';
import { Customer } from './../shared/models/customer.model';
 
@Component({
  selector: 'app-customer-register',
  templateUrl: './customer-register.component.html',
  styleUrls: ['./customer-register.component.css']
})
export class CustomerRegisterComponent implements OnInit {
    customer: Customer = new Customer();
 
    addedSuccess: boolean = false;
    
  constructor(private customerService: CustomerService) { }

  ngOnInit() {
  }

  onRegister() {
    this.addedSuccess = false;
     
    let func: (b: boolean) => void = (b: boolean) => {
        this.addedSuccess = b;
    }
    this.customerService.registerCustomer(this.customer, func);
 }

}
