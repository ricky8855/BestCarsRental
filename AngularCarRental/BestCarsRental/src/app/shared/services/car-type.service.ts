import { Injectable } from '@angular/core';
import { CarType } from './../models/car-type.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';

@Injectable()
export class CarTypeService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    carTypesList: CarType[];
    constructor(private myHttpClient: HttpClient) { }

    getCarTypes(): void {
        let func: (a: Array<CarType>) => void = (a: Array<CarType>) => {
            this.carTypesList = a;
        }
        this.myHttpClient.get<Array<CarType>>(this.webApiUrl.url + "/api/cartype/all")
            .subscribe(
            func
            );
    }

    getAllCarTypesModels(callBack: (b: Array<string>) => void): void {
        this.myHttpClient.get<Array<string>>(this.webApiUrl.url + "/api/cartype/models")
            .subscribe(
            callBack
            );
    }

    getCarType(cartypeModel: string, callBack: (b: CarType) => void): void {
        this.myHttpClient.get<CarType>(this.webApiUrl.url + "/api/cartype/" + cartypeModel)
            .subscribe(
            callBack
            );
    }


    deleteCarType(cartypeModel: string, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/cartype/" + cartypeModel)
            .subscribe(
            callBack
            );
    }


    addCarType(cartype: CarType, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/cartype/add", cartype)
            .subscribe(
            callBack
            );
    }


    updateCarType(cartype: CarType, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/cartype/edit", cartype)
            .subscribe(
            callBack
            );
    }
}