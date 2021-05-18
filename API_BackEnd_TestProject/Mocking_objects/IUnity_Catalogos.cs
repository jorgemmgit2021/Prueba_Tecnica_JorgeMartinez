using BLL_BackEnd.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_BackEnd_TestProject{
    public interface IUnity_Catalogos{
        Task Get(int id);
    }
}