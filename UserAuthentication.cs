using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WEBAPI.Models;


namespace WEBAPI
{
    public class UserAuthentication : IDisposable
    {


        WebAPIEntities dataobj = new WebAPIEntities();


        public  bool ValidateUser(string username, string password)
        {
            using (WebAPIEntities dataobj = new WebAPIEntities())
            {
                return dataobj.Registrations.Any(x => x.StrUsername.Equals(username, StringComparison.OrdinalIgnoreCase) && x.StrPassword == password);
            }
        }

        //public string ValidateUser(string username, string password)
        //{
        //    string Name = username == "akash" ? "Valid" : "InValid";
        //    string Pass = password == "pass" ? "Valid" : "InValid";

        //    if (Name == "Valid" && Pass == "Valid")
        //        return "true";
        //    else
        //        return "false";
        //}
        public void Dispose()
        {
            //Dispose();
        }
    }
}