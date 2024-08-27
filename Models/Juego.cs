public class Juego
{
    private static string? username{get; set;}
    private static int puntajeActual{get; set;}
    private static int cantidadPreguntasCorrectas{get; set;}
    private static List<Pregunta>? preguntas{get; set;}
    private static List<Respuesta>? respuestas{get; set;}

    public static void InicializarJuego()
    {
        username = string.Empty;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public static List<Categoría> ObtenerCategorias()
    {
        return DB.ObtenerCategorias();
    }
    public static List<Dificulad> ObtenerDificultades()
    {
        return DB.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = DB.ObtenerPreguntas(dificultad, categoria);
        respuestas = DB.ObtenerRespuestas(preguntas);
    }
    public static Pregunta ObtenerProximaPregunta()
    {   
        Random rd = new Random();
        int pos = rd.Next(preguntas.Count + 1);
        Pregunta? prox = preguntas[pos];
        preguntas.RemoveAt(pos);
        return prox;
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return DB.ObtenerRtasXPreg(idPregunta);
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
       List<Respuesta> listaRtas = DB.ObtenerRtasXPreg(idPregunta);
       bool esCorrecta = false;
       int i = 0;
       do
       {
            if(listaRtas[i].IdRespuesta == idRespuesta && listaRtas[i].Correcta == true)           
            esCorrecta = true;       
            i++;
       } while (esCorrecta == false && i < listaRtas.Count);
       if(esCorrecta)
       {
            cantidadPreguntasCorrectas++;
            puntajeActual += 5;
            preguntas.RemoveAt(i);
       }
       return esCorrecta;
    }
}