USE [master]
GO
/****** Object:  Database [TP7]    Script Date: 28/8/2024 08:54:50 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 28/8/2024 08:54:50 ******/
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
/****** Object:  Table [dbo].[Dificultades]    Script Date: 28/8/2024 08:54:50 ******/
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
/****** Object:  Table [dbo].[Preguntas]    Script Date: 28/8/2024 08:54:50 ******/
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
/****** Object:  Table [dbo].[Respuestas]    Script Date: 28/8/2024 08:54:50 ******/
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
/****** Object:  Table [dbo].[Puntajes]    Script Date: 28/8/2024 08:54:50 ******/
CREATE TABLE [dbo].[Puntajes](
    [IdPuntaje] [int] IDENTITY(1,1) NOT NULL,
    [Puntaje] [int] NOT NULL,
    [FechaHora] [datetime] DEFAULT GETDATE() NOT NULL,
 CONSTRAINT [PK__Puntajes__C26C6E36C5F4B6C2] PRIMARY KEY CLUSTERED
(
    [IdPuntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Deportes', 'https://static.wikia.nocookie.net/preguntados-juego/images/a/a3/Deportes.png/revision/latest?cb=20171009155146&path-prefix=es')
INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Historia', 'https://static.wikia.nocookie.net/preguntados-juego/images/3/3f/Historia.png/revision/latest?cb=20171009212341&path-prefix=es')
INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Roman', 'https://i.pinimg.com/originals/0f/9b/51/0f9b51fb1f193b51fe8dc0c9d0202aca.png')
INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Ciencia', 'https://static.wikia.nocookie.net/preguntados-juego/images/3/30/Ciencia.png/revision/latest?cb=20171009212518&path-prefix=es')
INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Geografia', 'https://static.wikia.nocookie.net/preguntados-juego/images/f/f7/Geograf%C3%ADa.png/revision/latest/smart/width/250/height/250?cb=20171009211549&path-prefix=es')
INSERT [dbo].[Categorias] ([Nombre], [Foto]) VALUES ('Cine', 'https://static.wikia.nocookie.net/preguntados-juego/images/e/e0/Entretenimiento.png/revision/latest?cb=20171009154517&path-prefix=es')
GO




INSERT [dbo].[Dificultades] ([Nombre]) VALUES ('Facilardo')
INSERT [dbo].[Dificultades] ([Nombre]) VALUES ('Maso')
INSERT [dbo].[Dificultades] ([Nombre]) VALUES ('Picantovich')
GO




INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (1, 1, '¿Cuál es el deporte más popular del mundo?', 'https://fundaciondelcorazon.com/images/stories/iStock-949190756.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (1, 2, '¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkaDlMWwPGxl7H9TjA-FAObvH1xFPBcCbMsg&s');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (1, 3, '¿Quién ostenta el récord de más goles marcados en una Copa Mundial de la FIFA?', 'https://cdn.aarp.net/content/dam/aarp/entertainment/television/2017/07/1140-world-cup-trophy-ball-trivia-esp.jpg');








INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (2, 1, '¿Quién fue el primer presidente de los Estados Unidos?', 'https://colombianabroad.com/wp-content/uploads/usa-bandera.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (2, 2, '¿En qué año cayó el Muro de Berlín?', 'https://elblogdeviajes.com/wp-content/uploads/2016/11/berlin-muro-2.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (2, 3, '¿Cuál fue la primera civilización en utilizar la escritura cuneiforme?', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEBAH0Lnh9IIzRmhdoorFj8fuyYMOLehmNTg&s');








INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (3, 1, '¿Con qué equipo ganó Román la Copa Libertadores en 2000?', 'https://assets.goal.com/images/v3/blt62e1adad28be9bc1/e94396d9418d26fae8b99749cabc762b3ca759da.jpg?auto=webp&format=pjpg&width=3840&quality=60');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (3, 2, '¿Cuántos títulos ganó Román con Boca Juniors?', 'https://media.c5n.com/p/6ea0c18fa5a2b86c6ae9c98db2d6bb02/adjuntos/326/imagenes/000/285/0000285423/790x0/smart/juan-roman-riquelme.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (3, 3, '¿En qué año fue nombrado Román como el mejor jugador de la Copa Libertadores?',' https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS--exD4LgsjQxcOtI4ildDzBCtE0i-oK1MRg&s');








INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (4, 1, '¿Cuál es el planeta más cercano al Sol?', 'https://i.blogs.es/f76e51/planetas-alineados/500_333.jpeg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (4, 2, '¿Cuál es la ley que describe la gravitación universal?', 'https://alianza.bunam.unam.mx/wp-content/uploads/2023/12/fc8ac4ad-1bad-4bd7-8b14-2108bd5e66b3.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (4, 3, '¿Quién formuló el Principio de Incertidumbre?', 'https://content.nationalgeographic.com.es/medio/2024/03/13/werner-heisenberg_829dc950_240313101129_1280x720.jpg');




INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (5, 1, '¿Cuál es el río más largo del mundo?', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKSuQV0nbljvuDtlG3hdeP-CB2qDjPOB8Iaw&s');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (5, 2, '¿En qué país se encuentra el monte Everest?', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV_UTY2zIsPYo0DMlTdUVvFyP7sF4jLiKhXQ&s');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (5, 3, '¿Cuál es el país más pequeño del mundo por área?', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXJsiw-EZvZRMEquNxxzm0dfyDMwyX95u1TA&s');








INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (6, 1, '¿Quién dirigió la película "Titanic"?', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/RMS_Titanic_3.jpg/800px-RMS_Titanic_3.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (6, 2, '¿Qué película ganó el Oscar a Mejor Película en 2020?', 'https://media.vogue.es/photos/5ee7e8c1f25f467f55fe7bac/2:3/w_2560%2Cc_limit/GettyImages-97052925.jpg');
INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto)
VALUES (6, 3, '¿Quién fue el primer director en ganar tres premios Oscar a Mejor Director?', 'https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2018/03/02/15199786814131.jpg');


GO


-- Pregunta 1
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (1, 1, 'Fútbol', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (1, 2, 'Baloncesto', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (1, 3, 'Tenis', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (1, 4, 'Béisbol', 0, NULL);


-- Pregunta 2
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (2, 1, '1900', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (2, 2, '1896', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (2, 3, '1912', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (2, 4, '1924', 0, NULL);


-- Pregunta 3
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (3, 1, 'Pelé', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (3, 2, 'Miroslav Klose', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (3, 3, 'Diego Maradona', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (3, 4, 'Cristiano Ronaldo', 0, NULL);


-- Pregunta 4
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (4, 1, 'Abraham Lincoln', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (4, 2, 'George Washington', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (4, 3, 'Thomas Jefferson', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (4, 4, 'John Adams', 0, NULL);


-- Pregunta 5
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (5, 1, '1989', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (5, 2, '1975', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (5, 3, '1961', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (5, 4, '1990', 0, NULL);


-- Pregunta 6
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (6, 1, 'Imperio Romano', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (6, 2, 'Egipto', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (6, 3, 'Sumerios', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (6, 4, 'China', 0, NULL);


-- Pregunta 7
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (7, 1, 'Boca Juniors', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (7, 2, 'River Plate', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (7, 3, 'Real Madrid', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (7, 4, 'Barcelona', 0, NULL);


-- Pregunta 8
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (8, 1, '6', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (8, 2, '8', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (8, 3, '4', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (8, 4, '10', 0, NULL);


-- Pregunta 9
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (9, 1, '2004', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (9, 2, '2001', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (9, 3, '1998', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (9, 4, '2007', 0, NULL);


-- Pregunta 10
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (10, 1, 'Mercurio', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (10, 2, 'Venus', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (10, 3, 'Tierra', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (10, 4, 'Marte', 0, NULL);


-- Pregunta 11
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (11, 1, 'Ley de la Gravitación Universal', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (11, 2, 'Ley de la Relatividad', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (11, 3, 'Ley de la Termodinámica', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (11, 4, 'Ley de Newton', 0, NULL);


-- Pregunta 12
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (12, 1, 'Albert Einstein', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (12, 2, 'Niels Bohr', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (12, 3, 'Werner Heisenberg', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (12, 4, 'Max Planck', 0, NULL);


-- Pregunta 13
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (13, 1, 'Amazonas', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (13, 2, 'Paraná', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (13, 3, 'Misisipi ', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (13, 4, 'Nilo', 1, NULL);


-- Pregunta 14
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (14, 1, 'Bután', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (14, 2, 'China', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (14, 3, 'Nepal', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (14, 4, 'India', 0, NULL);


-- Pregunta 15
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (15, 1, 'Mónaco', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (15, 2, 'San Marino', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (15, 3, 'Ciudad del vaticano', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (15, 4, 'Andorra', 0, NULL);


-- Pregunta 16
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (16, 1, 'James Cameron', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (16, 2, 'Steven Spielberg', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (16, 3, 'Martin Scorsese', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (16, 4, 'George Lucas', 0, NULL);


-- Pregunta 17
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (17, 1, '1917', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (17, 2, 'Joker', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (17, 3, 'Parasite', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (17, 4, 'Once Upon A Time in Hollywood', 0, NULL);


-- Pregunta 18
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (18, 1, 'Steven Spielberg', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (18, 2, 'Jhon Ford', 1, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (18, 3, 'Frank Capra', 0, NULL);
INSERT INTO [dbo].[Respuestas] (IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES (18, 4, 'Martin Scorsese', 0, NULL);


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





