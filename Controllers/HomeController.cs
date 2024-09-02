using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Preguntados_Kalik_Eulmesekian_BENDOV.Models;

namespace Preguntados_Kalik_Eulmesekian_BENDOV.Controllers;

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

    public IActionResult Juegardo()
    {
        return View("Jugar");
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        return View();
    }

    public IActionResult Ruleta ()
    {
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
    public IActionResult Jugar()
    {
        Pregunta pregunta = Juego.ObtenerProximaPregunta();
        if(pregunta == null)
            return View("Fin");
        else
        {
            ViewBag.Username = Juego.username;
            ViewBag.Puntos = Juego.puntajeActual;
            ViewBag.ListaRtas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
            ViewBag.Enunciado = pregunta.Enunciado;
            ViewBag.Foto = pregunta.Foto;      
        }
        return View("Jugar");
    }
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.esCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }

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
