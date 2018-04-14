using BestCarsRental_BLL;
using BestCarsRental_BO;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace BestCarsRental_API.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/car")]
    public class CarController : ApiController
    {
        CarManager carManager = new CarManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllCars()
        {
            try
            {
                List<CarModel> cars = carManager.GetAllCars();
                return Request.CreateResponse(HttpStatusCode.OK, cars);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("numbers")]
        public HttpResponseMessage GetAllCarNumbers()
        {
            try
            {
                List<string> numbers = carManager.GetAllCarsNumbers();
                return Request.CreateResponse(HttpStatusCode.OK, numbers);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{branch}/{model}")]
        public HttpResponseMessage GetCarByBranchModel([FromUri]string branch, [FromUri]string model)
        {
            try
            {
                List <CarModel> cars = carManager.GetCarsByBranchModel(branch, model);
                return Request.CreateResponse(HttpStatusCode.OK, cars);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{carNumber}")]
        public HttpResponseMessage GetCar([FromUri]string carNumber)
        {
            try
            {
                CarModel car = carManager.GetCar(carNumber);
                return Request.CreateResponse(HttpStatusCode.OK, car);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostCar([FromBody]CarModel carModel)
        {     
            try
            {
                if (ModelState.IsValid)
                {
                    if (carManager.AddCar(carModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                } 
                else
                {
                    string x = ModelState.Keys.ToString();
                    foreach (var error in ModelState.Keys)
                        x = error;
                }
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPut]
        [Route("edit")]
        public HttpResponseMessage PutCar([FromBody]CarModel carModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (carManager.EditCar(carModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpDelete]
        [Route("{carNumber}")]
        public HttpResponseMessage DeleteCar([FromUri]string carNumber)
        {
            try
            {
                if (carManager.DeleteCar(carNumber))
                    return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }



    }
}
