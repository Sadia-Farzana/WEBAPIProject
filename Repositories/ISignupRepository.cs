using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WEBAPI.Models;

namespace WebAPIwithToken.Repositories
{
  public interface ISignupRepository 
    {
        void Register(Registration signup);
    }
}
