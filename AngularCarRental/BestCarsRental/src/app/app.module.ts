import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from "@angular/router";
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from "@angular/forms";
import { HttpModule } from '@angular/http'

//modules
import { AppRoutingModule }  from './app.routing.module';

//components
import { AppComponent } from './app.component';

import { HomeComponent } from './home/home.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';

import { BranchComponent } from './branch/branch.component';
import { BranchesListComponent } from './branches-list/branches-list.component';

import { CarComponent } from './car/car.component';
import { CarsListComponent } from './cars-list/cars-list.component';
import { CarsDisplayComponent } from './cars-display/cars-display.component';
import { CarOrderComponent } from './car-order/car-order.component';

import { CarTypeComponent } from './car-type/car-type.component';
import { CarTypesListComponent } from './car-types-list/car-types-list.component';

import { CustomerComponent } from './customer/customer.component';
import { CustomersListComponent } from './customers-list/customers-list.component';

import { EmployeeComponent } from './employee/employee.component';
import { EmployeesListComponent } from './employees-list/employees-list.component';

import { OrderComponent } from './order/order.component';
import { OrdersListComponent } from './orders-list/orders-list.component';

import { ManagerComponent } from './manager/manager.component';
 
//services

import {CarService} from './shared/services/car.service'
import {CarTypeService} from './shared/services/car-type.service'
import {BranchService} from './shared/services/branch.service'
import {CustomerService} from './shared/services/customer.service'
import {EmployeeService} from './shared/services/employee.service'
import {OrderService} from './shared/services/order.service'


@NgModule({
  declarations: [
    AppComponent,
	HomeComponent,
	FooterComponent,
	HeaderComponent,
	BranchComponent, 
	BranchesListComponent,  
	CarComponent,
    CarsListComponent,
    CarsDisplayComponent,
    CarOrderComponent,
	CarTypeComponent,
	CarTypesListComponent, 
	CustomerComponent, 
	CustomersListComponent,  
	EmployeeComponent, 
    EmployeesListComponent,
    OrderComponent,
    OrdersListComponent,
    ManagerComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    HttpModule,
    RouterModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [
      CarService,
      CarTypeService,
      BranchService,
      CustomerService,
      EmployeeService,
      OrderService,
      CarOrderComponent
    ],
  
  bootstrap: [AppComponent]
})
export class AppModule { }
