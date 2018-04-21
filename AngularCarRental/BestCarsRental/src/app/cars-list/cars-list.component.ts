import { Component, OnInit } from '@angular/core';
import { CarService } from './../shared/services/car.service';
import { Car } from './../shared/models/car.model';
import { CarComponent } from '../car/car.component';

@Component({
    selector: 'app-cars-list',
    templateUrl: './cars-list.component.html',
    styleUrls: ['./cars-list.component.css']
})

export class CarsListComponent implements OnInit {

    deleteSuccess: boolean = false;

    constructor(private carService: CarService, private carComponent: CarComponent) { }

    ngOnInit() {
        this.carService.getCars();
    }

    showForEdit(car: Car) {
       this.carComponent.car = car;
       console.log(this.carComponent.car.Branch.BranchName);     
    }

    onDeleteCar(carNumber: string) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.carService.deleteCar(carNumber, func);
    }
}
