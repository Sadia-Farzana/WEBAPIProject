using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WEBAPI.Models;

namespace WebAPIwithToken.Repositories
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected WebAPIEntities context;


        public Repository()
        {
            this.context = new WebAPIEntities();
        }

        public List<T> GetAll()
        {
            return context.Set<T>().ToList();
        }

        public T GetById(int id)
        {
            return context.Set<T>().Find(id);
        }

        public void Signup(T signup)
        {
            context.Set<T>().Add(signup);
            context.SaveChanges();
        }
        public void Delete(int id)
        {
            context.Set<T>().Remove(GetById(id));
            context.SaveChanges();
        }

        public void Edit(T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
            context.SaveChanges();
        }

    }
}