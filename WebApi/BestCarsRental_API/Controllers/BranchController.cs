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
    [RoutePrefix("api/branch")]
    public class BranchController : ApiController
    {
        BranchManager branchManager = new BranchManager();

        [HttpGet]
        [Route("all")]
        public HttpResponseMessage GetAllBranches()
        {
            try
            {
                List<BranchModel> branches = branchManager.GetAllBranches();
                return Request.CreateResponse(HttpStatusCode.OK, branches);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("names")]
        public HttpResponseMessage GetAllBranchesNames()
        {
            try
            {
                List<string> branches = branchManager.GetAllBranchesNames();
                return Request.CreateResponse(HttpStatusCode.OK, branches);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpGet]
        [Route("{name}")]
        public HttpResponseMessage GetBranch([FromUri]string name)
        {
            try
            {
                BranchModel branch = branchManager.GetBranch(name);
                return Request.CreateResponse(HttpStatusCode.OK, branch);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("add")]
        public HttpResponseMessage PostBranch([FromBody]BranchModel branchModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (branchManager.AddBranch(branchModel))
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
        public HttpResponseMessage PutBranch([FromBody]BranchModel branchModel)
        {
            try
            {
                if (ModelState.IsValid)
                    if (branchManager.EditBranch(branchModel))
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
        public HttpResponseMessage DeleteBranch([FromUri]string name)
        {
            try
            {
                if (branchManager.DeleteBranch(name))
                    return Request.CreateResponse(HttpStatusCode.OK, true);
                return Request.CreateErrorResponse(HttpStatusCode.NotFound, new HttpError());
            }
            catch (DBManagerException dbException)
            {
                //  there are cars or orders - attached - cant be deleted
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, dbException);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
