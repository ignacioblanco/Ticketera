using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Ticketera.Entidades;

namespace Ticketera.Models
{
    public class TablaTicketsModel
    {
        public List<Ticket> getTicket(Guid ID) { 
            DatabaseContext db = new DatabaseContext();

            List<Ticket> lista = db.Ticket.Where(t => t.ID == ID).ToList();
            if (lista != null) {
                return lista;
            }
            else {
                return lista;
            }

        }
    }
}