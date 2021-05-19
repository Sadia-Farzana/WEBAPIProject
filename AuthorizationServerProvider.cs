﻿using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace WEBAPI
{
    public class AuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);

            using (UserAuthentication OBJ = new UserAuthentication())
            {
                var user = OBJ.ValidateUser(context.UserName, context.Password);
                if (user == false)
                {
                    context.SetError( "Username or password is incorrect");
                    return;
                }
                identity.AddClaim(new Claim(ClaimTypes.Role, "SuperAdmin"));
                identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
                //identity.AddClaim(new Claim("Email", user.UserEmailID));  

                context.Validated(identity);
            }
        }




    }
}