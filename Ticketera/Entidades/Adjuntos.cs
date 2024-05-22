using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ticketera.Entidades
{
    public class Adjuntos
    {
        public Guid ID { get; set; }

        public Ticket TicketID { get; set; }

        public string NombreArchivo { get; set; }

        public string TipoMIME { get; set; }

        public bool Vigente { get; set; }

    }
}
