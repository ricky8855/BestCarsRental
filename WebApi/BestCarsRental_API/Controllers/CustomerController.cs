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
    [RoutePrefix("api/customer")]
    public class CustomerController : ApiController
    {
        CustomerManager customerManager = new CustomerManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllCustomers()
        {
            try
            {
                List<CustomerModel> customers = customerManager.GetAllCustomers();
                return Request.CreateResponse(HttpStatusCode.OK, customers);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("usernames")]
        public HttpResponseMessage GetAllCustomerUserNames()
        {
            try
            {
                List<string> names = customerManager.GetAllCustomersUserNames();
                return Request.CreateResponse(HttpStatusCode.OK, names);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{name}")]
        public HttpResponseMessage GetCustomer([FromUri]string name)
        {
            try
            {
                CustomerModel customer = customerManager.GetCustomer(name);
                return Request.CreateResponse(HttpStatusCode.OK, customer);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostCustomer([FromBody]CustomerModel customerModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (customerManager.AddCustomer(customerModel))
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
        public HttpResponseMessage PutCustomer([FromBody]CustomerModel customerModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (customerManager.EditCustomer(customerModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpDelete]
        [Route("{name}")]
        public HttpResponseMessage DeleteCustomer([FromUri]string name)
        {
            try
            {
                if (customerManager.DeleteCustomer(name))
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
