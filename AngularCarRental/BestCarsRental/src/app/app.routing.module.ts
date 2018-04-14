import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";

import { HomeComponent } from './home/home.component';

import { BranchComponent } from './branch/branch.component';
import { BranchesListComponent } from './branches-list/branches-list.component';

import { CarComponent } from './car/car.component';
import { CarsListComponent } from './cars-list/cars-list.component';
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

// הנתיבים השונים שקיימים באתר
const appRoutes: Routes = [
    { path: "home", component: HomeComponent },
	{ path: "branch", component: BranchComponent },
	{ path: "branches", component: BranchesListComponent },
	{ path: "car", component: CarComponent },
    { path: "cars", component: CarsListComponent },
    { path: "carorder/:carnumber", component: CarOrderComponent },
	{ path: "cartype", component: CarTypeComponent },
	{ path: "cartypes", component: CarTypesListComponent },
	{ path: "customer", component: CustomerComponent },
	{ path: "customers", component: CustomersListComponent },
	{ path: "employee", component: EmployeeComponent },
    { path: "employees", component: EmployeesListComponent },
    { path: "order", component: OrderComponent },
    { path: "orders", component: OrdersListComponent },
    { path: "admin", component: ManagerComponent },
    { path: "", redirectTo: "/home", pathMatch: "full" },

];

// אובייקט ראוטר - יודע איך להחליף את הקומפוננטות לפי הנתיבים
const appRouter = RouterModule.forRoot(appRoutes);

@NgModule({
    imports: [appRouter]
})
export class AppRoutingModule {}

