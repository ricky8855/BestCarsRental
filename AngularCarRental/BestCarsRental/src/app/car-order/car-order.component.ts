import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from "@angular/router";
import { Car } from './../shared/models/car.model';
import { Order } from './../shared/models/order.model';
import { CarService } from './../shared/services/car.service';

@Component({
  selector: 'app-car-order',
  templateUrl: './car-order.component.html',
  styleUrls: ['./car-order.component.css']
})
export class CarOrderComponent implements OnInit {
  carNumber: string ="";
  car: Car = new Car();
  order: Order = new Order();
  daysNumber : number;
  totalPrice : number;
  toatlCalculated: boolean = false;

  constructor(private route : ActivatedRoute, private carService: CarService) 
  { 
  }

  ngOnInit() {
    let getCarNumber: (strnumber:string) => void = (strnumber:string) =>   {
        this.carNumber = strnumber;
    }
    this.route.params.subscribe(params => getCarNumber(params['carnumber']));
 
    let getCar: (b: Car) => void = (b: Car) => {
        Object.assign(this.car, b);
    }
    this.carService.getCar(this.carNumber, getCar);
  }

  calcDaysAndPrice( ) {    
    var startD = new Date(this.order.StartDate);
    var endD = new Date(this.order.ExpectedReturnDate);
    var startD_ms = startD.getTime();   
    var endD_ms = endD.getTime();    
           
    this.daysNumber = Math.round( ( endD_ms - startD_ms ) / ( 1000*60*60*24 )); 
    this.totalPrice = this.daysNumber * this.car.CarType.PricePerDay;

    console.log(" days " + this.daysNumber);
    console.log(" price " + this.totalPrice);
    if ( this.daysNumber > 0 && this.totalPrice > 0 )
    {
        this.toatlCalculated = true;
    }
    
  } 

  onNewOrder()
  {
    console.log(" Ready to order" );
  }
}
