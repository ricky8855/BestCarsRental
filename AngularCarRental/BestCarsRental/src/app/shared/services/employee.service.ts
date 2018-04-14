import { Injectable } from '@angular/core';
import { Employee } from './../models/employee.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';

@Injectable()
export class EmployeeService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    employeesList: Employee[];

    constructor(private myHttpClient: HttpClient) { }

    getEmployees(): void {
        let func: (a: Array<Employee>) => void = (a: Array<Employee>) => {
            this.employeesList = a;
        }
        
        this.myHttpClient.get<Array<Employee>>(this.webApiUrl.url + "/api/employee/all")
            .subscribe(
            func
            );
    }

    getEmployee(employeeName: string, callBack: (b: Employee) => void): void {
        this.myHttpClient.get<Employee>(this.webApiUrl.url + "/api/employee/" + employeeName)
            .subscribe(
            callBack
            );
    }


    deleteEmployee(employeeName: string, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/employee/" + employeeName)
            .subscribe(
            callBack
            );
    }


    addEmployee(employee: Employee, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/employee/add", employee)
            .subscribe(
            callBack
            );
    }

    updateEmployee(employee: Employee, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/employee/edit", employee)
            .subscribe(
            callBack
            );
    }
}