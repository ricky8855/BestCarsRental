import { Component, OnInit } from '@angular/core';
import { CarService } from './../shared/services/car.service';
import { BranchService } from './../shared/services/branch.service';
import { CarTypeService } from './../shared/services/car-type.service';
import { Car } from './../shared/models/car.model';
import { CarComponent } from '../car/car.component';
import { CarOrderComponent } from '../car-order/car-order.component';

@Component({
    selector: 'app-cars-display',
    templateUrl: './cars-display.component.html',
    styleUrls: ['./cars-display.component.css']
})
export class CarsDisplayComponent implements OnInit {
    carsList: Car[];
    branchesList: Array<string>;
    carTypeModelsList: Array<string>;
    branch1: string = "Paris";
    cartypemodel: string = "Yaris" ;
    allcars: boolean = true;

    constructor(private carService: CarService, private carOrderComponent: CarOrderComponent , private branchService: BranchService, private carTypeService: CarTypeService) { }

    ngOnInit() {
        let func1: (a: Array<string>) => void = (a: Array<string>) => {
            this.branchesList = a;
        }
        this.branchService.getAllBranchesNames(func1);

        let func2: (a: Array<string>) => void = (a: Array<string>) => {
            this.carTypeModelsList = a;
        }
        this.carTypeService.getAllCarTypesModels(func2);

        this.carService.getCars(); 
    }

    onGetCarsList() {
        let func: (a: Array<Car>) => void = (a: Array<Car>) => {
            this.carsList = a;
            this.allcars=false;
        }
        this.carService.getCarByBranchAndModel(this.branch1, this.cartypemodel, func);
    }

}
