import { Component, OnInit } from '@angular/core';
import { CarService } from './../shared/services/car.service';
import { BranchService } from './../shared/services/branch.service';
import { CarTypeService } from './../shared/services/car-type.service';
import { Car } from './../shared/models/car.model';
import { CarsListComponent } from '../cars-list/cars-list.component';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
    selector: 'app-car',
    templateUrl: './car.component.html',
    styleUrls: ['./car.component.css']
})

export class CarComponent implements OnInit {
    car: Car = new Car();
    carNumber: string = "Car Number";
  
    addedSuccess: boolean = false;
    deleteSuccess: boolean = false;

    constructor(private carService: CarService, private branchService: BranchService, private carTypeService: CarTypeService) { }

    ngOnInit() {
        this.branchService.getBranches();
        this.carTypeService.getCarTypes();
    }

    onSearchCar() {
        let func: (a: Car) => void = (a: Car) => {
            this.car = a;
        }
        this.carService.getCar(this.carNumber, func);
    }

    onNewCar() {
        this.addedSuccess = false;
        
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.carService.addCar(this.car, func);
    }

    onUpdateCar() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.carService.updateCar(this.car, func);
    }

    onResetCar() {
        this.addedSuccess = false;
        this.car = new Car();
    }
}
