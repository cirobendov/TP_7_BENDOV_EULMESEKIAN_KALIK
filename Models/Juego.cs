public class Juego
{
    public static string? Username{get; set;}
    public static int PuntajeActual{get; set;}
    private static int cantidadPreguntasCorrectas{get; set;}
    private static List<Pregunta>? preguntas{get; set;}
    private static List<Respuesta>? respuestas{get; set;}

    public static void InicializarJuego()
    {
        username = string.Empty;
        PuntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return DB.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return DB.ObtenerDificultades();
    }
    public static void CargarPartida(string Username, int dificultad, int categoria)
    {   
        username = Username;
        preguntas = DB.ObtenerPreguntas(dificultad, categoria);
        respuestas = DB.ObtenerRespuestas(preguntas);
    }
    public static Pregunta ObtenerProximaPregunta()
    {   
        Random rd = new Random();
        int pos = rd.Next(0, preguntas.Count);
        Pregunta? prox = preguntas[pos];
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
            PuntajeActual += 5;
            preguntas.RemoveAt(i);
       }
       return esCorrecta;
    }
    public static void RegistrarJuego(string usname, int pts, DateTime fh)
    {
        DB.InsertarPuntajes(usname, pts, fh);        
    }
}