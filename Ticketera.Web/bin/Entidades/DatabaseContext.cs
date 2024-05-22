using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Runtime.Remoting.Contexts;
using Ticketera.Entidades;

namespace Ticketera.Entidades
{

    public class DatabaseContext : DbContext
    {

        public DatabaseContext() : base("DefaultConnection")
        {
            var objectContext = (this as IObjectContextAdapter).ObjectContext;
            objectContext.CommandTimeout = 1000;
        }

        public DbSet<Opcion> Opciones { get; set; }
        public DbSet<OpcionPerfil> OpcionesPerfiles { get; set; }
        public DbSet<Perfil> Perfiles { get; set; }
        public DbSet<Cuenta> Cuenta { get; set; }
        public DbSet<Adjuntos> Adjuntos { get; set; }
        public DbSet<Comentario> Comentario { get; set; }
        public DbSet<AsignacionTicket> AsignacionTicket { get; set; }
        public DbSet<Ticket> Ticket { get; set; }
        public DbSet<TicketTrace> TicketTrace { get; set; }
    }
}