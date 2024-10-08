using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Preguntados_Kalik_Eulmesekian_BENDOV.Models;

namespace Preguntados_Kalik_Eulmesekian_BENDOV.Controllers;
[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }
    
    [HttpPost]
    public IActionResult Comenzar(string Username, int dificultad, int categoria)
    {
        Juego.CargarPartida(Username, dificultad, categoria);
        if(Juego.ObtenerProximaPregunta() != null)
            return RedirectToAction("Jugar");       
        else 
            return RedirectToAction("ConfigurarJuego");     
    }

    public IActionResult Fin()
    {
        ViewBag.Username = Juego.Username;
        ViewBag.Puntos = Juego.PuntajeActual;
        ViewBag.Correctas = Juego.cantidadPreguntasCorrectas;
        ViewBag.TotalPreguntas = Juego.cantidadPreguntasContestadas;
        return View();
    }


    public IActionResult Jugar()
    {
        Pregunta pregunta = Juego.ObtenerProximaPregunta();
        if(pregunta == null)
        {
           // Juego.RegistrarJuego(Juego.Username, Juego.PuntajeActual, DateTime.Now);
            return RedirectToAction("Fin");
        }          
        else
        {
            ViewBag.Username = Juego.Username;
            ViewBag.Puntos = Juego.PuntajeActual;
            ViewBag.ListaRtas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
            ViewBag.Preguntas = pregunta;
            ViewBag.Categorias = Juego.ObtenerCategorias();
        }
        return View("Jugar");
    }
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool esCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return RedirectToAction("Respuesta", new{correcta = esCorrecta});
    }

    public IActionResult Respuesta(bool correcta)
    {
        ViewBag.esCorrecta = correcta;
        ViewBag.Username = Juego.Username;
        ViewBag.Puntos = Juego.PuntajeActual;
        return View();
    }

    /*public IActionResult HighScores()
    {
        ViewBag.ListaHighScores = DB.ObtenerPuntajes();
        return View();
    }
    */

    public IActionResult Privacy()
    {
        return View();
    }
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
