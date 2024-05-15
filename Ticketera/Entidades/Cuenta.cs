using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ticketera.Entidades
{

    public class Cuenta
    {
        public Guid ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set;}
        public string Email { get; set;}
        public string Contraseña { get; set;}
        public string Salt { get; set;}
        public bool Tipo { get; set;}
        public string Estado { get; set;}

        public DateTime FechaHora { get; set;}

        public Perfil PerfilID { get; set;}
           
    }
}
