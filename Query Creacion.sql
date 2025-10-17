USE MASTER
GO

CREATE DATABASE DB_TIENDA_PC
GO

USE DB_TIENDA_PC
GO

SET DATEFORMAT DMY

-------------------- PERSONAS Y SUS CARACTERISTICAS ---------------------------
CREATE TABLE PROVINCIAS(
id_provincia int IDENTITY(1,1),
provincia varchar (50) NOT NULL,
CONSTRAINT PK_PROVINCIAS PRIMARY KEY (id_provincia)
)


CREATE TABLE CIUDADES (
id_ciudad int IDENTITY(1,1),
ciudad varchar (50) NOT NULL,
id_provincia int NOT NULL
CONSTRAINT PK_CIUDADES PRIMARY KEY (id_ciudad),
CONSTRAINT FK_CIUDADES_PROVINCIAS FOREIGN KEY (id_provincia)
	REFERENCES Provincias (id_provincia)
)

CREATE TABLE BARRIOS (
    id_barrio int IDENTITY(1,1),
    barrio varchar(30) NOT NULL,
    id_ciudad int NOT NULL,
    CONSTRAINT PK_BARRIOS PRIMARY KEY (id_barrio),
    CONSTRAINT FK_BARRIOS_CIUDADES FOREIGN KEY (id_ciudad)
		REFERENCES Ciudades(id_ciudad)
)
--INSERTS--
--------------------PROVINCIAS-------------------------------
INSERT INTO PROVINCIAS (provincia) VALUES ('Buenos Aires');
INSERT INTO PROVINCIAS (provincia) VALUES ('Catamarca');
INSERT INTO PROVINCIAS (provincia) VALUES ('Chaco');
INSERT INTO PROVINCIAS (provincia) VALUES ('Chubut');
INSERT INTO PROVINCIAS (provincia) VALUES ('Córdoba');
INSERT INTO PROVINCIAS (provincia) VALUES ('Corrientes');
INSERT INTO PROVINCIAS (provincia) VALUES ('Entre Ríos');
INSERT INTO PROVINCIAS (provincia) VALUES ('Formosa');
INSERT INTO PROVINCIAS (provincia) VALUES ('Jujuy');
INSERT INTO PROVINCIAS (provincia) VALUES ('La Pampa');
INSERT INTO PROVINCIAS (provincia) VALUES ('La Rioja');
INSERT INTO PROVINCIAS (provincia) VALUES ('Mendoza');
INSERT INTO PROVINCIAS (provincia) VALUES ('Misiones');
INSERT INTO PROVINCIAS (provincia) VALUES ('Neuquén');
INSERT INTO PROVINCIAS (provincia) VALUES ('Río Negro');
INSERT INTO PROVINCIAS (provincia) VALUES ('Salta');
INSERT INTO PROVINCIAS (provincia) VALUES ('San Juan');
INSERT INTO PROVINCIAS (provincia) VALUES ('San Luis');
INSERT INTO PROVINCIAS (provincia) VALUES ('Santa Cruz');
INSERT INTO PROVINCIAS (provincia) VALUES ('Santa Fe');
INSERT INTO PROVINCIAS (provincia) VALUES ('Santiago del Estero');
INSERT INTO PROVINCIAS (provincia) VALUES ('Tierra del Fuego');
INSERT INTO PROVINCIAS (provincia) VALUES ('Tucumán');

-----------------------CIUDADES---------------------------------
-- Buenos Aires (id_provincia = 1)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('La Plata', 1);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Mar del Plata', 1);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Bahía Blanca', 1);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Quilmes', 1);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Tandil', 1);

-- Catamarca (id_provincia = 2)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Fernando del Valle de Catamarca', 2);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Tinogasta', 2);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Belén', 2);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Santa María', 2);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Andalgalá', 2);

-- Chaco (id_provincia = 3)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Resistencia', 3);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Presidencia Roque Sáenz Peña', 3);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Villa Ángela', 3);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Charata', 3);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('General José de San Martín', 3);

-- Chubut (id_provincia = 4)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Comodoro Rivadavia', 4);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Trelew', 4);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Puerto Madryn', 4);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Esquel', 4);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Rawson', 4);

-- Córdoba (id_provincia = 5)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Córdoba', 5);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Villa Carlos Paz', 5);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Río Cuarto', 5);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Villa María', 5);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Francisco', 5);

-- Corrientes (id_provincia = 6)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Corrientes', 6);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Goya', 6);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Paso de los Libres', 6);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Mercedes', 6);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Santo Tomé', 6);

-- Entre Ríos (id_provincia = 7)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Paraná', 7);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Concordia', 7);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Gualeguaychú', 7);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Concepción del Uruguay', 7);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Victoria', 7);

-- Formosa (id_provincia = 8)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Formosa', 8);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Clorinda', 8);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Pirané', 8);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('El Colorado', 8);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Ingeniero Juárez', 8);

-- Jujuy (id_provincia = 9)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Salvador de Jujuy', 9);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Pedro', 9);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Palpalá', 9);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Libertador General San Martín', 9);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Perico', 9);

-- La Pampa (id_provincia = 10)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Santa Rosa', 10);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('General Pico', 10);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Toay', 10);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('25 de Mayo', 10);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Victorica', 10);

-- La Rioja (id_provincia = 11)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('La Rioja', 11);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Chilecito', 11);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Aimogasta', 11);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Chamical', 11);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Chepes', 11);

-- Mendoza (id_provincia = 12)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Mendoza', 12);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Rafael', 12);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Godoy Cruz', 12);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Maipú', 12);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Luján de Cuyo', 12);

-- Misiones (id_provincia = 13)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Posadas', 13);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Oberá', 13);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Eldorado', 13);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Puerto Iguazú', 13);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Leandro N. Alem', 13);

-- Neuquén (id_provincia = 14)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Neuquén', 14);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Martín de los Andes', 14);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Plottier', 14);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Cutral Co', 14);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Centenario', 14);

-- Río Negro (id_provincia = 15)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Bariloche', 15);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('General Roca', 15);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Cipolletti', 15);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Viedma', 15);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Villa Regina', 15);

-- Salta (id_provincia = 16)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Salta', 16);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Ramón de la Nueva Orán', 16);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Tartagal', 16);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('General Güemes', 16);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Metán', 16);

-- San Juan (id_provincia = 17)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Juan', 17);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Rawson', 17);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Rivadavia', 17);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Chimbas', 17);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Pocito', 17);

-- San Luis (id_provincia = 18)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Luis', 18);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Villa Mercedes', 18);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Merlo', 18);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('La Punta', 18);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Justo Daract', 18);

-- Santa Cruz (id_provincia = 19)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Río Gallegos', 19);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Caleta Olivia', 19);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('El Calafate', 19);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Pico Truncado', 19);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Las Heras', 19);

-- Santa Fe (id_provincia = 20)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Rosario', 20);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Santa Fe', 20);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Rafaela', 20);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Venado Tuerto', 20);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Reconquista', 20);

-- Santiago del Estero (id_provincia = 21)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Santiago del Estero', 21);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('La Banda', 21);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Termas de Río Hondo', 21);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Añatuya', 21);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Monte Quemado', 21);

-- Tierra del Fuego (id_provincia = 22)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Ushuaia', 22);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Río Grande', 22);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Tolhuin', 22);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Cerro Sombrero', 22);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Sebastián', 22);

-- Tucumán (id_provincia = 23)
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('San Miguel de Tucumán', 23);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Tafí Viejo', 23);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Concepción', 23);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Yerba Buena', 23);
INSERT INTO CIUDADES (ciudad, id_provincia) VALUES ('Monteros', 23);

------------------------------BARRIOS-------------------------------------------

-- Barrios de La Plata (id_ciudad = 1)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Casco Urbano', 1);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Elisa', 1);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('City Bell', 1);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Hornos', 1);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tolosa', 1);

-- Barrios de Mar del Plata (id_ciudad = 2)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Troncos', 2);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Punta Mogotes', 2);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 2);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Perla', 2);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Playa Grande', 2);

-- Barrios de Bahía Blanca (id_ciudad = 3)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Aldea Romana', 3);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Universitario', 3);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Palihue', 3);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Mitre', 3);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tiro Federal', 3);

-- Barrios de Quilmes (id_ciudad = 4)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bernal', 4);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Ezpeleta', 4);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Solano', 4);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Colonia', 4);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa La Florida', 4);

-- Barrios de Tandil (id_ciudad = 5)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 5);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Italia', 5);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Cerro Leones', 5);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Tunitas', 5);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Palermo', 5);

-- Barrios de San Fernando del Valle de Catamarca (id_ciudad = 6)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 6);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Cubas', 6);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Parque América', 6);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Marta', 6);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Chacarita', 6);

-- Barrios de Tinogasta (id_ciudad = 7)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 7);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Barrio La Paz', 7);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Isidro', 7);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Progreso', 7);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Abaucán', 7);

-- Barrios de Belén (id_ciudad = 8)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Antonio', 8);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Puntilla', 8);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Roque', 8);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Molino', 8);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Luis', 8);

-- Barrios de Santa María (id_ciudad = 9)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 9);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Recreo', 9);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Sauces', 9);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Rosa', 9);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Famatanca', 9);

-- Barrios de Andalgalá (id_ciudad = 10)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 10);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Malligasta', 10);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Vil', 10);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Huachaschi', 10);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Choya', 10);

-- Barrios de Resistencia (id_ciudad = 11)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Río Negro', 11);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 11);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa San Martín', 11);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Don Enrique', 11);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Barranqueras', 11);

-- Barrios de Presidencia Roque Sáenz Peña (id_ciudad = 12)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 12);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Néstor Kirchner', 12);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Evita', 12);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 12);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lamadrid', 12);

-- Barrios de Villa Ángela (id_ciudad = 13)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 13);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Escalada', 13);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 13);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Progreso', 13);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 13);

