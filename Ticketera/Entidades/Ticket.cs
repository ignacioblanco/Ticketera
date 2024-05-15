using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ticketera.Entidades
{
    public class Ticket
    {
        public Guid ID { get; set; }
        public Cuenta CuentaID { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string Estado { get; set; }
        public string Descripcion { get; set; }
        public bool Baja { get; set; }
    }
}
