public class Juego
{
    private static string? username{get; set;}
    private static int puntajeActual{get; set;}
    private static int cantidadPreguntasCorrectas{get; set;}
    private static List<Pregunta>? preguntas{get; set;}
    private static List<Respuesta>? respuestas{get; set;}

    public void InicializarJuego()
    {
        username = string.Empty;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public List<Categoría> ObtenerCategorias()
    {
        return DB.ObtenerCategorias();
    }
    public List<Dificulad> ObtenerDificultades()
    {
        return DB.ObtenerDificultades();
    }
    public void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = DB.ObtenerPreguntas(dificultad, categoria);
        respuestas = DB.ObtenerRespuestas(preguntas);
    }
    public Pregunta ObtenerProximaPregunta()
    {   
        Random rd = new Random();
        int pos = rd.Next(preguntas.Count + 1);
        Pregunta? prox = preguntas[pos];
        preguntas.RemoveAt(pos);
        return prox;
    }
    public List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return DB.ObtenerRtasXPreg(idPregunta);
    }
    public bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
       
    }
}