-- Barrios de Charata (id_ciudad = 14)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 14);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Itatí', 14);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Belgrano', 14);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Antonio', 14);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Jorge', 14);

-- Barrios de General José de San Martín (id_ciudad = 15)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 15);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 15);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Picada', 15);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Progreso', 15);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Norte', 15);

-- Barrios de Comodoro Rivadavia (id_ciudad = 16)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 16);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pueyrredón', 16);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Roca', 16);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Petroleros', 16);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 16);

-- Barrios de Puerto Madryn (id_ciudad = 17)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 17);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 17);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Norte', 17);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Roque González', 17);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Roca', 17);

-- Barrios de Trelew (id_ciudad = 18)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 18);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Sauces', 18);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Amaya', 18);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Don Bosco', 18);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Progreso', 18);

-- Barrios de Esquel (id_ciudad = 19)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 19);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Cerro La Cruz', 19);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bella Vista', 19);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Buenos Aires', 19);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Progreso', 19);

-- Barrios de Rawson (id_ciudad = 20)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 20);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Ramón', 20);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Tehuelche', 20);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Playa Unión', 20);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Luis Vernet', 20);

-- Barrios de Corrientes (id_ciudad = 21)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Boca Unidos', 21);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Arazaty', 21);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 21);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Molina Punta', 21);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Gerónimo', 21);

-- Barrios de Goya (id_ciudad = 22)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 22);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Itatí', 22);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 22);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Esperanza', 22);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Puerto Boca', 22);

-- Barrios de Paso de los Libres (id_ciudad = 23)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 23);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Plaza San Martín', 23);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Primavera', 23);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Invico', 23);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Catamarca', 23);

-- Barrios de Mercedes (id_ciudad = 24)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 24);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 24);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Juan Pablo II', 24);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Mataderos', 24);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Itatí', 24);

-- Barrios de Curuzú Cuatiá (id_ciudad = 25)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 25);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rivadavia', 25);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Rosa', 25);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Dolores', 25);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Belgrano', 25);

-- Barrios de Paraná (id_ciudad = 26)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 26);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Agustín', 26);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Roque', 26);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Urquiza', 26);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Puerto Viejo', 26);

-- Barrios de Concordia (id_ciudad = 27)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 27);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Heras', 27);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Puerto', 27);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Almirante Brown', 27);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Carlos', 27);

-- Barrios de Gualeguaychú (id_ciudad = 28)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 28);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco', 28);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Munilla', 28);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Suburbio Sur', 28);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Barrio La Cuchilla', 28);

-- Barrios de Concepción del Uruguay (id_ciudad = 29)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 29);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Isidro', 29);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('María Auxiliadora', 29);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zapata', 29);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Pinos', 29);

-- Barrios de Villaguay (id_ciudad = 30)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 30);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Malvina', 30);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San José', 30);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Progreso', 30);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Estación', 30);

-- Barrios de Formosa (id_ciudad = 31)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 31);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Miguel', 31);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa del Carmen', 31);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Libertad', 31);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Simón Bolívar', 31);

-- Barrios de Clorinda (id_ciudad = 32)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 32);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('1º de Mayo', 32);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('25 de Mayo', 32);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Agua Potable', 32);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Antonio', 32);

-- Barrios de El Colorado (id_ciudad = 33)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 33);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 33);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Boca', 33);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Cayetano', 33);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Itatí', 33);

-- Barrios de Ingeniero Juárez (id_ciudad = 34)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 34);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Juan', 34);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lote 18', 34);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pueblo Viejo', 34);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Laguna Yema', 34);

-- Barrios de Laguna Blanca (id_ciudad = 35)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 35);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lote 8', 35);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Esperanza', 35);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco', 35);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa La Paz', 35);

-- Barrios de San Salvador de Jujuy (id_ciudad = 36)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 36);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Alto Comedero', 36);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Cuyaya', 36);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Perales', 36);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco', 36);

-- Barrios de Palpalá (id_ciudad = 37)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 37);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San José', 37);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Chingo', 37);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Molinos', 37);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tibujío', 37);

-- Barrios de Libertador General San Martín (id_ciudad = 38)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 38);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Carmen', 38);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Naranjos', 38);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Pedro', 38);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Yala', 38);

-- Barrios de San Pedro (id_ciudad = 39)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 39);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pueblo Nuevo', 39);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Esmeralda', 39);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 39);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Progreso', 39);

-- Barrios de San Fernando (id_ciudad = 40)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 40);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Virreyes', 40);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Fernando', 40);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Carlos', 40);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Victoria', 40);

-- Barrios de San Isidro (id_ciudad = 41)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 41);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Acassuso', 41);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Beccar', 41);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Isidro', 41);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Cayetano', 41);

-- Barrios de Pilar (id_ciudad = 42)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 42);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Manuel Alberti', 42);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pilar Centro', 42);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Lonja', 42);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Del Viso', 42);

-- Barrios de Merlo (id_ciudad = 43)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 43);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Antonio de Padua', 43);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Libertad', 43);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Parque San Martín', 43);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bajo Los Molinos', 43);

-- Barrios de La Matanza (id_ciudad = 44)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Justo', 44);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Luzuriaga', 44);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rafael Castillo', 44);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lomas del Mirador', 44);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Isidro Casanova', 44);

-- Barrios de La Plata (id_ciudad = 45)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Casco Urbano', 45);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Elisa', 45);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('City Bell', 45);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Hornos', 45);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tolosa', 45);

-- Barrios de San Juan (id_ciudad = 46)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 46);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rawson', 46);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rivadavia', 46);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chimbas', 46);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pocito', 46);

-- Barrios de San Luis (id_ciudad = 47)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 47);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Mercedes', 47);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Merlo', 47);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Punta', 47);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Justo Daract', 47);

-- Barrios de Río Gallegos (id_ciudad = 48)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 48);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Viedma', 48);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Avenida San Martín', 48);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Heras', 48);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Benito', 48);

-- Barrios de Caleta Olivia (id_ciudad = 49)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 49);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Caleta Córdova', 49);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Yrigoyen', 49);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('26 de Junio', 49);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Gorosito', 49);

-- Barrios de El Calafate (id_ciudad = 50)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 50);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Puerto Moreno', 50);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Condores', 50);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Trébol', 50);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Calafate', 50);

-- Barrios de Pico Truncado (id_ciudad = 51)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 51);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Perito Moreno', 51);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Cruz del Sur', 51);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Cruz', 51);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pico Norte', 51);

-- Barrios de Santa Fe (id_ciudad = 52)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 52);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Catedral', 52);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Retiro', 52);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 52);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 52);

-- Barrios de Rosario (id_ciudad = 53)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 53);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pichincha', 53);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Echesortu', 53);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Arroyito', 53);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Florida', 53);

-- Barrios de San Nicolás (id_ciudad = 54)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 54);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Emilia', 54);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rosa', 54);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Norte', 54);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Oeste', 54);

-- Barrios de Venado Tuerto (id_ciudad = 55)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 55);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 55);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 55);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Elortondo', 55);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco', 55);

-- Barrios de Paraná (id_ciudad = 56)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 56);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Centro', 56);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 56);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Loma', 56);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Norte', 56);

-- Barrios de Córdoba (id_ciudad = 57)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 57);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Nueva Córdoba', 57);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Alta Córdoba', 57);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Ciudad Universitaria', 57);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('General Paz', 57);

-- Barrios de Villa María (id_ciudad = 58)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 58);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 58);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Acacias', 58);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 58);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Neuquén', 58);

-- Barrios de Río Cuarto (id_ciudad = 59)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 59);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Alto Este', 59);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Oeste', 59);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sudeste', 59);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 59);

-- Barrios de Neuquén (id_ciudad = 60)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 60);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Valle de Rivadavia', 60);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Ciudad del Neuquén', 60);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Confluencia', 60);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Plottier', 60);

-- Barrios de San Martín de los Andes (id_ciudad = 61)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 61);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Aguas Arriba', 61);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chapelco', 61);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Rápidos', 61);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lolog', 61);

-- Barrios de Bariloche (id_ciudad = 62)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 62);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Llao Llao', 62);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Civic Center', 62);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Campanario', 62);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pátagonica', 62);

-- Barrios de Ushuaia (id_ciudad = 63)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 63);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Misión', 63);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Río Pipo', 63);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Andorra', 63);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Morros', 63);

-- Barrios de El Calafate (id_ciudad = 64)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 64);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Hielos', 64);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pico Alto', 64);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Cañadones', 64);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Laguna Negra', 64);

-- Barrios de Río Gallegos (id_ciudad = 65)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 65);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Viedma', 65);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Benito', 65);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Jorge', 65);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Plaza de los Derechos Humanos', 65);

-- Barrios de San Carlos de Bariloche (id_ciudad = 66)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 66);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Llao Llao', 66);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Arelauquen', 66);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Cóndor', 66);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Campanario', 66);

-- Barrios de Tolhuin (id_ciudad = 67)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 67);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Moras', 67);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Ñires', 67);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Cipreses', 67);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Pinos', 67);

-- Barrios de Caleta Olivia (id_ciudad = 68)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 68);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Norte', 68);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Sur', 68);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Benito', 68);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Parque Industrial', 68);

-- Barrios de Puerto Madryn (id_ciudad = 69)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 69);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Dorado', 69);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 69);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Loma', 69);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Playa', 69);

-- Barrios de Gualeguaychú (id_ciudad = 70)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 70);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 70);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 70);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Este', 70);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Oeste', 70);

-- Barrios de Concepción del Uruguay (id_ciudad = 71)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 71);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Norte', 71);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Oeste', 71);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Este', 71);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sudeste', 71);

-- Barrios de Concordia (id_ciudad = 72)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 72);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 72);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 72);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Suroeste', 72);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Este', 72);

-- Barrios de Villa María (id_ciudad = 73)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 73);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 73);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Acacias', 73);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 73);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Neuquén', 73);

