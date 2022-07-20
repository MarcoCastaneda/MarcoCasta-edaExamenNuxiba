using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PL.Controllers
{
    public class UsuarioController : Controller
    {
        [HttpGet]
        public ActionResult GetAll()
        {
            ML.Usuario usuario = new ML.Usuario();
            ML.Result result = BL.Usuario.GetAll();

              usuario.Usuarios = result.Objects;



            return View(usuario);
        }



        [HttpGet]
        public ActionResult Form(int? Idusuario)
        {

            ML.Usuario usuario = new ML.Usuario();
            if (Idusuario == null)
            {
                return View(usuario);
            }
           
            return View(usuario);
        }


        [HttpPost]
        public ActionResult Form(ML.Usuario usuario)
        {
            ML.Result result = new ML.Result();




            if (usuario.UserId == 0)
            {

                result = BL.Usuario.Add(usuario);


                if (result.Correct)
                {

                    


                    ViewBag.Mensaje = "El usuario se ha agregado";
                }
                else
                {
                    ViewBag.Mensaje = "El usuario no se ha agregado";
                }
            }
            else
            {

                if (result.Correct)
                {
                    ViewBag.Mensaje = "El usuario se actualizo correctamente";
                }
                else
                {
                    ViewBag.Mensaje = "Ocurrio un error al realizar la actualizacion" + result.ErrorMessage;
                }
            }



            return PartialView("Modal");
        }







      

        [HttpGet]
        public ActionResult FormSalario(int UserId)

        {
            ML.Result result = new ML.Result();
            ML.Empleado empleado = new ML.Empleado();

            result = BL.Empleado.GetBySalario(UserId);
            empleado = ((ML.Empleado)result.Object);

            return View(empleado);
        }

        [HttpPost]
        public ActionResult FormSalario(ML.Empleado empleado)
        {
            ML.Result result = new ML.Result();


            result = BL.Empleado.UpdateSalario(empleado);

            if (result.Correct)
            {
                ViewBag.Mensaje = "El salario se actualizo correctamente";
            }
            else
            {
                ViewBag.Mensaje = "Ocurrio un error al realizar la actualizacion" + result.ErrorMessage;
            }
            return PartialView("Modal");

        }

        [HttpGet]
        public ActionResult Descarga()
        {
         

            return View();
        }

        [HttpPost]
        public ActionResult Convertir()
        {
            ML.Result result = new ML.Result();


            result = BL.Usuario.Convertir();

            if (result.Correct)
            {
                ViewBag.Mensaje = "se ha  descargado los usuarios correctamente";
            }
            else
            {
                ViewBag.Mensaje = "Ocurrio un error al realizar la descarga" + result.ErrorMessage;
            }
            return PartialView("Modal");
        }


            


        [HttpGet]
        public ActionResult Delete(ML.Usuario usuario)
        {
            ML.Result result = BL.Usuario.Delete(usuario);
            if (result.Correct)
            {
                ViewBag.Mensaje = "EL usuario se elimino correctamente";
            }
            else
            {
                ViewBag.Mensaje = "Ocurrio un problema al eliminar al usuario " + result.ErrorMessage;

            }
            return PartialView("modal");
        }







    }


}

