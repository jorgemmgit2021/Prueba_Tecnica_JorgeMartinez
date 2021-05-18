using System;
using System.Collections.Generic;
using System.Text;
using Xunit;
using Moq;
using BLL_BackEnd.Models;
using API_BackEnd.Controllers;
using System.Threading.Tasks;
using BLL_BackEnd.Models.Context;
using BLL_BackEnd;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;

namespace API_BackEnd_TestProject.Test_Objects{
    public class Clientes_Test:Test_Implementation<ClientesRepository, ClientesController>, IUnity_Clientes{
        ClientesController _Controller { get; set; }
        public Clientes_Test():base(){_Controller = new ClientesController(base._Context, base._RepositoryMock.Object, base._ServiceMock.Object, base._ConfigurationMock.Object, base._LogMock.Object, base._EnvironmentMock.Object);}
        [Theory]
        [InlineData(123456789)]
        public void Get(int identificacion){
            var caller = _Controller.Get(identificacion).Result;
            Assert.NotNull(caller);
        }
        [Fact]
        public void GetAll(){
            var caller = _Controller.GetAll().Result;
            Assert.NotEmpty(caller);
        }
        [Theory]
        [InlineData(36,"01/02/2000", "25/05/2000")]
        public void GetBy(int Edad, string fchIni, string fchFnl){
            DateTime _fchIni;
            DateTime _fchFnl;
            if (DateTime.TryParse(fchIni, out _fchIni) && DateTime.TryParse(fchFnl, out _fchFnl)){
                var caller = _Controller.GetBy(Edad, _fchIni, _fchFnl).Result;
                Assert.True(caller.TrueForAll(c => c.FechaNacimiento.Year == 1985&&c.FechaNacimiento!=new DateTime()));
            }
            else {
                throw new Exception("Error en la asignación de parametros");
            }
        }
        [Fact]
        public void GetDateOfPurchase(){
            var caller = _Controller.GetDateOfPurchase();
            Assert.NotEmpty(caller);
        }
    }
}