-- Barrios de Alta Gracia (id_ciudad = 74)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 74);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 74);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Vina', 74);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa María', 74);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Rosas', 74);

-- Barrios de Río Tercero (id_ciudad = 75)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 75);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Este', 75);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 75);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sudoeste', 75);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noreste', 75);

-- Barrios de San Francisco (id_ciudad = 76)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 76);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Norte', 76);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Este', 76);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Oeste', 76);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 76);

-- Barrios de San Luis (id_ciudad = 77)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 77);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Punta', 77);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Mercedes', 77);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Merlo', 77);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Justo Daract', 77);

-- Barrios de San Juan (id_ciudad = 78)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 78);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chimbas', 78);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rawson', 78);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rivadavia', 78);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pocito', 78);

-- Barrios de Catamarca (id_ciudad = 79)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 79);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Chacarita', 79);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Rosa', 79);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Cubas', 79);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Fray Mamerto Esquiú', 79);

-- Barrios de La Rioja (id_ciudad = 80)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 80);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Vuelta de Obligado', 80);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chilecito', 80);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Famatina', 80);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sanagasta', 80);

-- Barrios de Mendoza (id_ciudad = 81)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 81);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chacras de Coria', 81);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Godoy Cruz', 81);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Rafael', 81);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Maipú', 81);

-- Barrios de San Rafael (id_ciudad = 82)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 82);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Molino', 82);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Paredes', 82);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Yunta', 82);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Martín', 82);

-- Barrios de Godoy Cruz (id_ciudad = 83)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 83);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Dorrego', 83);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tomba', 83);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa del Parque', 83);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Corralitos', 83);

-- Barrios de Maipú (id_ciudad = 84)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 84);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rodeo del Medio', 84);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Cava', 84);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Primavera', 84);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Antigua', 84);

-- Barrios de Chacras de Coria (id_ciudad = 85)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 85);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Barrancos', 85);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Puntilla', 85);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Bermejo', 85);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Ñangueros', 85);

-- Barrios de San Juan (id_ciudad = 86)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 86);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Chimbas', 86);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rawson', 86);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rivadavia', 86);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pocito', 86);

-- Barrios de San Fernando del Valle de Catamarca (id_ciudad = 87)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 87);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santa Rosa', 87);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Cubas', 87);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Chacarita', 87);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Fray Mamerto Esquiú', 87);

-- Barrios de La Plata (id_ciudad = 88)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 88);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Gonnet', 88);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('City Bell', 88);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Hornos', 88);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Elvira', 88);

-- Barrios de Avellaneda (id_ciudad = 89)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 89);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Dominico', 89);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Dock Sud', 89);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarandí', 89);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Avellaneda Centro', 89);

-- Barrios de Lanús (id_ciudad = 90)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 90);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Remedios de Escalada', 90);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lanús Este', 90);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lanús Oeste', 90);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Monte Chingolo', 90);

-- Barrios de Lomas de Zamora (id_ciudad = 91)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 91);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Temperley', 91);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lomas Centro', 91);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Albertina', 91);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Parque Barón', 91);

-- Barrios de Quilmes (id_ciudad = 92)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 92);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bernal', 92);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Quilmes Oeste', 92);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Ezpeleta', 92);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco Solano', 92);

-- Barrios de Moreno (id_ciudad = 93)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 93);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Reja', 93);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Paso del Rey', 93);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rafael Castillo', 93);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Trujui', 93);

-- Barrios de San Justo (id_ciudad = 94)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 94);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Alberto', 94);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Palomar', 94);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Luis', 94);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Madero', 94);

-- Barrios de Pilar (id_ciudad = 95)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 95);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Manuel Alberti', 95);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pilar Centro', 95);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Rosa', 95);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Derqui', 95);

-- Barrios de Tigre (id_ciudad = 96)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 96);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Nordelta', 96);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rincón de Milberg', 96);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Benavídez', 96);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Don Torcuato', 96);

-- Barrios de San Fernando (id_ciudad = 97)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 97);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Virreyes', 97);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Carlos', 97);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Fernando Centro', 97);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Boulogne', 97);

-- Barrios de San Isidro (id_ciudad = 98)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 98);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Beccar', 98);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Martínez', 98);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Isidro', 98);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Adelina', 98);

-- Barrios de San Nicolás (id_ciudad = 99)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 99);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Emilia', 99);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rosa', 99);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Norte', 99);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Zona Oeste', 99);

-- Barrios de Rosario (id_ciudad = 100)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 100);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Pichincha', 100);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Echesortu', 100);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Arroyito', 100);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Florida', 100);

-- Barrios de Santa Fe (id_ciudad = 101)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 101);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Catedral', 101);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Retiro', 101);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sur', 101);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Noroeste', 101);

-- Barrios de Paraná (id_ciudad = 102)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 102);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Floresta', 102);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Santa Fe', 102);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Loma', 102);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Playa Santa Fe', 102);

-- Barrios de Corrientes (id_ciudad = 103)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 103);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Gerónimo', 103);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Francisco', 103);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Riachuelo', 103);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bañado Norte', 103);

-- Barrios de Resistencia (id_ciudad = 104)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 104);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Don Andrés', 104);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Río Negro', 104);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Barrio Norte', 104);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Barrio Sur', 104);

-- Barrios de Formosa (id_ciudad = 105)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 105);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Palmar', 105);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Antonio', 105);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa Hermosa', 105);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Quebracho', 105);

-- Barrios de Jujuy (id_ciudad = 106)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 106);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Alto Padilla', 106);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Salvador', 106);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Perales', 106);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Viña', 106);

-- Barrios de Salta (id_ciudad = 107)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 107);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Grand Bourg', 107);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Luis', 107);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Villa 20 de Febrero', 107);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Lomas de Medeiros', 107);

-- Barrios de Tucumán (id_ciudad = 108)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 108);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Yerba Buena', 108);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('San Miguel de Tucumán', 108);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tafí Viejo', 108);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Concepción', 108);

-- Barrios de Santiago del Estero (id_ciudad = 109)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 109);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sargento Cabral', 109);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Banda', 109);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Madre de Ciudades', 109);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Santiago', 109);

-- Barrios de Río Gallegos (id_ciudad = 110)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 110);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Regional', 110);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Violeta', 110);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Tierra de Fuego', 110);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Independencia', 110);

-- Barrios de Ushuaia (id_ciudad = 111)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 111);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Río Grande', 111);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Los Ñires', 111);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Punta Arenas', 111);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Heras', 111);

-- Barrios de Puerto Madryn (id_ciudad = 112)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 112);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Avenida', 112);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Las Marías', 112);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Bajo de las Sombras', 112);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rosa', 112);

-- Barrios de Trelew (id_ciudad = 113)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 113);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Valle Chico', 113);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('La Toma', 113);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Rawson', 113);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Mendoza', 113);

-- Barrios de Comodoro Rivadavia (id_ciudad = 114)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 114);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Km 3', 114);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Km 5', 114);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Ciudadela', 114);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Sarmiento', 114);

-- Barrios de San Carlos de Bariloche (id_ciudad = 115)
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Centro', 115);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Civic Center', 115);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Playa Bonita', 115);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('Piedras Blancas', 115);
INSERT INTO BARRIOS (barrio, id_ciudad) VALUES ('El Alto', 115);

CREATE TABLE TIPOS_DOCUMENTOS(
	id_tipo_doc int IDENTITY(1,1),
	tipo_documento varchar(50) NOT NULL
	CONSTRAINT PK_TIPOS_DOCUMENTOS PRIMARY KEY (id_tipo_doc)
)
----------------------------TIPOS DOC---------------------------------------------------

INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('DNI');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('Pasaporte');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('Licencia de Conducir');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('CUIT');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('LE (Libreta de Enrolamiento)');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('LC (Libreta Cívica)');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('Cédula de Identidad');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('Tarjeta de Residencia');
INSERT INTO TIPOS_DOCUMENTOS (tipo_documento) VALUES ('Certificado de Nacimiento');


