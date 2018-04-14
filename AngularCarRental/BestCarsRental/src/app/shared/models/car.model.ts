import { Branch } from './branch.model';
import { CarType } from './car-type.model';

    export class Car {
        CarNumber: string;
        BestCondition: boolean;
        Mileage: number;
        Image: string;
		
		Branch: Branch = new Branch();
		CarType: CarType = new CarType();
    }

