using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WEBAPI.Models;


namespace WebAPIwithToken.Repositories
{
    public class SignupRepository : Repository<Registration>, ISignupRepository
    {
        public void Register(Registration signup)
        {
            context.Registrations.Add(signup);
            context.SaveChanges();
        }
    }
}