CREATE TABLE CLIENTES (
    id_cliente int IDENTITY(1,1),
    id_barrio int NOT NULL,
	id_tipo_doc int NOT NULL,
	documento varchar(20) NOT NULL, -- no lo hacemos primary key por diferencias creativas
    nombre varchar(50) NOT NULL,
    apellido varchar(50) NOT NULL,
	direccion varchar(100) NOT NULL,
	nro_calle int NOT NULL,
	estado bit, -- para ejecutar una baja logica
    CONSTRAINT PK_CLIENTES PRIMARY KEY (id_cliente),
    CONSTRAINT FK_CLIENTES_BARRIOS FOREIGN KEY (id_barrio) 
		REFERENCES Barrios(Id_Barrio),
	CONSTRAINT FK_CLIENTES_TIPOS_DOCUMENTOS FOREIGN KEY (id_tipo_doc)
		REFERENCES Tipos_Documentos (id_tipo_doc)
)
 -----------------------------CLIENTES------------------------------------------

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (8, 2, '12345678', 'Juan', 'Pérez', 'Calle de la Reconquista', 120, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (11, 5, 'A1234567', 'Ana', 'Gómez', 'Av. Francisco Beiró', 3050, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (20, 3, '98765432', 'Luis', 'Martínez', 'Av. Pueyrredón', 300, 0);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (15, 6, '20-12345678-9', 'María', 'Rodríguez', 'Calle San Martín', 400, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (7, 7, '12345678', 'Carlos', 'García', 'Av. Libertador', 500, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (5, 1, 'LC123456', 'Laura', 'Fernández', 'Calle La Chacarita', 600, 0);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (14, 8, 'A9876543', 'José', 'Lopez', 'Calle 6', 700, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (9, 9, '98765432', 'Sofía', 'Sánchez', 'Av. Mitre', 800, 1);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (13, 2, 'CR123456', 'Miguel', 'Cruz', 'Calle 9 de Julio', 900, 0);

INSERT INTO CLIENTES (id_barrio, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle, estado)
VALUES (12, 4, '67890123', 'Paula', 'Benítez', 'Calle Almirante Brown', 1000, 1);


CREATE TABLE ROLES_EMPLEADO (
    id_rol int IDENTITY(1,1) ,
    rol varchar(50) NOT NULL,  -- ARMADOR PC | CAJERO | CM 
	desc_rol varchar(255),  -- SU TRABAJO CONSITE EN BUSCAR EN EL DEPOSITO LAS PIEZAS Y ENSAMBLAR LAS PCS | ATIENDE EN LA CAJA Y EL TELEFONO | SE ENCARGA DE LAS REDES DE LA TIENDA
    CONSTRAINT PK_ROLES_EMPLEADO PRIMARY KEY (id_rol),
)

------------------------------ROLES_EMPLADOS--------------------------------------------

INSERT INTO ROLES_EMPLEADO (rol, desc_rol) 
VALUES ('ARMADOR PC', 'SU TRABAJO CONSISTE EN BUSCAR EN EL DEPOSITO LAS PIEZAS Y ENSAMBLAR LAS PC');

INSERT INTO ROLES_EMPLEADO (rol, desc_rol) 
VALUES ('CAJERO', 'ATIENDE EN LA CAJA Y EL TELEFONO Y LAS REDES SOCIALES');

INSERT INTO ROLES_EMPLEADO (rol, desc_rol) 
VALUES ('ARMADOR PEDIDO', 'SE ENCARGA DE RECOLECTAR Y PREPARAR LOS PEDIDOS PARA SU ENVÍO');

INSERT INTO ROLES_EMPLEADO (rol, desc_rol) 
VALUES ('TÉCNICO', 'REALIZA REPARACIONES Y MANTENIMIENTO DE EQUIPOS Y DISPOSITIVOS');

INSERT INTO ROLES_EMPLEADO (rol, desc_rol) 
VALUES ('ADMINISTRADOR', 'SE ENCARGA DE LA GESTIÓN Y SUPERVISIÓN DE LOS RECURSOS DE LA EMPRESA');

CREATE TABLE EMPLEADOS (
    legajo_emp int IDENTITY(1,1),
	id_barrio int NOT NULL,
	id_rol int NOT NULL,
	id_tipo_doc int NOT NULL,
	documento varchar(20) NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    direccion varchar(100) NOT NULL,
	nro_calle int NOT NULL,
	pass varchar(50) NULL,
	estado bit, -- para ejecutar una baja logica
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (legajo_emp),
    CONSTRAINT FK_EMPLEADOS_BARRIOS FOREIGN KEY (id_barrio) 
		REFERENCES Barrios(id_barrio),
	CONSTRAINT FK_EMPLEADOS_ROLES_EMPLEADO FOREIGN KEY (id_rol)
		REFERENCES Roles_Empleado(id_rol),
	CONSTRAINT FK_EMPLEADOS_TIPOS_DOCUMENTOS FOREIGN KEY (id_tipo_doc)
		REFERENCES  TIPOS_DOCUMENTOS (id_tipo_doc)
)
------------------------------EMPLEADOS-------------------------------------------------------

-- Empleado para el rol "ARMADOR PC"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (8, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'ARMADOR PC'), 3, '12345678', 'Juan', 'Pérez', 'Calle de la Reconquista', 120,null, 1);

-- Empleado para el rol "CAJERO"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (11, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'CAJERO'), 5, 'A1234567', 'Ana', 'Gómez', 'Av. Francisco Beiró', 3050,null, 1);

-- Empleado para el rol "TÉCNICO"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (15, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'TÉCNICO'), 7, '20-12345678-9', 'María', 'Rodríguez', 'Calle San Martín', 400,null, 1);

-- Empleado para el rol "ADMINISTRADOR"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (5, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'ADMINISTRADOR'), 8, '12345678', 'Carlos', 'García', 'Av. Libertador', 500,'admin1w3', 1);

-- Empleado 1 para el rol "ARMADOR PEDIDO"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (9, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'ARMADOR PEDIDO'), 2, '45678901', 'Martín', 'Fernández', 'Calle Figueroa', 150,null, 1);

-- Empleado 2 para el rol "ARMADOR PEDIDO"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (12, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'ARMADOR PEDIDO'), 4, 'B5678901', 'Camila', 'López', 'Av. Libertador', 1600,null, 1);

-- Empleado 3 para el rol "ARMADOR PEDIDO"
INSERT INTO EMPLEADOS (id_barrio, id_rol, id_tipo_doc, documento, nombre, apellido, direccion, nro_calle,pass, estado)
VALUES (14, (SELECT id_rol FROM ROLES_EMPLEADO WHERE rol = 'ARMADOR PEDIDO'), 5, 'C6789012', 'Federico', 'Sosa', 'Calle Belgrano', 220,null, 0);

CREATE TABLE TIPOS_CONTACTOS (
id_tipo_contacto int IDENTITY(1,1),
descripcion varchar (100) NOT NULL -- CELULAR |  EMAIL | TELEFONO FIJO | INSTAGRAM
CONSTRAINT PK_TIPOS_CONTACTOS PRIMARY KEY (id_tipo_contacto)
)
-------------------------------TIPO CONTACTOS-------------------------------------------

-- Inserts para TIPOS_CONTACTOS

INSERT INTO TIPOS_CONTACTOS (descripcion) 
VALUES ('CELULAR');

INSERT INTO TIPOS_CONTACTOS (descripcion) 
VALUES ('EMAIL');

INSERT INTO TIPOS_CONTACTOS (descripcion) 
VALUES ('TELEFONO FIJO');

INSERT INTO TIPOS_CONTACTOS (descripcion) 
VALUES ('INSTAGRAM');

 

CREATE TABLE CONTACTOS (
id_contacto int IDENTITY(1,1),
id_tipo_contacto int NOT NULL, -- (1)CELULAR | (2)EMAIL
contacto varchar(100) NOT NULL,  -- 351848934 | CLIENTE1@GMAIL.COM
principal bit , -- TRUE | FALSE
id_cliente int,  -- 1 | 1 
legajo_emp int, -- NULL | NULL
CONSTRAINT PK_CONTACTOS PRIMARY KEY (id_contacto),
CONSTRAINT FK_CONTACTOS_CLIENTES FOREIGN KEY (id_cliente)
	REFERENCES CLIENTES (id_cliente),
CONSTRAINT FK_CONTACTOS_TIPOS_CONTACTOS FOREIGN KEY (id_tipo_contacto)
	REFERENCES TIPOS_CONTACTOS (id_tipo_contacto),
CONSTRAINT FK_CONCTACTOS_EMPLEADOS FOREIGN KEY (legajo_emp)
	REFERENCES EMPLEADOS (legajo_emp)
)
--------------------------------------------CONTACTOS------------------------------------------------


-- Contactos para Juan Pérez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351848934', 1, 1, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 1

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'juan.perez@gmail.com', 0, 1, NULL); -- Contacto secundario de tipo EMAIL para el cliente con id_cliente = 1

-- Contactos para Ana Gómez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351123456', 1, 2, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 2

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (3, '011-4555-1234', 0, 2, NULL); -- Contacto secundario de tipo TELEFONO FIJO para el cliente con id_cliente = 2

-- Contactos para Luis Martínez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351654321', 1, 3, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 3

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (4, 'luis.martinez@instagram.com', 0, 3, NULL); -- Contacto secundario de tipo INSTAGRAM para el cliente con id_cliente = 3

-- Contactos para María Rodríguez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351789456', 1, 4, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 4

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'maria.rodriguez@gmail.com', 0, 4, NULL); -- Contacto secundario de tipo EMAIL para el cliente con id_cliente = 4

-- Contactos para Carlos García
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351321987', 1, 5, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 5

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (3, '011-5566-7890', 0, 5, NULL); -- Contacto secundario de tipo TELEFONO FIJO para el cliente con id_cliente = 5

-- Contactos para Laura Fernández
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351987321', 1, 6, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 6

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (4, 'laura.fernandez@instagram.com', 0, 6, NULL); -- Contacto secundario de tipo INSTAGRAM para el cliente con id_cliente = 6

-- Contactos para José Lopez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351456789', 1, 7, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 7

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'jose.lopez@gmail.com', 0, 7, NULL); -- Contacto secundario de tipo EMAIL para el cliente con id_cliente = 7

-- Contactos para Sofía Sánchez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351678901', 1, 8, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 8

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'sofia.sanchez@gmail.com', 0, 8, NULL); -- Contacto secundario de tipo EMAIL para el cliente con id_cliente = 8

-- Contactos para Miguel Cruz
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351234567', 1, 9, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 9

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (3, '011-1122-3344', 0, 9, NULL); -- Contacto secundario de tipo TELEFONO FIJO para el cliente con id_cliente = 9

-- Contactos para Paula Benítez
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351345678', 1, 10, NULL); -- Contacto principal de tipo CELULAR para el cliente con id_cliente = 10

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'paula.benitez@gmail.com', 0, 10, NULL); -- Contacto secundario de tipo EMAIL para el cliente con id_cliente = 10


-- Contactos para Juan Pérez (Armador PC)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351848934', 1, NULL, 1); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 1

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'juan.perez@gmail.com', 0, NULL, 1); -- Contacto secundario de tipo EMAIL para el empleado con legajo_emp = 1

-- Contactos para Ana Gómez (Cajero)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351123456', 1, NULL, 2); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 2

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (3, '011-4555-1234', 0, NULL, 2); -- Contacto secundario de tipo TELEFONO FIJO para el empleado con legajo_emp = 2

-- Contactos para María Rodríguez (Técnico)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351654321', 1, NULL, 3); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 3

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (4, 'maria.rodriguez@instagram.com', 0, NULL, 3); -- Contacto secundario de tipo INSTAGRAM para el empleado con legajo_emp = 3

-- Contactos para Carlos García (Administrador)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351321987', 1, NULL, 4); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 4

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'carlos.garcia@gmail.com', 0, NULL, 4); -- Contacto secundario de tipo EMAIL para el empleado con legajo_emp = 4

