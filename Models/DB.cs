using System.Data.SqlClient;
using Dapper;

public class DB
{
    //private static string _connectionString = @"Server=localhost; DataBase=TP7; Trusted_Connection=true";
    private static string _connectionString =  @"Server=BANGHODEMATEO\SQLEXPRESS;DataBase=TP7;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        List<Categoria> _ListaCategorias = new List<Categoria>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            _ListaCategorias = db.Query<Categoria>(sql).ToList();
        }
        return _ListaCategorias;
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        List<Dificultad> _ListaDificultades = new List<Dificultad>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            _ListaDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return _ListaDificultades;
    }
    
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Pregunta> _ListaPreguntas = new List<Pregunta>();
        string sql;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {  if(dificultad == -1 && categoria != -1)
                sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pcategoria";
            else if(dificultad != -1 && categoria == -1)
                sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pdificultad";
            else if(dificultad == -1 && categoria == -1)
                sql = "SELECT * FROM Preguntas";
            else
                sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pcategoria AND IdDificultad = @pdificultad";
                _ListaPreguntas = db.Query<Pregunta>(sql, new {pcategoria = categoria, pdificultad = dificultad}).ToList();
        }
        return _ListaPreguntas;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        List<Respuesta> _ListaRespuestasGral = new List<Respuesta>(),  _ListaRespuestasXPreg = new List<Respuesta>();
        string sql;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            for (int i = 0; i < preguntas.Count; i++)
            {
                sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pr";
                _ListaRespuestasXPreg = db.Query<Respuesta>(sql, new {pr = preguntas[i].IdPregunta}).ToList();
                _ListaRespuestasGral.AddRange(_ListaRespuestasXPreg);
            }
        }
        return _ListaRespuestasGral;
    }
    public static List<Respuesta> ObtenerRtasXPreg(int idPregunta)
    {
        List<Respuesta> _ListaRespuestasXPreg = new List<Respuesta>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {           
            string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pId";
            _ListaRespuestasXPreg = db.Query<Respuesta>(sql, new {pId = idPregunta}).ToList();
        }
        return _ListaRespuestasXPreg;
    }
    public static List<Puntajes> ObtenerPuntajes()
    {
        List<Puntajes> _ListaPuntajes = new List<Puntajes>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {           
            string sql = "SELECT * FROM Puntajes ORDER BY Puntaje ASC";
            _ListaPuntajes = db.Query<Puntajes>(sql).ToList();
        }
        return _ListaPuntajes;
    }
    /*public static void InsertarPuntajes(string username, int puntaje, DateTime fechahora)
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {           
            string sql = "INSERT INTO Puntajes (Username, Puntaje, FechaHora) VALUES (@pUsername, @pPuntaes, @pFechaHora)";
            db.Query<Respuesta>(sql, new {pUsername = username, pPuntaje = puntaje, pFechaHora = fechahora});
        }
    }
    */
}
