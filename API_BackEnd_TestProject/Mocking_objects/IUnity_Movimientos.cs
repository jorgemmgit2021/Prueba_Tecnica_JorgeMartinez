using BLL_BackEnd.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_BackEnd_TestProject{
    public interface IUnity_Movimientos{
        Task Get();
        Task Get(int id);
    }
}