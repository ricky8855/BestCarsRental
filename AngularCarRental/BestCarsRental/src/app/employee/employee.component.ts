import { Component, OnInit } from '@angular/core';
import { EmployeeService } from './../shared/services/employee.service';
import { Employee } from './../shared/models/employee.model';
import { EmployeesListComponent } from '../employees-list/employees-list.component';

@Component({
    selector: 'app-employee',
    templateUrl: './employee.component.html',
    styleUrls: ['./employee.component.css']
})

export class EmployeeComponent implements OnInit {
    employee: Employee = new Employee();
    xxx: string;
    newEmployee: Employee = new Employee();
    addedSuccess: boolean = false;
    deleteSuccess: boolean = false;

    constructor(private employeeService: EmployeeService) { }

    ngOnInit() {
    }

    onSearchEmployee() {
        let func: (a: Employee) => void = (a: Employee) => {
            this.employee = a;
        }
        this.employeeService.getEmployee(this.xxx, func);
    }


    onNewEmployee() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.employeeService.addEmployee(this.employee, func);
    }

    onUpdateEmployee() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.employeeService.updateEmployee(this.employee, func);
    }

    onResetEmployee() {
        this.addedSuccess = false;
        this.employee = new Employee();
    }

}
