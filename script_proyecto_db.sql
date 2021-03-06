USE [master]
GO
/****** Object:  Database [empresa]    Script Date: 05/01/2022 19:55:31 ******/
CREATE DATABASE [empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\empresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\empresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [empresa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empresa] SET RECOVERY FULL 
GO
ALTER DATABASE [empresa] SET  MULTI_USER 
GO
ALTER DATABASE [empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [empresa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'empresa', N'ON'
GO
ALTER DATABASE [empresa] SET QUERY_STORE = OFF
GO
USE [empresa]
GO
/****** Object:  User [empresa]    Script Date: 05/01/2022 19:55:32 ******/
CREATE USER [empresa] FOR LOGIN [empresa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [empresa]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[codigo_departamento] [int] NOT NULL,
	[nombre_depto] [varchar](75) NULL,
	[presupuesto] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[dpi] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellidos] [varchar](125) NULL,
	[cod_depto] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dpi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (1, N'Gerencia', CAST(55000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (2, N'Administración y Finanzas', CAST(118000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (3, N'Contabilidad', CAST(63550 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (4, N'RRHH', CAST(45000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (5, N'Proyectos', CAST(1305000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (6, N'Comercial', CAST(354647 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (7, N'Mercadeo', CAST(556000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (8, N'Produccion', CAST(13500300 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (9, N'Logistica', CAST(5905400 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (10, N'Bodega', CAST(2566500 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (11, N'Control de Calidad', CAST(40000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (12, N'Inteligencia', CAST(65000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (14, N'Informática', CAST(157000 AS Decimal(18, 0)))
INSERT [dbo].[departamento] ([codigo_departamento], [nombre_depto], [presupuesto]) VALUES (77, N'Investigacion', CAST(157000 AS Decimal(18, 0)))
GO
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (10569, N'BELGICA ANABELLA', N'DERAS ROMAN', 77)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (10755, N'EVER LIBERATO', N'MARTINEZ BARRIOS', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (10882, N'DELHI YOHANA', N'OROZCO JUAREZ', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (11267, N'FABIAN HERIBERTO', N'MOLINA SOSA', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (11518, N'DELCY NOHEMI', N'SALGUERO ESQUIVEL', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (11583, N'GUSTAVO ADOLFO', N'TABIN GRAMAJO', 12)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (11725, N'WILFIDO', N'PANTALEON PACHECO', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (12360, N'FABIAN ALBERTO', N'RAMOS BARAHONA', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (12816, N'OCTAVIO SEGUNDO', N'CHEGUEN GONZALEZ', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (12871, N'HENRY ESTEBAN', N'SOSOF RAMIREZ', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13071, N'DAVID YURAMBIR', N'RIVERA ALVARADO', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13176, N'FABIAN', N'DE LEON PEREZ', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13332, N'DAVID OSWALDO', N'QUIYUCH TOCAY', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13365, N'WENDY LISBETH', N'MARROQUIN CASTILLO', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13382, N'BELBETH YESENIA', N'HERNANDEZ GONZALEZ', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13621, N'ADELIO', N'PEREZ Y PEREZ', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (13729, N'ZULY MAYTE', N'SANDOVAL SANDOVAL', 77)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (14055, N'FRANCISCO RAUL', N'ALVARADO CHAVEZ', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (14693, N'GARY ALEXANDER', N'CONTRERAS NAJERA', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15112, N'TERESA DE JESUS', N'VASQUEZ VILLATORO', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15251, N'ADELFA VERONICA', N'PEREZ LOPEZ', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15277, N'DAYRIN LIZMENIA', N'TEO SALGUERO', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15628, N'EZVIN OSWALDO', N'GUERRA GALVEZ', 12)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15752, N'ADELSO', N'ZUÑIGA REGALADO', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (15802, N'ROSA ODILIA', N'NAVASSI DIAZ', 77)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16052, N'DAYRIN ROCIO', N'MEJIA', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16177, N'WILFREDO', N'ALDANA ARCHILA', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16194, N'DEGLY LEONEL', N'RODERICOMORALES NOGUERA', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16199, N'DEBORA GREACE', N'AVILA CHACON', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16407, N'SANDRA LISSETTE', N'MORALES RAMIREZ', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16423, N'FREDY ESTUARDO', N'OGALDEZ FERNANDEZ', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16967, N'AARON ISAAC', N'PAR GUITZ', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (16970, N'KARLA OLIVIA', N'IXMUCANEALVA ARROYO', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (17193, N'KARLA MARIELA', N'DE LEON LOPEZ', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (17449, N'BELSY YUCELA', N'SOLANO CRUZ', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (17606, N'FRANZ ROBERTO', N'POLANCO MEJIA', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (17668, N'LIDIA ENCARNACION', N'COY MACZ', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (18005, N'INGRID YESENIA', N'LOPEZ GALVEZ', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (18228, N'ADELY NATYNELLY', N'MARGOTTIUL CU', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (18302, N'FABIOLA CORINA', N'MANZANERO GARCIA', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (18303, N'HENRY ERNESTO', N'RODRIGUEZ VILLALTA', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (18600, N'BELICA ANABELA', N'MIRANDA MONZON', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19107, N'CARMEN LUCIA', N'ACU RECINOS', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19261, N'YESIKA MANUELA', N'MACARIO TAQUIEJ', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19291, N'DEBORA MISHELL', N'CIFUENTES ESCOBAR', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19484, N'INGRID YESENIA', N'CHAVARRIA MORAN', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19855, N'GREYS MARIANA', N'PINTO', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (19969, N'EZZIO GIANCARLO', N'GUILLEN AYAU', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20112, N'EDGAR ROLANDO', N'ORTIZ GONZALEZ', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20252, N'DEBORA CELESTE', N'CHAN GUERRA', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20275, N'ZULY GABRIELA', N'ALVARADO BARRIOS', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20391, N'DEBORA GUISELA', N'MEJICANOS', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20418, N'DEBORA RAQUEL', N'JUAREZ FUENTES', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20523, N'DAVID LIONEL', N'PIVARAL ALBUREZ', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20561, N'BELSY LORENA', N'DE LEON GODINEZ', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20627, N'FRANCISCO RAYMUNDO', N'UJPAN VASQUEZ', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20784, N'DAVID JOSUE', N'LOPHES GUZMAN', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20930, N'EDGAR ROLANDO', N'LOPEZ TOJES', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20940, N'CARMEN LUCIA', N'NAJARRO RUANO', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (20963, N'GABRIELA SOFIA', N'PORTILLO LOPEZ', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21112, N'DEBRAH ESTHER', N'LOBOS TOLEDO', 12)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21163, N'BELLANIRA DANALY', N'MEDRANO MORALES', 12)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21454, N'LIDIA ELIZABETH', N'SOLARES', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21707, N'DEBORAH VIOLETA', N'SIERRA LOPEZ', 77)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21712, N'GILMAR ALEXANDER', N'CUC GUERRERO', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21731, N'ZULMY RAQUEL', N'GARCIA CISNEROS', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (21957, N'DELBERT URIEL', N'DOMINGUEZ MARTINEZ', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22011, N'BEIMER DANILO', N'PEREZ BAUTISTA', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22073, N'DEBBIE DEL CARMEN', N'SOLOMAN ORTIZ', 1)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22183, N'FRED ERICK', N'RENEGARCIA GARCIA', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22263, N'TERESA DE JESUS', N'GONZALEZ TELON', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22595, N'EVER MANOLO', N'MORALES LOPEZ', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22661, N'DEBRACK INDIRA', N'LOYO BRAN', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (22891, N'DAVID MOISES', N'ELIAS AGUILAR', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (23204, N'ROSALICIA', N'GUZMAN ALDANA', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (23517, N'GARDENIA ENEDINA', N'MAZA CASTELLANOS', 4)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (23647, N'DEBORA RENEE', N'RODRIGUEZ RECINOS', 2)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24270, N'JUAN CARLOS', N'AMARRA ROBLES', 9)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24367, N'BELSY KORINA', N'ALVARADO HERNANDEZ', 5)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24434, N'DAVID RIGOBERTO', N'VILLEDA SANCHEZ', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24517, N'CARMEN MARIA', N'AREVALO HERNANDEZ', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24546, N'DEICY MARILIS', N'PINEDA REVOLORIO', 8)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24618, N'FABIAN ALFONSO', N'GARCIA ALVARADO', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24815, N'DAVID URBANO', N'PIVARAL GONZALEZ', 6)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (24823, N'DELFINA JEANNETTE', N'GARCIA MORALES', 10)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (25551, N'DEISY VANESSA', N'FRANCO CERNA', 3)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (25659, N'SANDRA IVONNE', N'MARTINEZ AGUILAR', 12)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (25757, N'BECERA SUZZETH', N'OVALLE ROLDAN', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (26053, N'DEBORA MARIE', N'ESTHERPALACIOS VALDEZ', 7)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (159159, N'Luis Fernando', N'Toledo', 14)
INSERT [dbo].[empleado] ([dpi], [nombre], [apellidos], [cod_depto]) VALUES (28948238, N'Esther', N'Vásquez', 11)
GO
ALTER TABLE [dbo].[empleado]  WITH CHECK ADD FOREIGN KEY([cod_depto])
REFERENCES [dbo].[departamento] ([codigo_departamento])
GO
/****** Object:  StoredProcedure [dbo].[consulta_dato_empleado]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[consulta_dato_empleado]
AS
BEGIN
SELECT [dpi]
,[nombre]
,[apellidos]
,a.[cod_depto]
,nombre_depto
FROM [empresa].[dbo].[empleado] as a inner join departamento as b on a.cod_depto=b.codigo_departamento 
order by cod_depto asc
END
GO
/****** Object:  StoredProcedure [dbo].[elimina_empleado]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[elimina_empleado]
  @dpi varchar(50)
  AS
  set @dpi=@dpi
  BEGIN
  Delete from empleado where dpi=@dpi
  END
GO
/****** Object:  StoredProcedure [dbo].[insert_empleado]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[insert_empleado]
  @dpi varchar(50),
  @nombre varchar(150),
  @apellidos varchar(150),
  @cod_depto varchar(150)
  AS
  set @dpi=@dpi
  set @nombre=@nombre
  set @apellidos=@apellidos
  set @cod_depto=@cod_depto
  BEGIN
  insert into empleado (dpi, nombre, apellidos, cod_depto) values (@dpi,upper(@nombre),upper(@apellidos),@cod_depto)
  END
GO
/****** Object:  StoredProcedure [dbo].[update_empleado]    Script Date: 05/01/2022 19:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[update_empleado]
  @dpi varchar(50),
  @nombre varchar(150),
  @apellidos varchar(150),
  @cod_depto varchar(150)
  AS
  set @dpi=@dpi
  set @nombre=@nombre
  set @apellidos=@apellidos
  set @cod_depto=@cod_depto
  BEGIN
  update empleado set nombre=@nombre, apellidos=@apellidos, cod_depto=@cod_depto where dpi=@dpi
  END
GO
USE [master]
GO
ALTER DATABASE [empresa] SET  READ_WRITE 
GO