-- Contactos para Martín Fernández (Armador Pedido 1)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351456789', 1, NULL, 5); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 5

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (2, 'martin.fernandez@gmail.com', 0, NULL, 5); -- Contacto secundario de tipo EMAIL para el empleado con legajo_emp = 5

-- Contactos para Camila López (Armador Pedido 2)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351567890', 1, NULL, 6); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 6

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (3, '011-5666-1234', 0, NULL, 6); -- Contacto secundario de tipo TELEFONO FIJO para el empleado con legajo_emp = 6

-- Contactos para Federico Sosa (Armador Pedido 3)
INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (1, '351678901', 1, NULL, 7); -- Contacto principal de tipo CELULAR para el empleado con legajo_emp = 7

INSERT INTO CONTACTOS (id_tipo_contacto, contacto, principal, id_cliente, legajo_emp)
VALUES (4, 'federico.sosa@instagram.com', 0, NULL, 7); -- Contacto secundario de tipo INSTAGRAM para el empleado con legajo_emp = 7




 ------------------------- COMPONENTES  ----------------------------------

CREATE TABLE Marcas (
    id_marca int IDENTITY(1,1),    
    marca varchar(100) NOT NULL,    -- KINGSTON | SENTEY | ASUS | ANTEC | AMD | GIGABYTE | ADATA | MSI |
    CONSTRAINT PK_Marcas PRIMARY KEY (id_marca)
)

INSERT INTO MARCAS (marca) VALUES ('KINGSTON') -- 1
INSERT INTO MARCAS (marca) VALUES ('AMD')     -- 2
INSERT INTO MARCAS (marca) VALUES ('INTEL')   -- 3
INSERT INTO MARCAS (marca) VALUES ('ASROCK')   -- 4
INSERT INTO MARCAS (marca) VALUES ('ASUS')    -- 5
INSERT INTO MARCAS (marca) VALUES ('GIGABYTE')  -- 6
INSERT INTO MARCAS (marca) VALUES ('MSI')      -- 7
INSERT INTO MARCAS (marca) VALUES ('ZOTAC')    -- 8
INSERT INTO MARCAS (marca) VALUES ('SENTEY')   -- 9
INSERT INTO MARCAS (marca) VALUES ('ANTEC')    -- 10
INSERT INTO MARCAS (marca) VALUES ('CORSAIR')   -- 11 
INSERT INTO MARCAS (marca) VALUES ('COOLER MASTER') -- 12
INSERT INTO MARCAS (marca) VALUES ('ADATA')      -- 13
 
CREATE TABLE Tipos_Componentes (
    id_tipo_componente int IDENTITY(1,1),
    tipo varchar(100) NOT NULL, -- RAM | TARJETA DE VIDEO | PROCESADOR | MOTHERBOARD
    CONSTRAINT PK_Tipos_Componentes PRIMARY KEY (id_tipo_componente)
)
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('MEMORIA RAM') -- 1
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('PLACA DE VIDEO') -- 2
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('MICROPROSESADOR') -- 3 
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('MOTHERBOARD')   -- 4
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('GABINETE')   -- 5
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('FUENTE DE PODER') -- 6
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('COOLER')         -- 7
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('DISCO RIGIDO')    -- 8
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('DISCO SOLIDO')   -- 9
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('MONITOR')         -- 10
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('TECLADO')           -- 11
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('MOUSE')               -- 12
INSERT INTO TIPOS_COMPONENTES (tipo) VALUES ('AURICULARES')            -- 13

CREATE TABLE Componentes (
    id_componente int IDENTITY(1,1), -- 1
    id_marca int NOT NULL,                    -- 1
    id_tipo_componente int NOT NULL,          -- 1
    nombre varchar(150) NOT NULL,             -- MEMORIA RAM KINGSTON FURY 8GB 3200MHZ
    precio decimal(18,2) NOT NULL,            -- 28.500,30
	stock int NOT NULL,                       -- 12
	stock_minimo int NULL,                -- 4
	url_img varchar(255) null,
    CONSTRAINT PK_COMPONENTES PRIMARY KEY (id_componente),
    CONSTRAINT FK_COMPONENTES_MARCAS FOREIGN KEY (id_marca)
		REFERENCES Marcas(id_marca),
    CONSTRAINT FK_COMPONENTES_TIPOS_COMPONENTES FOREIGN KEY (id_tipo_componente) 
		REFERENCES Tipos_Componentes(id_tipo_componente)
)

-- rams
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  ,      precio  , stock, stock_minimo,url_img)
				 VALUES (1       ,        1          , 'Memoria Ram Kingston Fury DDR4 8GB 3200MHZ', 28500.30 ,  12    ,      4   ,'https://www.invidcomputers.com/images/0000000000413732511680413732.jpg')
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                       , precio   ,   stock,  stock_minimo,url_img)
				 VALUES (13       ,        1          , 'Memoria Ram Adata DDR4 8GB 3200MHZ Premier', 22500 ,  24    ,      6    ,'https://logg.api.cygnus.market/static/logg/Global/Memoria_RAM_ADATA_Premier_DDR4_8GB_3200MHz_CL22/64363a6f7aa34fd280bc7de5f4f315ae.webp')
-- placas video
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  ,                  precio   , stock, stock_minimo,url_img)
				 VALUES (5       ,        2          , 'Placa de Video ASUS Dual Radeon RX 6600 8GB GDDR6 V2', 385000.00 ,  8    ,      2   ,'https://spacegamer.com.ar/img/Public/1058-producto-870d35a6-9f47-462a-89ba-b9728538c193-2880.jpg')
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  ,                  precio   , stock, stock_minimo,url_img)
				 VALUES (7       ,        2          , 'Placa de Video MSI GeForce RTX 3060 12GB GDDR6 VENTUS 2X OC', 400000.00 ,  5    ,      1   ,'https://mexx-img-2019.s3.amazonaws.com/Placa-De-Video-GeForce-RTX-3060-12Gb-Msi-Ventus-2X-OC_47460_1.jpeg')
-- procesadores
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  ,                           precio   ,  stock, stock_minimo,url_img)
				 VALUES (2       ,        3          , 'Procesador AMD Ryzen 5 5600 4.4GHz Turbo + Wraith Stealth Cooler', 185000.99 ,  10    ,      4 ,'https://31store.com.ar/img/Public/1134-producto-amd-ryzen-5-5600-4-4ghz-01-1260.jpg')
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  ,                  precio   ,              stock, stock_minimo,url_img)
				 VALUES (3       ,        3          , 'Procesador Intel Core i3 12100F 4.3GHz Turbo Socket 1700 Alder Lake', 120000.00 ,  7    ,      3   ,'https://imagenes.compragamer.com/productos/compragamer_Imganen_general_31720_Procesador_Intel_Core_i3_12100F_4.3GHz_Turbo_Socket_1700_Alder_Lake_3621db10-grn.jpg')

-- motherboards
INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre                  , precio   , stock, stock_minimo,url_img)
				 VALUES (4       ,        4          , 'Mother Asrock B550M Steel Legend AM4', 155430.89 ,  5    ,      1   ,'https://fullh4rd.com.ar/img/productos/2/mother-asrock-b550m-steel-legend-ddr4-am4-0.jpg')

INSERT INTO Componentes (id_marca, id_tipo_componente,               nombre          ,      precio   , stock, stock_minimo,url_img)
				 VALUES (5       ,        4          , 'Mother ASUS PRIME B660M-A D4',     150000.00 ,  4    ,      2   ,'https://dlcdnwebimgs.asus.com/gain/8d9e3b62-76b3-4755-825c-f940eb1adeb6/w800')
-- Gabinetes
INSERT INTO Componentes (id_marca, id_tipo_componente,                nombre,       precio,  stock, stock_minimo,url_img)
                 VALUES (9,               5,          'Gabinete Sentey S20 RGB ATX', 55000.00, 15,       3      ,'https://www.digitarinformatica.com.ar/wp-content/uploads/2022/04/sentey-S20.jpg')

INSERT INTO Componentes (id_marca, id_tipo_componente,                 nombre,         precio,   stock, stock_minimo,url_img)
				 VALUES (10,           5,            'Gabinete Antec NX210 Mid Tower', 42000.50,    10,        2    ,'https://www.antec.com/product/case/images/nx210-pdt01.png')

-- Fuentes de Poder
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (12, 6, 'Fuente Cooler Master MWE 550W 80 Plus Bronze', 98500.75, 8, 2 ,'https://s3-sa-east-1.amazonaws.com/saasargentina/EQVUKzad5ApdYh5D5obf/imagen')

INSERT INTO Componentes (id_marca, id_tipo_componente,                nombre,                     precio, stock, stock_minimo,url_img)
                  VALUES (11,             6,         'Fuente Corsair CV650 650W 80 Plus Bronze', 88000.99,     12,     3,'https://hard-digital.com.ar/public/files/Fuente%20Corsair%20650w%20Cv650%20Negro%2080%20Plus%20Bronze/5.webp')

-- Coolers
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (12, 7, 'Cooler Master Hyper 212 RGB Black Edition', 44500.50, 20, 5,'https://http2.mlstatic.com/D_NQ_NP_997501-MLB51712937304_092022-O.webp')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (9, 7, 'Cooler Sentey Frost 120mm RGB', 9500.00, 25, 5 ,'https://http2.mlstatic.com/D_742502-MLU79111800875_092024-C.jpg')

-- Discos Rígidos
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (13, 8, 'Disco Rígido Adata HD710 Pro 1TB', 73000.00, 18, 4 ,'https://acdn.mitiendanube.com/stores/001/156/703/products/disco-rigido-1tb-externo-usb-2-0-3-0-adata-hd710-pro-usb-3-2-9b556de4f0f5c1e5db17086297543915-1024-1024.png')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (6, 8, 'Disco Rígido Gigabyte H510 1TB 7200RPM', 61000.50, 10, 3 ,'https://acdn.mitiendanube.com/stores/001/474/949/products/sin-titulo-1-psd8831-d260f1d975f27c70fa16546633690821-1024-1024.jpg')

