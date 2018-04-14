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
    [RoutePrefix("api/employee")]
    public class EmployeeController : ApiController
    {
        EmployeeManager employeeManager = new EmployeeManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllEmployees()
        {
            try
            {
                List<EmployeeModel> employees = employeeManager.GetAllEmployees();
                return Request.CreateResponse(HttpStatusCode.OK, employees);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{userName}")]
        public HttpResponseMessage GetEmployee([FromUri]string userName)
        {
            try
            {
                EmployeeModel employee = employeeManager.GetEmployee(userName);
                return Request.CreateResponse(HttpStatusCode.OK, employee);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostEmployee([FromBody]EmployeeModel employeeModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (employeeManager.AddEmployee(employeeModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPut]
        [Route("edit")]
        public HttpResponseMessage PutEmployee([FromBody]EmployeeModel employeeModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (employeeManager.EditEmployee(employeeModel))
                        return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, new HttpError());
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpDelete]
        [Route("{userName}")]
        public HttpResponseMessage DeleteEmployee([FromUri]string userName)
        {
            try
            {
                if (employeeManager.DeleteEmployee(userName))
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
