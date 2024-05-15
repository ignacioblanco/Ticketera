CREATE TABLE Perfil (
    ID int PRIMARY KEY,
    Descripcion VARCHAR(100)
);

go

Create table Opcion(
	ID int primary key,
	Descripcion Varchar(100)
);

go

Create table OpcionPerfil(
	ID int primary key,
	OpcionID int,
	PerfilID int,
	Foreign key (PerfilID) references Perfil(ID),
	Foreign key (OpcionID) references Opcion(ID)
);

go

CREATE TABLE Cuenta (
    ID uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Email VARCHAR(100),
	Usuario varchar(100),
    Contraseña VARCHAR(255),
    Estado VARCHAR(50),
	PerfilID int,
	Baja bit,
	Foreign key (PerfilID) references Perfil(ID)
);

go


CREATE TABLE Ticket (
    ID uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
    CuentaID uniqueidentifier,
    FechaCreacion DATETIME,
    Estado VARCHAR(50),
    Descripcion TEXT,
	Baja bit,
    FOREIGN KEY (CuentaID) REFERENCES Cuenta(ID),
);

go


CREATE TABLE Comentarios (
    ID uniqueidentifier PRIMARY KEY DEFAULT NEWID(),
    TicketID uniqueidentifier,
    UserID uniqueidentifier,
    FechaHora DATETIME,
    Mensaje TEXT,
	Baja bit,
    FOREIGN KEY (TicketID) REFERENCES Ticket(ID),
    FOREIGN KEY (UserID) REFERENCES Cuenta(ID)
);

go


CREATE TABLE Adjuntos (
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    TicketID UNIQUEIDENTIFIER,
    NombreArchivo VARCHAR(255),
    TipoMIME VARCHAR(100),
	Vigente bit,
    FOREIGN KEY (TicketID) REFERENCES Ticket(ID)
);

CREATE TABLE TicketTrace (
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    TicketID UNIQUEIDENTIFIER,
    CuentaID UNIQUEIDENTIFIER,
    FechaHora DATETIME,
    Comentario TEXT,
    EstadoAnterior VARCHAR(100),
    EstadoNuevo VARCHAR(100),
	Baja bit,
    FOREIGN KEY (TicketID) REFERENCES Ticket(ID),
    FOREIGN KEY (CuentaID) REFERENCES Cuenta(ID)
);

CREATE TABLE AsignacionesTickets (
    ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    TicketID UNIQUEIDENTIFIER,
    CuentaID UNIQUEIDENTIFIER,
    FechaHora DATETIME,
	Baja bit,
    FOREIGN KEY (TicketID) REFERENCES Ticket(ID),
    FOREIGN KEY (CuentaID) REFERENCES Cuenta(ID)
);