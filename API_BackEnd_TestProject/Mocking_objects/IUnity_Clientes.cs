using BLL_BackEnd.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_BackEnd_TestProject{
    public interface IUnity_Clientes{
        void  Get(int identificacion);
        void GetAll();
        void GetBy(int Edad, string fchIni, string fchFnl);
        void GetDateOfPurchase();
    }
}