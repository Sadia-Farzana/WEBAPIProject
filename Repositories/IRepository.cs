using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WEBAPI.Models;


namespace WebAPIwithToken.Repositories
{
   public  interface IRepository<T> where T : class
    {
        List<T> GetAll();
        T GetById(int id);
        void Signup(T signup);
        void Delete(int id);
        void Edit(T entity);
    }
}
