using Preguntados_Kalik_Eulmesekian_BENDOV.Models;
public class Juego
{
    public static string? Username{get; set;}
    public static int PuntajeActual{get; set;}
    private static int cantidadPreguntasCorrectas{get; set;}
    private static List<Pregunta>? preguntas{get; set;}
    private static List<Respuesta>? respuestas{get; set;}

    public static void InicializarJuego()
    {
        Username = string.Empty;
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
            for(int a = 1; a < preguntas.Count ;a++)
            {
                preguntas[a].pos = preguntas[a].IdPregunta--;
                if(idPregunta == preguntas[a].pos + 1)
                preguntas.RemoveAt(a);
            } 
       }
       return esCorrecta; 
    }
    /*public static void RegistrarJuego(string usname, int pts, DateTime fh)
    {
        DB.InsertarPuntajes(usname, pts, fh);        
    }
    */
    
}