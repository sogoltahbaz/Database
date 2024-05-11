USE [DB-Project]


DROP	TABLE IF EXISTS CommentOnSeries;
DROP	TABLE IF EXISTS CommentOnFilm;
DROP	TABLE IF EXISTS FProduce;
DROP	TABLE IF EXISTS SProduce;
DROP	TABLE IF EXISTS FdirectedBy;
DROP	TABLE IF EXISTS SdirectedBy;
DROP	TABLE IF EXISTS SappearedIn;
DROP	TABLE IF EXISTS FappearedIn;
DROP	TABLE IF EXISTS FhasGenre;
DROP	TABLE IF EXISTS ShasGenre;
DROP	TABLE IF EXISTS FRated;
DROP	TABLE IF EXISTS SRated;
DROP	TABLE IF EXISTS ISfaveMovie;
DROP	TABLE IF EXISTS ISfaveSeries;
DROP	TABLE IF EXISTS Users;
DROP	TABLE IF EXISTS Genre;
DROP	TABLE IF EXISTS Series;
DROP	TABLE IF EXISTS Film;
DROP	TABLE IF EXISTS Actors;
DROP	TABLE IF EXISTS Directors;
DROP	TABLE IF EXISTS Producers;



CREATE TABLE Producers(
ID nvarchar(50) not null primary key,
Profile_picture VARBINARY(MAX),
FirstName nvarchar(50),
LastName nvarchar(50),
Contact_information nvarchar(MAX),
Biography nvarchar(MAX),
CONSTRAINT pro_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
)

CREATE TABLE Directors(
ID nvarchar(50) not null primary key,
Profile_picture VARBINARY(MAX),
FirstName nvarchar(50),
LastName nvarchar(50),
Contact_information nvarchar(MAX),
Biography nvarchar(MAX),
CONSTRAINT dir_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
)

CREATE TABLE Actors(
ID nvarchar(50) not null primary key,
Profile_picture VARBINARY(MAX),
FirstName nvarchar(50),
LastName nvarchar(50),
Contact_information nvarchar(MAX),
Biography nvarchar(MAX),
CONSTRAINT act_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
)

CREATE TABLE Film(
ID nvarchar(50) not null primary key,
Title nvarchar(50),
Runtime bigint,
ProductionYear Date,
Synopsis nvarchar(MAX),
RatingCount int DEFAULT 0,
RatingSum real DEFAULT 0,
CONSTRAINT film_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
)

CREATE TABLE Series(
ID nvarchar(50) not null primary key,
Title nvarchar(50),
Runtime bigint,
ProductionYear Date,
Synopsis nvarchar(MAX),
NoEpisodes int DEFAULT 0,
RatingCount int DEFAULT 0,
RatingSum real DEFAULT 0,
CONSTRAINT seri_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
)

CREATE TABLE Genre(
ID nvarchar(50) not null primary key,
GenreName nvarchar(50),
CONSTRAINT ID_check CHECK (ID like '%[0-9]%' and ID like '%[a-z]%' OR ID like '%[A-Z]%'),

)

CREATE TABLE Users(
ID nvarchar(50) not null primary key,
Profile_picture VARBINARY(MAX),
FirstName nvarchar(50),
LastName nvarchar(50),
Email nvarchar(256),
HashPassword bigint, 
CONSTRAINT user_ID_check CHECK (ID like '%[0-9]%' and (ID like '%[a-z]%' OR ID like '%[A-Z]%')),
CONSTRAINT Name_not_null CHECK (FirstName IS NOT null),
CONSTRAINT prof_size CHECK (LEN(profile_picture) <= 1000000)
)

CREATE TABLE FProduce(
PID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (PID, FID),
foreign key(PID) references Producers(ID),
foreign key(FID) references Film(ID),
)

CREATE TABLE SProduce(
PID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (PID, SEID),
foreign key(PID) references Producers(ID),
foreign key(SEID) references Series(ID),
)

CREATE TABLE FdirectedBy(
DID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (DID, FID),
foreign key(DID) references Directors(ID),
foreign key(FID) references Film(ID),
)

CREATE TABLE SdirectedBy(
DID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (SEID, DID),
foreign key(DID) references Directors(ID),
foreign key(SEID) references Series(ID),
)

CREATE TABLE FappearedIn(
AID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (AID, FID),
foreign key(AID) references Actors(ID),
foreign key(FID) references Film(ID),
)

CREATE TABLE SappearedIn(
AID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (AID, SEID),
foreign key(AID) references Actors(ID),
foreign key(SEID) references Series(ID),
)

CREATE TABLE FhasGenre(
GID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (GID, FID),
foreign key(FID) references Film(ID),
foreign key(GID) references Genre(ID),
)

CREATE TABLE ShasGenre(
GID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (GID, SEID),
foreign key(SEID) references Series(ID),
foreign key(GID) references Genre(ID),
)

CREATE TABLE FRated(
USID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (USID, FID),
point tinyint,
foreign key(FID) references Film(ID),
foreign key(USID) references Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (point >=0 and point <=10)
)

CREATE TABLE SRated(
USID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (USID, SEID),
point tinyint,
foreign key(SEID) references Series(ID),
foreign key(USID) references Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (point >=0 and point <=10)
)

CREATE TABLE ISfaveMovie(
USID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (USID, FID),
foreign key(FID) references Film(ID),
foreign key(USID) references Users(ID)ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE ISfaveSeries(
USID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (USID, SEID),
foreign key(SEID) references Series(ID),
foreign key(USID) references Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE CommentOnFilm(
USID nvarchar(50) not null,
FID nvarchar(50) not null,
primary key (USID, FID),
Comment nvarchar(MAX),
commentDate DATETIME DEFAULT GETDATE(),
foreign key(FID) references Film(ID),
foreign key(USID) references Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
)

CREATE TABLE CommentOnSeries(
USID nvarchar(50) not null,
SEID nvarchar(50) not null,
primary key (USID, SEID),
Comment nvarchar(MAX),
foreign key(SEID) references Series(ID),
foreign key(USID) references Users(ID) ON DELETE CASCADE ON UPDATE CASCADE,
)
