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

namespace API_BackEnd_TestProject
{
    public class Inventarios_Test : Test_Implementation<InventariosRepository, InventariosController>, IUnity_Inventarios{
        public Inventarios_Test() : base() {_Controller = new InventariosController(base._Context, base._RepositoryMock.Object, base._ServiceMock.Object, base._ConfigurationMock.Object, base._LogMock.Object, base._EnvironmentMock.Object); }
        InventariosController _Controller { get; set; }
        [Fact]
        public void GetAll() {            
            var caller = _Controller.Get().Result;
            Assert.NotEmpty(caller);
        }
        [Theory]
        [InlineData(6)]
        public void GetBy(int id){
            var caller = _Controller.Get(id).Result;
            Assert.NotNull(caller);
        }
        [Fact]
        public void GetAllStockMin(){
            var caller = _Controller.GetAllStockMin();
            Assert.True(caller.Result.TrueForAll(i=>i.StockMinimo<=5)&&caller.Result.Count>0);
        }
        [Theory]
        [InlineData(2000)]
        public void GetAllVentasXItem(int periodo){
            var caller = _Controller.GetAllVentasXItem(periodo);
            Assert.True(caller.Count>0);
        }
    }
}
