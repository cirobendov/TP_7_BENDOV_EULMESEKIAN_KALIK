USE [master]
GO
/****** Object:  Database [TP7]    Script Date: 28/8/2024 09:03:01 ******/
CREATE DATABASE [TP7]
 CONTAINMENT = NONE
GO
ALTER DATABASE [TP7] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP7] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP7] SET RECOVERY FULL 
GO
ALTER DATABASE [TP7] SET  MULTI_USER 
GO
ALTER DATABASE [TP7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP7] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TP7', N'ON'
GO
ALTER DATABASE [TP7] SET QUERY_STORE = OFF
GO
USE [TP7]
GO
/****** Object:  User [alumno]    Script Date: 28/8/2024 09:03:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 28/8/2024 09:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Foto] [varchar](255) NULL,
 CONSTRAINT [PK__Categori__A3C02A107568BF68] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 28/8/2024 09:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Dificult__EAAC331533FDF374] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 28/8/2024 09:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdDificultad] [int] NULL,
	[Enunciado] [varchar](255) NOT NULL,
	[Foto] [varchar](255) NULL,
 CONSTRAINT [PK__Pregunta__754EC09E2609F748] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 28/8/2024 09:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](255) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](255) NULL,
 CONSTRAINT [PK__Respuest__D348019879814442] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deportes', N'https://static.wikia.nocookie.net/preguntados-juego/images/a/a3/Deportes.png/revision/latest?cb=20171009155146&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', N'https://static.wikia.nocookie.net/preguntados-juego/images/3/3f/Historia.png/revision/latest?cb=20171009212341&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Roman', N'https://i.pinimg.com/originals/0f/9b/51/0f9b51fb1f193b51fe8dc0c9d0202aca.png')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Ciencia', N'https://static.wikia.nocookie.net/preguntados-juego/images/3/30/Ciencia.png/revision/latest?cb=20171009212518&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'Geografia', N'https://static.wikia.nocookie.net/preguntados-juego/images/f/f7/Geograf%C3%ADa.png/revision/latest/smart/width/250/height/250?cb=20171009211549&path-prefix=es')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (6, N'CIne', N'https://static.wikia.nocookie.net/preguntados-juego/images/e/e0/Entretenimiento.png/revision/latest?cb=20171009154517&path-prefix=es')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facilardo')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Maso')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Picantovich')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Cuál es el deporte más popular del mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 1, 3, N'¿Quién ostenta el récord de más goles marcados en una Copa Mundial de la FIFA?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 2, 1, N'¿Quién fue el primer presidente de los Estados Unidos?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 2, 2, N'¿En qué año cayó el Muro de Berlín?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 2, 3, N'¿Cuál fue la primera civilización en utilizar la escritura cuneiforme?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 3, 1, N'¿Con qué equipo ganó Román la Copa Libertadores en 2000?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 3, 2, N'¿Cuántos títulos ganó Román con Boca Juniors?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 3, 3, N'¿En qué año fue nombrado Román como el mejor jugador de la Copa Libertadores?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 4, 1, N'¿Cuál es el planeta más cercano al Sol?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 4, 2, N'¿Cuál es la ley que describe la gravitación universal?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 4, 3, N'¿Quién formuló el Principio de Incertidumbre?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 5, 1, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 5, 2, N'¿En qué país se encuentra el monte Everest?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 5, 3, N'¿Cuál es el país más pequeño del mundo por área?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 6, 1, N'¿Quién dirigió la película "Titanic"?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 6, 2, N'¿Qué película ganó el Oscar a Mejor Película en 2020?', NULL)
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 6, 3, N'¿Quién fue el primer director en ganar tres premios Oscar a Mejor Director?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK__Preguntas__IdCat__3A81B327] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK__Preguntas__IdCat__3A81B327]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK__Preguntas__IdDif__3B75D760] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK__Preguntas__IdDif__3B75D760]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK__Respuesta__IdPre__3E52440B] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK__Respuesta__IdPre__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [TP7] SET  READ_WRITE 
GO
