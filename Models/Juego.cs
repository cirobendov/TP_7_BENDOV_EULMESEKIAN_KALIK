public class Juego
{
    public static string? Username{get; set;}
    public static int PuntajeActual{get; set;}
    public static int cantidadPreguntasCorrectas{get; set;}
    public static int cantidadPreguntasContestadas{get;set;}
    private static List<Pregunta>? preguntas{get; set;}
    private static List<Respuesta>? respuestas{get; set;}
    public static void InicializarJuego()
    {
        Username = string.Empty;
        PuntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
        cantidadPreguntasContestadas = 0;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return DB.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return DB.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {   
        Username = username;
        preguntas = DB.ObtenerPreguntas(dificultad, categoria);
        respuestas = DB.ObtenerRespuestas(preguntas);
    }

    public static Pregunta ObtenerProximaPregunta()
    {   if(preguntas.Count > 0)
        {
            Random rd = new Random();
            int pos = rd.Next(0, preguntas.Count);
            Pregunta prox = preguntas[pos];
            return prox;
        }
        else 
            return null;
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
        int indice = 0;

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
        }
        
        for(int a = 0; a < preguntas.Count ;a++)
            {
                if (preguntas[a].IdPregunta == idPregunta)
                {
                    indice = a;
                }
            } 
        preguntas.RemoveAt(indice);
        cantidadPreguntasContestadas++;
        return esCorrecta;
    }
}