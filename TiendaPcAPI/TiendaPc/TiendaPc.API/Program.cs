using Microsoft.EntityFrameworkCore;
using TiendaPc.DLL.Data.Repository.Intefaces;
using TiendaPc.DLL.Data.Repository;
using TiendaPc.DLL.Models;
using TiendaPc.DLL.Services.Interfaces;
using TiendaPc.DLL.Services;
using TiendaPc.DLL.Data.Repository.Interfaces;
using WebApplication1.Services.Interfaces;
using WebApplication1.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<DB_TIENDA_PCContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

//Inyeccion de dependencias REPOSITORY
builder.Services.AddScoped<IPedidoRepository, PedidoRepository>();
builder.Services.AddScoped<IComponenteRepository, ComponenteRepository>();
builder.Services.AddScoped<IClienteRepository, ClienteRepository>();
builder.Services.AddScoped<IEspecificacionRepository, EspecificacionRepository>();
builder.Services.AddScoped<IFormaPagoRepository, FormaPagoRepository>();
builder.Services.AddScoped<IFormaEntregaRepository, FormaEntregaRepository>();
builder.Services.AddScoped<IMarcaRepository, MarcaRepository>();
builder.Services.AddScoped<ITipoComponenteRepository, TipoComponenteRepository>();
builder.Services.AddScoped<ITipoContactoRepository, TipoContactoRepository>();
builder.Services.AddScoped<ITipoDocumentoRepository, TipoDocumentoRepository>();
builder.Services.AddScoped<IProvinciaRepositoy, ProvinciaRepository>();
builder.Services.AddScoped<ICiudadRepository, CiudadRepository>();
builder.Services.AddScoped<IBarrioRepository, BarrioRepository>();
builder.Services.AddScoped<ICategoriaFiscalRepository, CategoriaFiscalRepository>();
builder.Services.AddScoped<IDashboardRepository, DashboardRepository>();
builder.Services.AddScoped<IEmpleadoDto, EmpleadoDtoRepository>();

//Inyeccion de dependencia en los servicios
builder.Services.AddScoped<IPedidoService, PedidoService>();
builder.Services.AddScoped<IComponenteService, ComponenteService>();
builder.Services.AddScoped<IClienteService, ClienteService>();
builder.Services.AddScoped<IEspecificacionService, EspecificacionService>();
builder.Services.AddScoped<IFormaPagoService, FormaPagoService>();
builder.Services.AddScoped<IFormaEntregaService, FormaEntregaService>();
builder.Services.AddScoped<IMarcaService, MarcaService>();
builder.Services.AddScoped<ITipoComponenteService, TipoComponenteService>();
builder.Services.AddScoped<ITipoContactoService, TipoContactoService>();
builder.Services.AddScoped<ITipoDocumentoService, TipoDocumentoService>();
builder.Services.AddScoped<IProvinciaService, ProvinciaService>();
builder.Services.AddScoped<ICiudadService, CiudadService>();
builder.Services.AddScoped<IBarrioService, BarrioService>();
builder.Services.AddScoped<ICategoriaFiscalService, CategoriaFiscalService>();
builder.Services.AddScoped<IDashboardService, DashboardService>();
builder.Services.AddScoped<IEmpleadoDtoService, EmpleadoDtoService>();


builder.Services.AddCors(options =>
{
    options.AddPolicy("CorsPolicy", builder =>
    builder.AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader()
    );
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("CorsPolicy");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
