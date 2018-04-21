using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BestCarsRental_BLL;
using BestCarsRental_BO;

using System.Web.Http.Cors;

namespace BestCarsRental_API.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/users")]
    public class AccountController : ApiController
    {

        AccountManager accountManager = new AccountManager();
        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllUser()
        {
            try
            {
                List<string> usernames = accountManager.GetAllUserNames();
                return Request.CreateResponse(HttpStatusCode.OK, usernames);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("cregister")]
        public HttpResponseMessage CustomerRegister([FromBody]CustomerModel model)
        {
            try
            {
                accountManager.AddCustomer(model);
                return Request.CreateResponse(HttpStatusCode.OK, true);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, ex);
            }
        }

        [HttpPost]
        [Route("eregister")]
        public HttpResponseMessage EmployeeRegister([FromBody]EmployeeModel model)
        {
            try
            {
                accountManager.AddEmployee(model);
                return Request.CreateResponse(HttpStatusCode.OK, true);

            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, ex);
            }
        }

        // GET: api/Account
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Account/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Account
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Account/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Account/5
        public void Delete(int id)
        {
        }
    }
}