-- Discos Sólidos
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (1, 9, 'Disco Sólido Kingston A2000 500GB NVMe M.2', 52000.99, 15, 4 ,'https://www.cyberdyne.com.ar/Temp/App_WebSite/App_PictureFiles/Items/SA2000M8-500G_800.jpg')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (13, 9, 'Disco Sólido Adata XPG SX8200 Pro 512GB M.2', 65500.00, 12, 3 ,'https://http2.mlstatic.com/D_NQ_NP_689909-MLA31116151498_062019-O.webp')

-- Monitores
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (5, 10, 'Monitor ASUS TUF Gaming VG27AQ 27" 165Hz', 180000.00, 5, 2 ,'https://http2.mlstatic.com/D_NQ_NP_676177-MLA46134609666_052021-O.webp')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (7, 10, 'Monitor MSI Optix G241 23.8" 144Hz', 145000.00, 6, 2 ,'https://asset.msi.com/resize/image/global/product/product_16073221819eda271d0012e9dafad761ec039b1fdd.png62405b38c58fe0f07fcef2367d8a9ba1/600.png')

-- Teclados
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (11, 11, 'Teclado Corsair K55 RGB PRO', 62000.00, 20, 5 ,'https://http2.mlstatic.com/D_NQ_NP_898256-MLU70064876066_062023-O.webp')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (9, 11, 'Teclado Sentey Lumen RGB', 19500.00, 30, 6 ,'https://git.gestionresellers.com.ar/public_image_server/26133/1567170367')

-- Mouses
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (11, 12, 'Mouse Corsair Harpoon RGB Wireless', 45000.00, 25, 5 ,'https://gorilagames.com/img/Public/1019-producto-corsair-harpoon-wireless-rgb-4-9314.jpg')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (9, 12, 'Mouse Sentey Phoenix RGB 12000 DPI', 10500.00, 35, 7 ,'https://http2.mlstatic.com/D_NQ_NP_988601-MLA32843668695_112019-O.webp')

-- Auriculares
INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (11, 13, 'Auriculares Corsair HS35 Stereo Gaming', 68000.00, 18, 4 ,'https://s3-sa-east-1.amazonaws.com/saasargentina/QXBSc8eh0BbgjsjrAynz/imagen')

INSERT INTO Componentes (id_marca, id_tipo_componente, nombre, precio, stock, stock_minimo,url_img)
VALUES (9, 13, 'Auriculares Sentey Arches RGB 7.1 Surround', 23300.00, 28, 6 ,'https://acdn.mitiendanube.com/stores/001/474/949/products/8123660232301-c829ab09f15373e7e816257950456245-1024-1024.jpg')


CREATE TABLE ESPECIFICACIONES(
	id_espec int IDENTITY(1,1),  
	especificacion varchar(100) NOT NULL,  -- FRECUENCIA | TAMAÑO MEMORIA | TECNOLOGIA |
	CONSTRAINT PK_ESPECIFICACIONES PRIMARY KEY (id_espec)
)
-- Insertando especificaciones adicionales
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Frecuencia')         -- 1 
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tamaño Memoria')     -- 2
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tecnología')         -- 3
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Velocidad')          -- 4
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Conectividad')       -- 5
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Potencia')           -- 6
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Resolución')         -- 7
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Capacidad')          -- 8
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Latencia')           -- 9
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Formato')            -- 10
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tipo de Socket')     -- 11
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Chipset')            -- 12
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Factor de Forma')    -- 13
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Cantidad de Núcleos') -- 14
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Consumo de Energía') -- 15
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tipo de Memoria')    -- 16
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tamaño de Pantalla') -- 17
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tipo de Enfriamiento') -- 18
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Velocidad del Ventilador') -- 19
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Cantidad de Puertos USB') -- 20
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Iluminación RGB')             -- 21
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Velocidad de Transferencia')  -- 22
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Voltaje')                     -- 23
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Compatibilidad')              -- 24
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Material de Construcción')    -- 25
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tipo de Panel')               -- 26
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Tamaño del Ventilador')       -- 27
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Interfaz')                    -- 28
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Frecuencia de Refresco')      -- 29
INSERT INTO ESPECIFICACIONES (especificacion) VALUES ('Compatibilidad VR')       -- 30


-- TABLA PARA SABER QUE VALORES DE ESPECIFICACIÓNES CARGAR SEGUN EL TIPO DE COMPONENTE.
-- RAM --TRAERIA TODAS LAS IDS (SPECS) QUE LE CORRESPONDEN A LAS RAMS

CREATE TABLE TIPOS_COMPONENTES_ESPECIFICACIONES(
	id_tipo_espec int IDENTITY(1,1),  -- 1 | 2 | 
	id_tipo_componente int, -- (1)RAM | (1)RAM |
	id_espec int,  --  FRECUENCIA | TECNOLOGIA |
	CONSTRAINT PK_ID_TIPO_ESPEC PRIMARY KEY (id_tipo_espec),
	CONSTRAINT FK_TIPO_ESPEC_COMP FOREIGN KEY (id_tipo_componente)
			REFERENCES TIPOS_COMPONENTES (id_tipo_componente),
	CONSTRAINT FK_TIPO_ESPEC_ESPEC FOREIGN KEY (id_espec)
			REFERENCES ESPECIFICACIONES (id_espec)
)
-- RAM (ID: 1)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (1, 1)  -- Frecuencia
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (1, 2)  -- Tamaño Memoria
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (1, 3)  -- Tecnología
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (1, 9)  -- Latencia

-- Placa de Video (ID: 2)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (2, 2)  -- Tamaño Memoria
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (2, 16) -- Tipo de Memoria
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (2, 12) -- Chipset

-- Procesador (ID: 3)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (3, 11) -- Tipo de Socket
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (3, 14) -- Cantidad de Núcleos
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (3, 15) -- Consumo de Energía
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (3, 4)  -- Velocidad

-- Motherboard (ID: 4)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (4, 12) -- Chipset
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (4, 13) -- Factor de Forma
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (4, 28) -- Interfaz
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (4, 20) -- Cantidad de Puertos USB

-- Gabinete (ID: 5)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (5, 13) -- Factor de Forma
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (5, 25) -- Material de Construcción
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (5, 21) -- Iluminación RGB
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (5, 27) -- Tamaño del Ventilador

-- Fuente de Poder (ID: 6)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (6, 6)  -- Potencia
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (6, 23) -- Voltaje
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (6, 15) -- Consumo de Energía
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (6, 18) -- Tipo de Enfriamiento

-- Cooler (ID: 7)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (7, 18) -- Tipo de Enfriamiento
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (7, 19) -- Velocidad del Ventilador
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (7, 27) -- Tamaño del Ventilador
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (7, 23) -- Voltaje

-- Disco Rígido (ID: 8)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (8, 8)  -- Capacidad
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (8, 22) -- Velocidad de Transferencia
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (8, 10) -- Formato
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (8, 28) -- Interfaz

-- Disco Sólido (ID: 9)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (9, 8)  -- Capacidad
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (9, 22) -- Velocidad de Transferencia
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (9, 10) -- Formato
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (9, 28) -- Interfaz

-- Monitor (ID: 10)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (10, 7)  -- Resolución
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (10, 17) -- Tamaño de Pantalla
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (10, 26) -- Tipo de Panel
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (10, 29) -- Frecuencia de Refresco

-- Teclado (ID: 11)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (11, 21) -- Iluminación RGB
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (11, 24) -- Compatibilidad
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (11, 25) -- Material de Construcción
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (11, 5)  -- Conectividad

-- Mouse (ID: 12)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (12, 21) -- Iluminación RGB
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (12, 24) -- Compatibilidad
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (12, 25) -- Material de Construcción
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (12, 5)  -- Conectividad

-- Auriculares (ID: 13)
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (13, 21) -- Iluminación RGB
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (13, 24) -- Compatibilidad
INSERT INTO TIPOS_COMPONENTES_ESPECIFICACIONES (id_tipo_componente, id_espec) VALUES (13, 5)  -- Conectividad

--
CREATE TABLE Especificaciones_Componentes(
	id_espec_comp int IDENTITY(1,1),  --  1               | 2
	id_componente int  NOT NULL, -- (1) RAM KINGSTON | (1) RAM KINGSTON
	id_espec int  NOT NULL,  --       1 (FRECUENCIA)  | 2(TECNOLOGIA)
	valor varchar(150)  NOT NULL, -- 3200MHZ          | DDR4
	CONSTRAINT PK_ESPEC_COMP PRIMARY KEY (id_espec_comp,id_componente),
	CONSTRAINT FK_ESPEC_COMP_COMPONENTES FOREIGN KEY (id_componente)
		REFERENCES COMPONENTES (id_componente),
	CONSTRAINT FK_ESPEC_COMP_ESPECIFICACIONES FOREIGN KEY (id_espec)
		REFERENCES ESPECIFICACIONES (id_espec)
)

-- Memoria Ram Kingston Fury DDR4 8GB 3200MHZ (ID: 1)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (1, 1, '3200MHz')  -- Frecuencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (1, 2, '8GB')      -- Tamaño Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (1, 3, 'DDR4')     -- Tecnología
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (1, 9, 'CL16')     -- Latencia

-- Memoria Ram Adata DDR4 8GB 3200MHZ Premier (ID: 2)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (2, 1, '3200MHz')  -- Frecuencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (2, 2, '8GB')      -- Tamaño Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (2, 3, 'DDR4')     -- Tecnología
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (2, 9, 'CL22')     -- Latencia

