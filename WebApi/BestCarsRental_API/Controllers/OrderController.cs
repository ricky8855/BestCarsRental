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
    [RoutePrefix("api/order")]
    public class OrderController : ApiController
    {
        OrderManager orderManager = new OrderManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllOrders()
        {
            try
            {
                List<OrderModel> orders = orderManager.GetAllOrders();
                return Request.CreateResponse(HttpStatusCode.OK, orders);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{id}")]
        public HttpResponseMessage GetOrder([FromUri]int id)
        {
            try
            {
                OrderModel order = orderManager.GetOrder(id);
                return Request.CreateResponse(HttpStatusCode.OK, order);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostOrder([FromBody]OrderModel orderModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (orderManager.AddOrder(orderModel))
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
        public HttpResponseMessage PutOrder([FromBody]OrderModel orderModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (orderManager.EditOrder(orderModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpDelete]
        [Route("{id}")]
        public HttpResponseMessage DeleteOrder([FromUri]int id)
        {
            try
            {
                if (orderManager.DeleteOrder(id))
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
