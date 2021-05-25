using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
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



        [Route("GetById/{id}", Name = "GetById")]
        public IHttpActionResult GetById(int id)
        {
            Models.Registration signup = signuprepo.GetById(id);
            if (signup == null)
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
            return Ok(signup);
        }

        [Route("GetAll")]
        [HttpGet]
        public IHttpActionResult Get()
        {
            return Ok(signuprepo.GetAll());
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
        [Route("Login")]
        public IHttpActionResult Login(Models.Registration signup)
        {
            var identity = (ClaimsIdentity)User.Identity;
            string username = identity.Name;
            //signup.StrUsername = identity.Name;
            //signup = signuprepo.GetByUsername(username);

            signup = dataobj.Registrations.Where(x => x.StrUsername == identity.Name).FirstOrDefault();
            return Ok(signup);
        }

        
        [Route("edit/{id}")]
        [HttpPut]
        public IHttpActionResult Put([FromBody] Models.Registration sign, [FromUri] int id)
        {
            sign.IntId = id;
            signuprepo.Edit(sign);
            if (sign == null)
            {
                return StatusCode(HttpStatusCode.NoContent);
            }
            return Ok(sign);
        }


        [Route("delete/{id}")]
        public IHttpActionResult Delete(int id)
        {
            signuprepo.Delete(id);
            return StatusCode(HttpStatusCode.NoContent);
        }
    }
}