-- Placa de Video ASUS Dual Radeon RX 6600 8GB GDDR6 V2 (ID: 3)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (3, 2, '8GB')      -- Tamaño Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (3, 16, 'GDDR6')   -- Tipo de Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (3, 12, 'AMD Radeon RX 6600') -- Chipset
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (3, 29, '144Hz')   -- Frecuencia de Refresco

-- Placa de Video MSI GeForce RTX 3060 12GB GDDR6 VENTUS 2X OC (ID: 4)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (4, 2, '12GB')     -- Tamaño Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (4, 16, 'GDDR6')   -- Tipo de Memoria
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (4, 12, 'NVIDIA GeForce RTX 3060') -- Chipset
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (4, 29, '170Hz')   -- Frecuencia de Refresco

-- Procesador AMD Ryzen 5 5600 4.4GHz Turbo + Wraith Stealth Cooler (ID: 5)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (5, 11, 'AM4')         -- Tipo de Socket
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (5, 14, '6 núcleos')   -- Cantidad de Núcleos
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (5, 15, '65W')         -- Consumo de Energía
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (5, 4, '4.4GHz')       -- Velocidad

-- Procesador Intel Core i3 12100F 4.3GHz Turbo Socket 1700 Alder Lake (ID: 6)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (6, 11, 'LGA 1700')    -- Tipo de Socket
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (6, 14, '4 núcleos')   -- Cantidad de Núcleos
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (6, 15, '58W')         -- Consumo de Energía
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (6, 4, '4.3GHz')       -- Velocidad

-- Mother Asrock B550M Steel Legend AM4 (ID: 7)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (7, 12, 'B550')        -- Chipset
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (7, 13, 'Micro-ATX')   -- Factor de Forma
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (7, 28, 'PCIe 4.0')    -- Interfaz
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (7, 20, '8 puertos USB') -- Cantidad de Puertos USB

-- Mother ASUS PRIME B660M-A D4 (ID: 8)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (8, 12, 'B660')        -- Chipset
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (8, 13, 'Micro-ATX')   -- Factor de Forma
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (8, 28, 'PCIe 4.0')    -- Interfaz
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (8, 20, '6 puertos USB') -- Cantidad de Puertos USB

-- Gabinete Sentey S20 RGB ATX (ID: 9)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (9, 13, 'ATX, Micro-ATX, ITX') -- Factor de Forma
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (9, 25, 'SPCC Steel, Plastic') -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (9, 21, 'RGB')            -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (9, 27, '120mm')           -- Tamaño del Ventilador

-- Gabinete Antec NX210 Mid Tower (ID: 10)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (10, 13, 'Micro-ATX, Mini-ITX') -- Factor de Forma
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (10, 25, 'Acrílico, Metal')     -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (10, 21, 'No')                 -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (10, 27, '120mm')              -- Tamaño del Ventilador

-- Fuente Cooler Master MWE 550W 80 Plus Bronze (ID: 11)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (11, 6, '550W')             -- Potencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (11, 23, '230V')            -- Voltaje
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (11, 15, '80 Plus Bronze')  -- Consumo de Energía
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (11, 18, 'Ventilador de 120mm') -- Tipo de Enfriamiento

-- Fuente Corsair CV650 650W 80 Plus Bronze (ID: 12)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (12, 6, '750W')             -- Potencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (12, 23, '230V')            -- Voltaje
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (12, 15, '80 Plus Gold')    -- Consumo de Energía
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (12, 18, 'Ventilador de 120mm') -- Tipo de Enfriamiento

-- Cooler Master Hyper 212 RGB Black Edition (ID: 13)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (13, 18, 'Aire')             -- Tipo de Enfriamiento
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (13, 19, '1600 RPM')         -- Velocidad del Ventilador
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (13, 27, '120mm')            -- Tamaño del Ventilador
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (13, 23, '12V')              -- Voltaje

-- Cooler Sentey Frost 120mm RGB (ID: 14)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (14, 18, 'Líquido')          -- Tipo de Enfriamiento
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (14, 19, '1800 RPM')         -- Velocidad del Ventilador
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (14, 27, '120mm')            -- Tamaño del Ventilador
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (14, 23, '12V')              -- Voltaje

-- Disco Rígido Adata HD710 Pro 1TB (ID: 15)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (15, 8, '1TB')              -- Capacidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (15, 22, '210MB/s')          -- Velocidad de Transferencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (15, 10, '3.5"')             -- Formato
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (15, 28, 'SATA III')         -- Interfaz

-- Disco Rígido Gigabyte H510 1TB 7200RPM (ID: 16)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (16, 8, '1TB')              -- Capacidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (16, 22, '200MB/s')          -- Velocidad de Transferencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (16, 10, '3.5"')             -- Formato
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (16, 28, 'SATA III')         -- Interfaz

-- Disco Sólido Kingston A2000 500GB NVMe M.2 (ID:17)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (17, 8, '500GB')            -- Capacidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (17, 22, '3500MB/s')         -- Velocidad de Transferencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (17, 10, 'M.2')              -- Formato
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (17, 28, 'NVMe PCIe 3.0')    -- Interfaz

--Disco Sólido Adata XPG SX8200 Pro 512GB M.2 (ID:  18)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (18, 8, '500GB')            -- Capacidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (18, 22, '8000MB/s')         -- Velocidad de Transferencia
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (18, 10, 'M.2')              -- Formato
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (18, 28, 'NVMe PCIe 4.0')    -- Interfaz

-- Monitor ASUS TUF Gaming VG27AQ 27" 165Hz (ID:  19)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (19, 7, '2560x1440')         -- Resolución
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (19, 17, '27"')              -- Tamaño de Pantalla
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (19, 26, 'VA')               -- Tipo de Panel
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (19, 29, '165Hz')            -- Frecuencia de Refresco

--  (ID: Monitor MSI Optix G241 23.8" 144Hz 20)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (20, 7, '1920x1080')         -- Resolución
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (20, 17, '24"')              -- Tamaño de Pantalla
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (20, 26, 'TN')               -- Tipo de Panel
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (20, 29, '144Hz')            -- Frecuencia de Refresco

-- Teclado Corsair K55 RGB PRO (ID: 21)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (21, 21, 'RGB')             -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (21, 24, 'Windows, macOS')  -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (21, 25, 'Plástico ABS')    -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (21, 5, 'Cable USB')        -- Conectividad

-- Teclado Sentey Lumen RGB (ID: 22)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (22, 21, 'RGB')             -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (22, 24, 'Windows')         -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (22, 25, 'Plástico ABS')    -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (22, 5, 'Cable USB')        -- Conectividad

-- Mouse Corsair Harpoon RGB Wireless (ID: 23)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (23, 21, 'RGB')             -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (23, 24, 'Windows, macOS')  -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (23, 25, 'Plástico ABS')    -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (23, 5, 'Wireless USB')        -- Conectividad

-- Mouse Sentey Phoenix RGB 12000 DPI (ID: 24)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (24, 21, 'RGB')             -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (24, 24, 'Windows')         -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (24, 25, 'Plástico ABS')    -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (24, 5, 'Cable USB')        -- Conectividad

-- Auriculares Corsair HS35 Stereo Gaming (ID: 25)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (25, 21, 'No')              -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (25, 24, 'Windows, PS4, Xbox') -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (25, 25, 'Plástico ABS, Aluminio') -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (25, 5, 'Cable Jack 3.5mm') -- Conectividad

-- Auriculares Sentey Arches RGB 7.1 Surround (ID: 26)
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (26, 21, 'RGB')             -- Iluminación RGB
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (26, 24, 'Windows, PS4')    -- Compatibilidad
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (26, 25, 'Plástico ABS, Aluminio') -- Material de Construcción
INSERT INTO Especificaciones_Componentes (id_componente, id_espec, valor) VALUES (26, 5, 'Wireless USB')     -- Conectividad


--------------------- PEDIDOS ------------------------

CREATE TABLE FORMAS_ENTREGA(
id_forma_entrega int IDENTITY(1,1),
descripcion varchar (50)  -- ENVIO A SUCURSAL | PICK UP POINT | ENVIO A DOMICILIO
constraint PK_FORMAS_ENTREGA primary key (id_forma_entrega)
) 

INSERT INTO FORMAS_ENTREGA VALUES ('ENVIO A SUCURSAL')
INSERT INTO FORMAS_ENTREGA VALUES ('PICK UP POINT')
INSERT INTO FORMAS_ENTREGA VALUES ('ENVIO A DOMICILIO')


 CREATE TABLE CATEGORIAS_FISCAL(
	id_categoria_fiscal	int identity(1,1),
	categoria_fiscal varchar(100), -- RESPONSABLE INSCRIPTO | CONSUMIDOR FINAL | MONOTRIBUTISTA
	CONSTRAINT PK_CATEGORIAS_FISCAL PRIMARY KEY (id_categoria_fiscal)
 )

 INSERT INTO CATEGORIAS_FISCAL VALUES ('RESPONSABLE INSCRIPTO')
 INSERT INTO CATEGORIAS_FISCAL VALUES ('CONSUMIDOR FINAL')
 INSERT INTO CATEGORIAS_FISCAL VALUES ('MONOTRIBUTISTA')

CREATE TABLE FORMAS_PAGO(
id_forma_pago int IDENTITY(1,1), 
forma_pago varchar (50) NOT NULL, -- EFECETIVO | TARJETA CREDITO | TARJETA DEBITO | QR | TRANSFERENCIA BANCARIA
recargo decimal(5,2) NULL,     -- NULL			|   12.3%		
descuento decimal(5,2) NULL,   -- 10%			|
CONSTRAINT Pk_FORMAS_PAGO PRIMARY KEY (id_forma_pago)
)

INSERT INTO FORMAS_PAGO (forma_pago,recargo,descuento) VALUES ('EFECETIVO',null ,10.00)
INSERT INTO FORMAS_PAGO (forma_pago,recargo,descuento) VALUES ('TARJETA CREDITO',10.00 ,null)
INSERT INTO FORMAS_PAGO (forma_pago,recargo,descuento) VALUES ('TARJETA DEBITO',5.00 ,null)
INSERT INTO FORMAS_PAGO (forma_pago,recargo,descuento) VALUES ('QR',5.00 ,null)
INSERT INTO FORMAS_PAGO (forma_pago,recargo,descuento) VALUES ('TRANSFERENCIA BANCARIA',null ,null)

CREATE TABLE PEDIDOS (
    id_pedido int IDENTITY(1,1),
    id_cliente int NOT NULL,
	id_forma_pago int not null, -- SOLO UNA FORMA DE PAGO
	id_categoria_fiscal int, -- COMO SE IDENTITFICA EL CLIENTE SEGUN UN PEDIDO ESPECIFICO
    legajo_emp int,  -- REGISTRAMOS LA PERSONA QUE PREPARA EL PEDIDO
    armado_pc bit NOT NULL,
	precio_armado_pc decimal (18,2) NULL,
	fecha_pedido datetime NOT NULL,
	id_forma_entrega int NOT NULL,
    CONSTRAINT PK_PEDIDOS PRIMARY KEY (id_pedido),
	CONSTRAINT FK_PEDIDOS_FORMAS_PAGO FOREIGN KEY (id_forma_pago)
		REFERENCES FORMAS_PAGO (id_forma_pago),
    CONSTRAINT FK_PEDIDOS_CLIENTES FOREIGN KEY (id_cliente) 
		REFERENCES CLIENTES(id_cliente),
	CONSTRAINT FK_PEDIDOS_FORMAS_ENTREGA FOREIGN KEY (id_forma_entrega)
		REFERENCES FORMAS_ENTREGA (id_forma_entrega),
    CONSTRAINT FK_PEDIDOS_CATEGORIAS_FISCAL FOREIGN KEY (id_categoria_fiscal)
		REFERENCES CATEGORIAS_FISCAL (id_categoria_fiscal),
    CONSTRAINT FK_Id_Empleado_P FOREIGN KEY (legajo_emp) 
		REFERENCES Empleados(legajo_emp),
)
--1
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega , id_forma_pago) 
			VALUES (     1      ,          2         ,       5    ,    0    ,      null          ,    '10-02-2022'        ,         3       ,1)
