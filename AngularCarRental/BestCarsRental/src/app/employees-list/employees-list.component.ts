import { Component, OnInit } from '@angular/core';
import { EmployeeService } from './../shared/services/employee.service';
import { Employee } from './../shared/models/employee.model';
import { EmployeeComponent } from '../employee/employee.component';

@Component({
    selector: 'app-employees-list',
    templateUrl: './employees-list.component.html',
    styleUrls: ['./employees-list.component.css']
})

export class EmployeesListComponent implements OnInit {
    deleteSuccess: boolean = false;

    constructor(private employeeService: EmployeeService, private empComponent: EmployeeComponent) { }

    ngOnInit() {
        this.employeeService.getEmployees();
    }

    showForEdit(employee: Employee) {
        Object.assign(this.empComponent.employee, employee);
    }

    onDeleteEmployee(userName: string) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.employeeService.deleteEmployee(userName, func);
    }
}
