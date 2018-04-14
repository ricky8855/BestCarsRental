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
    [RoutePrefix("api/cartype")]
    public class CarTypeController : ApiController
    {
        CarTypeManager carTypeManager = new CarTypeManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllCarTypes()
        {
            try
            {
                List<CarTypeModel> carTypes = carTypeManager.GetAllCarTypes();
                return Request.CreateResponse(HttpStatusCode.OK, carTypes);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("models")]
        public HttpResponseMessage GetAllCarTypesModels()
        {
            try
            {
                List<string> models = carTypeManager.GetAllCarTypesModels();
                return Request.CreateResponse(HttpStatusCode.OK, models);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{model}")]
        public HttpResponseMessage GetCarType([FromUri]string model)
        {
            try
            {
                CarTypeModel carType = carTypeManager.GetCarType(model);
                return Request.CreateResponse(HttpStatusCode.OK, carType);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostCarType([FromBody]CarTypeModel carTypeModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (carTypeManager.AddCarType(carTypeModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPut]
        [Route("edit")]
        public HttpResponseMessage PutCarType([FromBody]CarTypeModel carTypeModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (carTypeManager.EditCarType(carTypeModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpDelete]
        [Route("{model}")]
        public HttpResponseMessage DeleteCarType([FromUri]string model)
        {
            try
            {
                if (carTypeManager.DeleteCarType(model))
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
