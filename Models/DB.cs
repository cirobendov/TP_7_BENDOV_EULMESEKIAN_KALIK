using System.Data.SqlClient;
using Dapper;

public class DB
{
    private static string _connectionString = @"Server=localhost; DataBase=TriviaGame; Trusted_Connection=true";
    public static List<Categoría> ObtenerCategorias()
    {
        List<Categoría> _ListaCategorias = new List<Categoría>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            _ListaCategorias = db.Query<Categoría>(sql).ToList();
        }
        return _ListaCategorias;
    }

    public static List<Dificulad> ObtenerDificultades()
    {
        List<Dificulad> _ListaDificultades = new List<Dificulad>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            _ListaDificultades = db.Query<Dificulad>(sql).ToList();
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
                sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pdificultad ";
            else if(dificultad == -1 && categoria == -1)
                sql = "SELECT * FROM Preguntas";
            else
                sql = "SELECT * FROM Preguntas WHERE IdCategoria = @pcategoria AND IdDificultad = @pdificultad ";
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
}
