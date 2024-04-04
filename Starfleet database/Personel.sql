CREATE DATABASE Starfleet
GO;
Use Starfleet
CREATE TABLE [dbo].[Personel]
(
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Name] VARCHAR(255) Not null,
  [EnlistmentDate] DATE Not null,
  [EndOfServiceDate] DATE null,
  [Rank] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES RANKS(RANKId) Not null,
  [Status] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PersonnelStatus(StatusId) Not null
)

Create table PersonnelPosting
(
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [PersonnelId] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Personel(Id),
  [ShipId] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Ships(ShipId),
  [StartDate] DATE Not null,
  [EndDate] DATE,
  [ReasonForChange] VARCHAR(255)
)

create table PersonnelAssignment
(
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [PersonnelId] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Personel(Id),
  [AssignmentId] UNIQUEIDENTIFIER FOREIGN KEY REFERENCES Assignment(AssignmentId),
  [StartDate] DATE,
  [EndDate] DATE,
  [ReasonForChange] VARCHAR(255)
)

Create table Assignment
(
  [AssignmentId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Assignment] VARCHAR(255),
  [AssignmentAbbreviation] CHAR(5)
)

Create table [dbo].[Ranks]
(
  [RankId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Rank] VARCHAR(255),
  [RankAbbreviation] CHAR(5)
)

CREATE TABLE [dbo].[Ships]
(
  [ShipId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [RegistryNumber] VARCHAR(255) NOT NULL Unique,
  [ShipName] VARCHAR(255),
  [Captain] UniqueIdentifier FOREIGN KEY REFERENCES Personel(Id),
  [CommissionedDate] DATE,
  [EndOfLifeDate] DATE,
  [Class] VARCHAR(255),
  [Tonnage] INT,
  [MISSION] UniqueIdentifier FOREIGN KEY REFERENCES MISSION(Id),
  [WarpTopSpeed] CHAR(5)
)

create table MISSION (
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Name] VARCHAR(255),
  [Description] VARCHAR(255),
  [StartDate] DATE NOT NULL,
  [EndDate] DATE NULL,
  [Status] UniqueIdentifier FOREIGN KEY REFERENCES MissionStatus(Id),
  [MissionRuntime] As DATEDIFF(Year, StartDate, IsNULL(EndDate, getdate()))
)

 create table MissionStatus (
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Status] VARCHAR(255),
  [Description] VARCHAR(255)
 )

  create table PersonnelStatus (
  [Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
  [Status] VARCHAR(255),
  [Description] VARCHAR(255)
 )