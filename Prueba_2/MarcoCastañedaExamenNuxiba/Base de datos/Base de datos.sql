GO
CREATE DATABASE	[MarcoCastañedaNuxiba]
GO

USE [MarcoCastañedaNuxiba]
GO
/****** Object:  StoredProcedure [dbo].[GetBySalario]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBySalario] 
@UserId INT
AS

SELECT
Empleado.UserId,
Empleado.Sueldo,
Usuario.Nombre + ' '+ usuario.Paterno +' '+ Usuario.Materno as Nombres

FROM Empleado
INNER JOIN Usuario
ON Usuario.UserId = Empleado.UserId

WHERE Empleado.UserId = @UserId

GO
/****** Object:  StoredProcedure [dbo].[SalarioUpdate]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalarioUpdate]

@UserId INT,
@Sueldo DECIMAL(18,2)

AS

UPDATE Empleado
SET
Sueldo = @Sueldo

WHERE UserId = @UserId
GO
/****** Object:  StoredProcedure [dbo].[SueldoUpdate]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SueldoUpdate](
@Sueldo DECIMAL(18,2),
@FechaIngreso DATE)

AS

UPDATE Empleado
SET
Sueldo = sueldo * 1.10

WHERE FechaIngreso > '2000-01-01' AND FechaIngreso < '2001-01-01'
GO
/****** Object:  StoredProcedure [dbo].[UsuarioAdd]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioAdd]

@Login VARCHAR(100),
@Nombre VARCHAR(100),
@Paterno VARCHAR(100),
@Materno VARCHAR(100),
@Sueldo DECIMAL(18,2)
AS

INSERT INTO Usuario(


Login,
Nombre,
Paterno,
Materno
)
VALUES (

@Login,
@Nombre,
@Paterno,
@Materno)

INSERT INTO Empleado(
UserId,
Sueldo,
FechaIngreso
)
VALUES(
@@IDENTITY,
@Sueldo,
GETDATE())
----------------
GO
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioDelete] 
 @UserId INT

 AS


 DELETE FROM Empleado
 WHERE 
 UserId = @UserId 

 DELETE FROM Usuario 
 WHERE 
 UserId = @UserId 

GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetAll]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetAll]

AS

SELECT TOP 10
Usuario.UserId,
Usuario.Login,
Usuario.Nombre,
Usuario.Paterno,
Usuario.Materno,
Empleado.Sueldo,
Empleado.FechaIngreso
From Usuario


	INNER JOIN Empleado
	ON Empleado.UserId = Usuario.UserId

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 20/07/2022 01:20:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[UserId] [int] NOT NULL,
	[Sueldo] [decimal](18, 2) NULL,
	[FechaIngreso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 20/07/2022 01:20:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[Paterno] [varchar](100) NULL,
	[Materno] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (4, CAST(15000.00 AS Decimal(18, 2)), CAST(0x11240B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (5, CAST(7812.00 AS Decimal(18, 2)), CAST(0x18240B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (6, CAST(7812.00 AS Decimal(18, 2)), CAST(0x18240B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (9, CAST(13800.00 AS Decimal(18, 2)), CAST(0x00260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (14, CAST(8000.00 AS Decimal(18, 2)), CAST(0x36260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (15, CAST(6000.00 AS Decimal(18, 2)), CAST(0x36260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (16, CAST(19470.00 AS Decimal(18, 2)), CAST(0x36260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (17, CAST(19470.00 AS Decimal(18, 2)), CAST(0x36260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (18, CAST(10200.00 AS Decimal(18, 2)), CAST(0x39260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (19, CAST(10200.00 AS Decimal(18, 2)), CAST(0x39260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (20, CAST(25000.00 AS Decimal(18, 2)), CAST(0x39260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (21, CAST(7812.00 AS Decimal(18, 2)), CAST(0x39260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (22, CAST(7812.00 AS Decimal(18, 2)), CAST(0x39260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (23, CAST(12210.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (24, CAST(12210.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (25, CAST(7500.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (26, CAST(15020.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (27, CAST(15020.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (28, CAST(25000.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (29, CAST(7812.00 AS Decimal(18, 2)), CAST(0xBC260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (30, CAST(15020.00 AS Decimal(18, 2)), CAST(0xCE260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (31, CAST(15020.00 AS Decimal(18, 2)), CAST(0xCE260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (32, CAST(12210.00 AS Decimal(18, 2)), CAST(0xCE260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (33, CAST(12210.00 AS Decimal(18, 2)), CAST(0xCE260B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (34, CAST(19470.00 AS Decimal(18, 2)), CAST(0x56300B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (35, CAST(19470.00 AS Decimal(18, 2)), CAST(0x56300B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (36, CAST(8000.00 AS Decimal(18, 2)), CAST(0x56300B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (37, CAST(8000.00 AS Decimal(18, 2)), CAST(0x56300B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (38, CAST(18880.00 AS Decimal(18, 2)), CAST(0x80310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (39, CAST(18880.00 AS Decimal(18, 2)), CAST(0x80310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (40, CAST(14000.00 AS Decimal(18, 2)), CAST(0x80310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (41, CAST(13800.00 AS Decimal(18, 2)), CAST(0x80310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (42, CAST(13800.00 AS Decimal(18, 2)), CAST(0x80310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (43, CAST(15000.00 AS Decimal(18, 2)), CAST(0xF5310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (44, CAST(15000.00 AS Decimal(18, 2)), CAST(0xF5310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (45, CAST(13000.00 AS Decimal(18, 2)), CAST(0xF5310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (46, CAST(8837.00 AS Decimal(18, 2)), CAST(0xF5310B00 AS Date))
INSERT [dbo].[Empleado] ([UserId], [Sueldo], [FechaIngreso]) VALUES (50, CAST(3400.00 AS Decimal(18, 2)), CAST(0x32440B00 AS Date))
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (4, N'user04', N'DIEGO ISMAEL', N'BERUMEN', N'CEDILLO')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (5, N'user05', N'AURORA', N'ESCALANTE', N'PALAFOX')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (6, N'user06', N'JOYCELENE FABIOLA', N'ESTRADA', N'BARBA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (8, N'user08', N'LEONARDO DANIEL', N'FARIAS', N'ROSAS')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (9, N'user09', N'RAMON ANDRES', N'FIERROS', N'ROBLES')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (11, N'user11', N'MARIA FERNANDA', N'FRANCO', N'ESQUIVEL')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (14, N'user14', N'JOSAFAT GERARDO', N'HERNANDEZ', N'SAUCEDO')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (15, N'user15', N'ROSALIA', N'JIMENEZ', N'GONZALEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (16, N'user16', N'LAURA CELENE', N'JIMENEZ', N'RIOS')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (17, N'user17', N'ANGELICA', N'LOPEZ', N'CORTES')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (18, N'user18', N'CRISTIAN IVAN', N'LOPEZ', N'GOMEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (19, N'user19', N'MARLENE GABRIELA', N'LOPEZ', N'MEZA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (20, N'user20', N'ALEJANDRA', N'MEDINA', N'IBARRA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (21, N'user21', N'CONSUELO YURIDIANA THALIA', N'MEJIA', N'ALVAREZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (22, N'user22', N'JAVIER ADRIAN', N'MEJIA', N'ALVAREZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (23, N'user23', N'JUAN CARLOS EVARISTO', N'PEÑA', N'GUTIERREZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (24, N'user24', N'JAZMIN ALEJANDRA', N'PEREZ', N'VELEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (25, N'user25', N'GUSTAVO', N'RAMIREZ', N'RIVERA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (26, N'user26', N'CARLOS NIVARDO', N'RODRIGUEZ', N'ASCENCIO')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (27, N'user27', N'KARLA JOHANA', N'ROMERO', N'LUEVANOS')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (28, N'user28', N'YESSICA YOSELINNE', N'RUIZ', N'HERNANDEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (29, N'user29', N'CHRISTIAN EDUARDO', N'SALAS', N'SANCHEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (30, N'user30', N'LUIS ROBERTO', N'SALDAÑA', N'ESPINOZA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (31, N'user31', N'ADRIAN', N'SANCHEZ', N'ORTIZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (32, N'user32', N'EDUARDO YAIR', N'SUAREZ', N'HERNANDEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (33, N'user33', N'JUAN FRANCISCO', N'TABAREZ', N'GARCIA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (34, N'user34', N'ZULEICA ELIZABETH', N'TERAN', N'TORRES')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (35, N'user35', N'ADRIANA YUNUHEN', N'VARGAS', N'AYALA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (36, N'user36', N'OSCAR URIEL', N'VELAZQUEZ', N'ALVAREZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (37, N'user37', N'ERICK DE JESUS', N'CORONA', N'DIAZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (38, N'user38', N'MARIA GUADALUPE', N'RAMOS', N'HERNANDEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (39, N'user39', N'JESSICA NOEMI', N'JIMENEZ', N'VENTURA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (40, N'user40', N'FLOR MARGARITA', N'ROJAS', N'HERNANDEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (41, N'user41', N'LUIS ANTONIO', N'ALVARADO', N'VALENCIA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (42, N'user42', N'EDGAR IVAN', N'AGUILAR', N'PADILLA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (43, N'user43', N'LUIS ALFONSO', N'MICHEL', N'SANCHEZ')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (44, N'user44', N'JOSE CARLOS', N'SILVA', N'ROCHA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (45, N'user45', N'JUDITH', N'RODRIGUEZ', N'REYES')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (46, N'user46', N'BRENDA SORAYA', N'CHAVEZ', N'GARCIA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (47, N'user47', N'ALMA ROSA', N'MARQUEZ', N'AGUILA')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (48, N'q', N'q', N'q', N'q')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (49, N'UserPrueba', N'Prueba', N'prueba', N'preuba')
INSERT [dbo].[Usuario] ([UserId], [Login], [Nombre], [Paterno], [Materno]) VALUES (50, N'user200', N'Leonardo', N'Escogido', N'Bravo')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuario] ([UserId])
GO
