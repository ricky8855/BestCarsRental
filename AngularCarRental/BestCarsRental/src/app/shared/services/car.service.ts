import { Injectable } from '@angular/core';
import { Car } from './../models/car.model';
import { HttpClient } from '@angular/common/http';
import { WebApiUrl } from './web-api-url';


@Injectable()
export class CarService {
    webApiUrl: WebApiUrl = new WebApiUrl();
    carsList: Car[];

    constructor(private myHttpClient: HttpClient) { }

    getCars(): void {
        let func2: (a: Array<Car>) => void = (a: Array<Car>) => {
            this.carsList = a;
        }
        this.myHttpClient.get<Array<Car>>(this.webApiUrl.url + "/api/car/all")
            .subscribe(
            func2
            );
    }

    getCarByBranchAndModel(branch: string, model: string, callBack: (b: Array<Car>) => void): void {
        this.myHttpClient.get<Array<Car>>(this.webApiUrl.url + "/api/car/" + branch + "/" + model)
            .subscribe(
            callBack
            );
    }

    getAllCarNumbers(callBack: (b: Array<string>) => void): void {
        this.myHttpClient.get<Array<string>>(this.webApiUrl.url + "/api/car/numbers")
            .subscribe(
            callBack
            );
    }

    getCar(carNumber: string, callBack: (b: Car) => void): void {
        this.myHttpClient.get<Car>(this.webApiUrl.url + "/api/car/" + carNumber)
            .subscribe(
            callBack
            );
    }

    deleteCar(carName: string, callBack: (b: boolean) => void): void {
        this.myHttpClient.delete<boolean>(this.webApiUrl.url + "/api/car/" + carName)
            .subscribe(
            callBack
            );
    }

    addCar(car: Car, callBack: (b: boolean) => void): void {
        this.myHttpClient.post<boolean>(this.webApiUrl.url + "/api/car/add", car)
            .subscribe(
            callBack
            );
    }

    updateCar(car: Car, callBack: (b: boolean) => void): void {
        this.myHttpClient.put<boolean>(this.webApiUrl.url + "/api/car/edit", car)
            .subscribe(
            callBack
            );
    }
}