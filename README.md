# 🖥️ TiendaPC - Sistema de Gestión de Ventas y Stock

Sistema de gestión integral para tiendas de componentes de computadora, desarrollado para optimizar el control de inventario, ventas y análisis de datos comerciales.

## 📋 Descripción

TiendaPC es una aplicación web completa que permite gestionar todos los aspectos de una tienda de componentes de PC, desde el control de stock hasta la generación de pedidos y análisis de ventas. El sistema está diseñado para facilitar la administración diaria y proporcionar información valiosa sobre el rendimiento del negocio.

## ✨ Características Principales

### 🛒 Gestión de Ventas
- Registro completo de ventas con múltiples ítems
- Generación de pedidos detallados
- Visualización y edición de pedidos existentes
- Control automático de stock al realizar ventas (triggers en sql)

### 👥 Gestión de Clientes
- Alta de nuevos clientes
- Registro de información de contacto

### 📦 Gestión de Inventario
- Carga de nuevos componentes
- Listado completo de productos disponibles
- Actualización automática de stock
- Organización por categorías (Microprocesadores, Memorias RAM, etc.)

### 📊 Dashboard y Reportes
- **Resumen del día:**
  - Total de ventas realizadas
  - Monto total recaudado
  - Cantidad de clientes atendidos
- **Análisis de ventas:**
  - Ventas por marca
  - Componentes más vendidos
  - Estadísticas de productos por categoría

### 📄 Gestión de Pedidos
- Generación de pedidos con múltiples ítems
- Visualización detallada de pedidos
- Opciones de ver y editar pedidos existentes

## 🛠️ Tecnologías Utilizadas

### Frontend
- **HTML5** - Estructura de la aplicación
- **CSS3** - Estilos y diseño responsive
- **JavaScript Vanilla** - Lógica del cliente sin frameworks

### Backend
- **C# (.NET)** - Lenguaje de programación principal
- **Entity Framework** - ORM para gestión de base de datos
- **ASP.NET Core** - Framework web

### Base de Datos
- **SQL Server** - Sistema de gestión de base de datos

## 🚀 Instalación
- Sql Server 2022 (recomendado)
- Visual Studio 2022 (recomendado) o Visual Studio Code

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/valentinopretto/TIENDA_PC_WEB.git
cd TIENDA_PC_WEB
```

2. **Configurar la cadena de conexión**
   
   Editar el archivo `appsettings.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=tu_servidor;Database=TiendaPC;Trusted_Connection=True;"
  }
}
```

3. **Restaurar paquetes NuGet**
```bash
dotnet restore
```

4. **Aplicar migraciones**
```bash
dotnet ef database update
```

5. **Ejecutar la aplicación**
```bash
dotnet run
```

La aplicación estará disponible en `https://localhost:7119`

## 💡 Uso del Sistema

### Crear un Nuevo Pedido
1. Acceder al módulo de ventas
2. Seleccionar o crear un cliente
3. Agregar componentes al pedido
4. Confirmar la venta (el stock se actualiza automáticamente)

### Consultar Dashboard
1. Acceder al dashboard principal
2. Visualizar métricas del día en tiempo real
3. Explorar análisis por marca y tipo de componente

### Gestionar Inventario
1. Ir al módulo de componentes
2. Agregar nuevos productos con su información
3. Listar y buscar componentes existentes

## 🔜 Mejoras Futuras

- [ ] Implementar sistema de autenticación
- [ ] Agregar reportes en PDF
- [ ] Integración con proveedores

## 👨‍💻 Autores

**Valentino Pretto**
**Josias Peralta**
**Tobias Pertusatti**
**Joel Actis**

- GitHub: [@valentinopretto](https://github.com/valentinopretto)
- Portfolio: [valentinopretto.github.io/Portafolio](https://valentinopretto.github.io/Portafolio/)

## 📄 Licencia

Este proyecto es de código abierto y está disponible.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Haz fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/NuevaCaracteristica`)
3. Commit tus cambios (`git commit -m 'Agregar nueva característica'`)
4. Push a la rama (`git push origin feature/NuevaCaracteristica`)
5. Abre un Pull Request

---

⭐ Si este proyecto te fue útil, no olvides darle una estrella en GitHub!
