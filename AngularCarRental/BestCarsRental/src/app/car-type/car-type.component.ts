import { Component, OnInit } from '@angular/core';
import { CarTypeService } from './../shared/services/car-type.service';
import { CarType } from './../shared/models/car-type.model';
import { CarTypesListComponent } from '../car-types-list/car-types-list.component';

@Component({
    selector: 'app-car-type',
    templateUrl: './car-type.component.html',
    styleUrls: ['./car-type.component.css']
})

export class CarTypeComponent implements OnInit {
    carType: CarType = new CarType();
    carTypeModel: string;
    newCarType: CarType = new CarType();
    addedSuccess: boolean = false;
    deleteSuccess: boolean = false;

    constructor(private carTypeService: CarTypeService) { }

    ngOnInit() {
    }

    onSearchCarType() {
        let func: (a: CarType) => void = (a: CarType) => {
            this.carType = a;
        }
        this.carTypeService.getCarType(this.carTypeModel, func);
    }

    onNewCarType() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.carTypeService.addCarType(this.carType, func);
    }

    onUpdateCarType() {
        this.addedSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.addedSuccess = b;
        }
        this.carTypeService.updateCarType(this.carType, func);
    }

    onResetCarType() {
        this.addedSuccess = false;
        this.carType = new CarType();
    }
}
