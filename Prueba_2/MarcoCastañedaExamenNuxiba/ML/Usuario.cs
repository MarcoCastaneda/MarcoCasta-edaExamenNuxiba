using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ML
{
    public class Usuario
    {
       public int UserId { get; set; }
       public string Login { get; set; }
       public string Nombre { get; set; }
       public string Paterno { get; set; }
       public string Materno { get; set; }
       public decimal Sueldo { get; set; }
       public string Fecha { get; set; }
       public List<object> Usuarios { get; set; }

        public ML.Empleado empleado { get; set; }




    }
}
