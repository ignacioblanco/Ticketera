using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ticketera.Entidades
{
    public class AsignacionTicket
    {
        public Guid ID { get; set; }
        public Ticket TicketID { get; set; }
        public Cuenta CuentaID { get; set; }
        public DateTime FechaHora { get; set; }
        public bool Baja { get; set; }
    }
}
