using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WEBAPI.Models;
using WebAPIwithToken.Repositories;

namespace WEBAPI.Controllers
{
    [RoutePrefix("api/Registration")]
    public class RegistrationController : ApiController
    {
        WebAPIEntities dataobj = new WebAPIEntities();


        SignupRepository signuprepo = new SignupRepository();



        [Route("{id}", Name = "GetById")]
        public IHttpActionResult Get(int id)
        {
            Models.Registration signup = signuprepo.GetById(id);
            if (signup == null)
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
            return Ok(signup);
        }


        [AllowAnonymous]
        [Route("Signup")]
        [HttpPost]
        public IHttpActionResult Registration(Models.Registration sign)
        {
            signuprepo.Signup(sign);
            string url = Url.Link("GetById", new { id = sign.IntId });
            return Created(url, sign);
        }



        [Authorize]
        //[HttpPost]
        [HttpGet]
        [Route("post/{id}")]
        public IHttpActionResult Post(int id)
        {
            //Signup signup = signuprepo.GetById(id);
            // var identity = (ClaimsIdentity)User.Identity;
            ////var roles = identity.Claims
            //            .Where(c => c.Type == ClaimTypes.Role)
            //            .Select(c => c.Value);

            //myclass.Role = string.Join("", roles.ToList());

            Models.Registration signup = signuprepo.GetById(id);
            if (signup == null)
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
            return Ok(signup);
        }
    }
}
