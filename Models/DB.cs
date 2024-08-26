using System.Data.SqlClient;
using Dapper;

public class DB
{
    public static ObtenerCategorias()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            _ListaCategorias = db.Query<Categoría>(sql).ToList();
        }
    }

    public static ObtenerDificultades()
    {

    }
    

    public static ObtenerRespuestas(List preguntas)
    {

    }
}
