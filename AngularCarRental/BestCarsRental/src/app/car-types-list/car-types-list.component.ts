import { Component, OnInit } from '@angular/core';
import { CarTypeService } from './../shared/services/car-type.service';
import { CarType } from './../shared/models/car-type.model';
import { CarTypeComponent } from '../car-type/car-type.component';

@Component({
    selector: 'app-car-types-list',
    templateUrl: './car-types-list.component.html',
    styleUrls: ['./car-types-list.component.css']
})
export class CarTypesListComponent implements OnInit {

    deleteSuccess: boolean = false;

    constructor(private carTypesService: CarTypeService, private carComponent: CarTypeComponent) { }

    ngOnInit() {

    }

    showForEdit(carType: CarType) {
        Object.assign(this.carComponent.carType, carType);
    }

    onDeleteCarType(model: string) {
        this.deleteSuccess = false;
        let func: (b: boolean) => void = (b: boolean) => {
            this.deleteSuccess = b;
        }
        this.carTypesService.deleteCarType(model, func);
    }

}