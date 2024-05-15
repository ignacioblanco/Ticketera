-- Inserts para la tabla Perfil
INSERT INTO Perfil (ID, Descripcion) VALUES
(1, 'Administrador'),
(2, 'Usuario Normal'),
(3, 'Soporte Técnico');

-- Inserts para la tabla Opcion
INSERT INTO Opcion (ID, Descripcion) VALUES
(1, 'Crear Ticket'),
(2, 'Ver Tickets'),
(3, 'Actualizar Ticket'),
(4, 'Eliminar Ticket');

-- Inserts para la tabla OpcionPerfil
INSERT INTO OpcionPerfil (ID, OpcionID, PerfilID) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 2, 2),
(5, 3, 2),
(6, 2, 3),
(7, 3, 3),
(8, 4, 3);

-- Inserts para la tabla Cuenta
INSERT INTO Cuenta (ID, Nombre, Apellido, Email, Usuario, Contraseña, Estado, PerfilID, Baja) VALUES
(NEWID(), 'Juan', 'Pérez', 'juan@example.com', 'juanperez', '123456', 'Activo', 1, 0),
(NEWID(), 'María', 'Gómez', 'maria@example.com', 'mariagomez', 'abcdef', 'Activo', 2, 0),
(NEWID(), 'Carlos', 'Martínez', 'carlos@example.com', 'carlosmartinez', 'password', 'Inactivo', 2, 1),
(NEWID(), 'Ana', 'López', 'ana@example.com', 'analopez', 'qwerty', 'Activo', 3, 0);

-- Inserts para la tabla Ticket
INSERT INTO Ticket (ID, CuentaID, FechaCreacion, Estado, Descripcion, Baja) VALUES
(NEWID(), (SELECT ID FROM Cuenta WHERE Usuario = 'juanperez'), GETDATE(), 'Abierto', 'Problema con la conexión de internet.', 0),
(NEWID(), (SELECT ID FROM Cuenta WHERE Usuario = 'mariagomez'), GETDATE(), 'En Proceso', 'Problema con la impresora.', 0),
(NEWID(), (SELECT ID FROM Cuenta WHERE Usuario = 'analopez'), GETDATE(), 'Cerrado', 'Problema solucionado.', 0);

-- Inserts para la tabla Comentarios
INSERT INTO Comentarios (ID, TicketID, UserID, FechaHora, Mensaje, Baja) VALUES
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Abierto'), (SELECT ID FROM Cuenta WHERE Usuario = 'juanperez'), GETDATE(), 'Estamos trabajando en resolver el problema.', 0),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'En Proceso'), (SELECT ID FROM Cuenta WHERE Usuario = 'mariagomez'), GETDATE(), 'Hemos encontrado la causa del problema.', 0),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Cerrado'), (SELECT ID FROM Cuenta WHERE Usuario = 'analopez'), GETDATE(), 'Problema resuelto con éxito.', 0);

-- Inserts para la tabla Adjuntos
INSERT INTO Adjuntos (ID, TicketID, NombreArchivo, TipoMIME, Vigente) VALUES
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Abierto'), 'archivo1.pdf', 'application/pdf', 1),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'En Proceso'), 'imagen.png', 'image/png', 1),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Cerrado'), 'documento.docx', 'application/msword', 1);

-- Inserts para la tabla TicketTrace
INSERT INTO TicketTrace (ID, TicketID, CuentaID, FechaHora, Comentario, EstadoAnterior, EstadoNuevo, Baja) VALUES
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Abierto'), (SELECT ID FROM Cuenta WHERE Usuario = 'juanperez'), GETDATE(), 'Se ha asignado el ticket para su revisión.', 'Abierto', 'En Proceso', 0),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'En Proceso'), (SELECT ID FROM Cuenta WHERE Usuario = 'mariagomez'), GETDATE(), 'Se ha encontrado la solución al problema.', 'En Proceso', 'Cerrado', 0);

-- Inserts para la tabla AsignacionesTickets
INSERT INTO AsignacionesTickets (ID, TicketID, CuentaID, FechaHora, Baja) VALUES
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'Abierto'), (SELECT ID FROM Cuenta WHERE Usuario = 'juanperez'), GETDATE(), 0),
(NEWID(), (SELECT ID FROM Ticket WHERE Estado = 'En Proceso'), (SELECT ID FROM Cuenta WHERE Usuario = 'mariagomez'), GETDATE(), 0);