--2
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago) 
			VALUES (     9      ,          2         ,       6    ,    0    ,      null          ,    '22-01-2019'        ,         1       ,2)
--3
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago) 
			VALUES (     10      ,          1         ,       7    ,    0    ,      null          ,    '13-08-2023'        ,         2       ,3)
--4
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     2      ,          1         ,       5    ,    0    ,      null          ,    '12-05-2024'        ,         1       ,4)
--5
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     3      ,          1         ,       5    ,    0    ,      null          ,    '24-06-2021'        ,         2       ,5)
--6
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago) 
			VALUES (     1      ,          2         ,       6    ,    0    ,      null          ,    '02-08-2020'        ,         1      ,1)
--7
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     5      ,          3         ,       7    ,    0    ,      null          ,    '05-09-2020'        ,         2      ,2)
--8
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     4      ,          3         ,       6    ,    0    ,      null          ,    '22-10-2022'        ,         3       ,1)

--9
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     7      ,          2         ,       6    ,    1    ,      5000          ,    '27-10-2023'        ,         1      ,3)
--10
INSERT INTO PEDIDOS (id_cliente,id_categoria_fiscal ,legajo_emp,armado_pc,precio_armado_pc,   fecha_pedido,              id_forma_entrega, id_forma_pago)  
			VALUES (     7      ,          1         ,       6    ,    1    ,      8000          ,    '18-05-2024'        ,         3       ,4)


CREATE TABLE DETALLES_PEDIDOS (
    id_detalle_pedido int,
    id_pedido int NOT NULL,
	id_componente int NULL,
	descuento decimal(5,2) NULL, -- DESCUENTO POR UN PRODUCTO EN PARTICULAR SI TUVIERA UNA PROMOCION
	cantidad int NOT NULL,
    precio_unitario decimal(18,2) NOT NULL,
    CONSTRAINT PK_DETALLES_PEDIDOS PRIMARY KEY (id_detalle_pedido, id_pedido),
    CONSTRAINT FK_DETALLES_PEDIDOS_PEDIDOS FOREIGN KEY (id_pedido) 
		REFERENCES PEDIDOS(id_pedido),
	CONSTRAINT FK_DETALLES_PEDIDOS_COMPONENTES FOREIGN KEY (id_componente)
		REFERENCES COMPONENTES (id_componente)
)
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   ( 1,    1    ,       1      ,    null     ,    2    ,  20000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,				2    ,       2      ,    10.00     ,    1    ,  13800 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,     3    ,       16      ,    null     ,    1    ,  35000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,    4    ,       24      ,    null     ,    1    ,  12000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,    5    ,       3      ,    null     ,    3    ,  380000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,     6    ,       11      ,    null     ,    1    ,  55000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,     7    ,       9      ,    null     ,    1    ,  30000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   ( 1,    8    ,       5      ,    null     ,    4    ,  175000 )


INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,     9    ,       1      ,    null     ,    2    ,  22000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (2,     9    ,       3      ,    null     ,    1    ,  250000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (3,     9    ,       6      ,    null     ,    1    ,  160000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (4,     9    ,       7      ,    null     ,    1    ,  120000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (5,     9    ,       9      ,    null     ,    1    ,  35000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (6,     9    ,       11      ,    null     ,    1    ,  75000 )

INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (1,     10    ,       2      ,    5.00     ,    4    ,  25000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (2,     10    ,       4      ,    null     ,    1    ,  400000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (3,     10    ,       5      ,    null     ,    1    ,  127000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (4,    10    ,       8      ,    null     ,    1    ,  140000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (5,     10    ,       9      ,    null     ,    1    ,  35000 )
INSERT INTO DETALLES_PEDIDOS (id_detalle_pedido,id_pedido,id_componente,descuento,cantidad,precio_unitario) 
					VALUES   (6,    10    ,       12      ,    null     ,    1    ,  85000 )


---- YA NO ACEPTAMOS VARIAS FORMAS DE PAGO 
--CREATE TABLE PEDIDOS_FORMAS_PAGO(
--id_ped_for int IDENTITY(1,1),  -- 1 | 2                    | 1 
--id_Pedido int,  --                1 | 1					   | 2 
--id_forma_pago int,             -- 1(DEBITO)  | 2(EFECTIVO) | 2(EFECTIVO)
--porcentaje decimal(5,2)        -- 50%        |  50%        | 100%
--constraint Pk_PEDIDOS_FORMAS_PAGO primary key (id_ped_for),
--constraint Fk_PEDIDO_FORMAS_PAGO foreign key (id_forma_pago)
--	references FORMAS_PAGO (id_forma_pago),
--constraint Fk_Id_Pedido_P foreign key (id_Pedido)
--	references PEDIDOS (id_Pedido)
--)

--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   1     ,       1     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   2     ,       3     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   3     ,       5     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   4     ,       4     ,  90.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   4     ,       3     ,  10.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   5     ,       2     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   6     ,       5     ,  50.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   6     ,       5     ,  50.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   7     ,       2     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   8     ,       3     ,  100.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   9     ,       2     ,  30.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   9     ,       1     ,  70.00  )
--INSERT INTO PEDIDOS_FORMAS_PAGO (id_Pedido,id_forma_pago,porcentaje) 
--						VALUES  (   10     ,       4     ,  100.00  )

ALTER TABLE PEDIDOS		--no me dejó poner notnull entonces actualize el campo en todos los registros y despues me dejó
ADD estado varchar(50)			

UPDATE PEDIDOS
SET estado = 'Entregado'

ALTER TABLE PEDIDOS
ALTER COLUMN estado varchar(50) NOT NULL --lo hacemos not null para proximos inserts

ALTER TABLE PEDIDOS
ADD fechaCancelacion DATETIME  --añadimos info sobre la baja

ALTER TABLE PEDIDOS
ADD motivoCancelacion VARCHAR(100)  --mas info


ALTER TABLE Componentes
ADD estado bit

update Componentes
set estado = 1

ALTER TABLE Componentes
ALTER COLUMN estado BIT NOT NULl

ALTER TABLE CLIENTES
ADD email varchar(100)

update CLIENTES set email = 'juan.perez@gmail.com' where id_cliente = 1
update CLIENTES set email = 'ana_gomez@gmail.com' where id_cliente = 2
update CLIENTES set email = 'luis_martinez@instagram.com' where id_cliente = 3
update CLIENTES set email = 'maria_rodriguez@gmail.com' where id_cliente = 4
update CLIENTES set email = 'CarlosGarcía@gmail.com' where id_cliente = 5
update CLIENTES set email = 'laura.fernandez@instagram.com' where id_cliente = 6
update CLIENTES set email = 'jose_lopez@gmail.com' where id_cliente = 7
update CLIENTES set email = 'sofia.sanchez@gmail.com' where id_cliente = 8
update CLIENTES set email = 'MiguelCruz@gmail.com' where id_cliente = 9
update CLIENTES set email = 'paula.benitez@gmail.com' where id_cliente = 10



--TRIGGER PARA controlar y actualizar Stock-------------------------------
--CREATE TRIGGER dis_updStock
--ON DETALLES_PEDIDOS
--AFTER Insert
--AS
--BEGIN
--	IF EXISTS (SELECT 1 FROM inserted I			---Si la cantidad que se pide supera el stock disponible, revertir transaccion
--				JOIN Componentes C ON C.id_componente = I.id_componente
--				WHERE I.cantidad > C.stock
--				)
--			BEGIN
--				ROLLBACK TRANSACTION;
--				THROW 50000, 'No hay suficiente stock para la venta.', 1;
--				 RETURN;--termina el proceso
--			END

--	Update C
--	SET stock = C.stock - I.cantidad
--	FROM Componentes C 
--	JOIN inserted I ON C.id_componente = I.id_componente;

--END;