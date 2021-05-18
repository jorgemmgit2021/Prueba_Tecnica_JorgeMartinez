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
    public class Test_Implementation<T1,T2>where T1: class where T2:class{ 
        DbContextOptionsBuilder _DbContextOptionsBuilder;
        public PruebaContext _Context;
        public Mock<PruebaContext> _ContextMock;
        public Mock<T1> _RepositoryMock;
        public Mock<IServiceProvider> _ServiceMock;
        public Mock<IConfiguration> _ConfigurationMock;
        public Mock<ILogger<T2>> _LogMock;
        public Mock<IWebHostEnvironment> _EnvironmentMock;
        IConfigurationRoot Configurations { get; }

        public Test_Implementation(){
            var builder = new ConfigurationBuilder()
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
            .AddEnvironmentVariables();
            Configurations = builder.Build();
            _DbContextOptionsBuilder = new DbContextOptionsBuilder();
            _DbContextOptionsBuilder.UseSqlServer(Configurations["Data:SqlServerConnectionString"]);
            _Context = new PruebaContext(_DbContextOptionsBuilder.Options);
            _ContextMock = new Mock<PruebaContext>(_DbContextOptionsBuilder.Options);
            _ContextMock.SetupAllProperties();
            _RepositoryMock = new Mock<T1>(_Context);
            _ServiceMock = new Mock<IServiceProvider>();
            _ConfigurationMock = new Mock<IConfiguration>();
            _LogMock = new Mock<ILogger<T2>>();
            _EnvironmentMock = new Mock<IWebHostEnvironment>();
        }
    }
}
