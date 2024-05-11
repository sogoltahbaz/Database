USE [DB-Project]

delete  from  CommentOnSeries
delete  from  CommentOnFilm
delete  from  FProduce
delete  from  SProduce
delete  from  FdirectedBy
delete  from  SdirectedBy
delete  from  SappearedIn
delete  from  FappearedIn
delete  from  FhasGenre
delete  from  ShasGenre
delete  from  FRated
delete  from  SRated
delete  from  ISfaveMovie
delete  from  ISfaveSeries
delete  from  Users
delete  from  Genre
delete  from  Series
delete  from  Film
delete  from  Actors
delete  from  Directors
delete  from  Producers


-- Sample data for Producers table
INSERT INTO Producers (ID, Profile_picture, FirstName, LastName, Contact_information, Biography)
VALUES
    ('P001', NULL, 'Emma', 'Thomas', 'contact@EmmaThomas.com', 'is an English film producer, known for frequent collaborations with her husband, filmmaker Christopher Nolan.'),
	('P002', NULL, 'Mark', 'Huffam', 'contact@MarkHuffam.com', 'is a Northern Irish film and television producer. He was a producer on The Martian, Johnny English, and the television series Game of Thrones.'),
	('P003', NULL, 'Albert', 'S. Ruddy', 'albert.ruddy@example.com', 'Albert S. Ruddy served as a producer for "The Godfather."'),
	('P004', NULL, 'Vince', 'Gilligan', 'vince.gilligan@example.com', 'Vince Gilligan is the creator and producer of the TV series "Breaking Bad."'),
    ('P005', NULL, 'Mark', 'Johnson', 'mark.johnson@example.com', 'Mark Johnson is one of the producers of the TV series "Breaking Bad."'),
	('P006', NULL, 'Morgan', 'OSullivan', 'morgan.osullivan@example.com', 'Morgan O''Sullivan is a producer of the TV series "Vikings."'),
    ('P007', NULL, 'John', 'Weber', 'john.weber@example.com', 'John Weber is one of the producers of the TV series "Vikings."');


-- Sample data for Directors table
INSERT INTO Directors (ID, Profile_picture, FirstName, LastName, Contact_information, Biography)
VALUES
    ('D001', NULL, 'Christopher', 'Nolan', 'contact@christophernolan.com', 'Christopher Nolan is a British-American film director and screenwriter. He is known for directing mind-bending films such as Inception, Interstellar, and The Dark Knight trilogy.'),
    ('D002', NULL, 'David', 'Nutter', 'contact@David Nutter.com', 'is an American television and film director and television producer,he is director of 9 episodes of GOT.'),
	('D003', NULL, 'Francis', 'Ford Coppola', 'francis.coppola@example.com', 'Francis Ford Coppola is an acclaimed director known for directing "The Godfather" trilogy.'),
	('D004', NULL, 'Vince', 'Gilligan', 'vince.gilligan@example.com', 'Vince Gilligan is the creator and director of the TV series "Breaking Bad."'),
	('D005', NULL, 'Johan', 'Renck', 'johan.renck@example.com', 'Johan Renck is a Swedish director known for his work on the TV series "Vikings."');

-- Sample data for Actors table
INSERT INTO Actors (ID, Profile_picture, FirstName, LastName, Contact_information, Biography,InstagramPage,Spouse)
VALUES
	('A001', NULL, 'Christian', 'Bale', 'christian.bale@example.com', 'Christian Bale is an accomplished actor known for his role as Batman in "The Dark Knight."', 'christianbaleofficial', 'Sibi Blazic'),
    ('A002', NULL, 'Heath', 'Ledger', 'heath.ledger@example.com', 'Heath Ledger delivered an iconic performance as the Joker in "The Dark Knight."', 'heathledgerofficial', NULL),
    ('A003', NULL, 'Gary', 'Oldman', 'gary.oldman@example.com', 'Gary Oldman portrayed Commissioner Gordon in "The Dark Knight."', 'garyoldmanofficial', 'Gisele Schmidt'),
    ('A004', NULL, 'Michael', 'Caine', 'michael.caine@example.com', 'Michael Caine played Alfred Pennyworth, Bruce Waynes loyal butler, in "The Dark Knight."', 'michaelcaineofficial', 'Shakira Caine'),
	('A005', NULL, 'Kit', 'Harington', 'kit.harington@example.com', 'Kit Harington portrayed the character of Jon Snow in the TV series "Game of Thrones."', 'kitharingtonofficial', 'Rose Leslie'),
    ('A006', NULL, 'Emilia', 'Clarke', 'emilia.clarke@example.com', 'Emilia Clarke played the role of Daenerys Targaryen in the TV series "Game of Thrones."', 'emiliaclarke', NULL),
    ('A007', NULL, 'Peter', 'Dinklage', 'peter.dinklage@example.com', 'Peter Dinklage portrayed the character Tyrion Lannister in the TV series "Game of Thrones."', 'peterdinklageofficial', 'Erica Schmidt'),
    ('A008', NULL, 'Maisie', 'Williams', 'maisie.williams@example.com', 'Maisie Williams played the role of Arya Stark in the TV series "Game of Thrones."', 'maisiewilliams', NULL),
	('A009', NULL, 'Marlon', 'Brando', 'marlon.brando@example.com', 'Marlon Brando portrayed the character of Vito Corleone in "The Godfather."',NULL,NULL),
    ('A010', NULL, 'Al', 'Pacino', 'al.pacino@example.com', 'Al Pacino played the role of Michael Corleone in "The Godfather."',NULL,NULL),
    ('A011', NULL, 'James', 'Caan', 'james.caan@example.com', 'James Caan portrayed the character of Santino "Sonny" Corleone in "The Godfather."',NULL,NULL),
    ('A012', NULL, 'Robert', 'Duvall', 'robert.duvall@example.com', 'Robert Duvall played the role of Tom Hagen in "The Godfather."',NULL,NULL),
	('A013', NULL, 'Bryan', 'Cranston', 'bryan.cranston@example.com', 'Bryan Cranston portrayed the character of Walter White in the TV series "Breaking Bad."',NULL,NULL),
    ('A014', NULL, 'Aaron', 'Paul', 'aaron.paul@example.com', 'Aaron Paul played the role of Jesse Pinkman in the TV series "Breaking Bad."',NULL,NULL),
    ('A015', NULL, 'Anna', 'Gunn', 'anna.gunn@example.com', 'Anna Gunn portrayed the character of Skyler White in the TV series "Breaking Bad."',NULL,NULL),
	('A016', NULL, 'Leonardo', 'DiCaprio', 'leonardo.dicaprio@example.com', 'Leonardo DiCaprio is an acclaimed actor known for his versatile performances. He played the lead role in Inception.', 'leonardodicaprio', NULL),
    ('A017', NULL, 'Joseph', 'Gordon-Levitt', 'joseph.gordonlevitt@example.com', 'Joseph Gordon-Levitt is an actor known for his roles in Inception, (500) Days of Summer, and The Dark Knight Rises.', 'hitRECordJoe', NULL),
    ('A018', NULL, 'Elliot', 'Page', 'elliot.page@example.com', 'Elliot Page is an actor known for their roles in Inception, Juno, and The Umbrella Academy.', 'elliotpage', NULL),
    ('A019', NULL, 'Tom', 'Hardy', 'tom.hardy@example.com', 'Tom Hardy is an actor known for his roles in Inception, The Dark Knight Rises, and Mad Max: Fury Road.', 'tomhardy', 'Charlotte Riley'),
	('A020', NULL, 'Travis', 'Fimmel', 'travis.fimmel@example.com', 'Travis Fimmel played the role of Ragnar Lothbrok in the TV series "Vikings."',NULL,NULL),
    ('A021', NULL, 'Katheryn', 'Winnick', 'katheryn.winnick@example.com', 'Katheryn Winnick portrayed the character Lagertha in the TV series "Vikings."',NULL,NULL),
    ('A022', NULL, 'Gustaf', 'Skarsgård', 'gustaf.skarsgard@example.com', 'Gustaf Skarsgård played the role of Floki in the TV series "Vikings."',NULL,NULL);

-- Sample data for Users table
INSERT INTO Users (ID, Profile_picture, FirstName, LastName, Email, HashPassword)
VALUES
    ('U001', NULL, 'John', 'Doe', 'john.doe@example.com', 123456),
    ('U002', NULL, 'Jane', 'Smith', 'jane.smith@example.com', 789012),
    ('U003', NULL, 'Michael', 'Johnson', 'michael.johnson@example.com', 345678),
    ('U004', NULL, 'Emily', 'Brown', 'emily.brown@example.com', 901234);


-- Sample data for Film table
INSERT INTO Film (ID, Title, Runtime, ProductionYear, Synopsis, RatingCount, RatingSum)
VALUES
    ('F001', 'The Dark Knight', 152, '2008-07-18', 'The Dark Knight follows Batman as he faces the Joker, a criminal mastermind wreaking havoc on Gotham City.', 1000, 9000),
	('F002', 'The Godfather', 175, '1972-03-14', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',2000, 18400),
	('F003', 'Inception', 156,'2010-03-14','Inception is a mind-bending science fiction film directed by Christopher Nolan. It follows a skilled thief who can enter people''s dreams to steal valuable information.', 371, 3264);


-- Sample data for Series table
INSERT INTO Series (ID, Title, Runtime, ProductionYear, Synopsis, NoEpisodes, RatingCount, RatingSum)
VALUES
    ('S001', 'Game of Thrones', 60, '2011-04-17', 'Game of Thrones is a fantasy drama series based on the novels by George R.R. Martin, set in the fictional continents of Westeros and Essos.', 73, 150, 1380),
	('S002', 'Breaking Bad', 60, '2008-01-20', 'A high school chemistry teacher turned methamphetamine kingpin teams up with a former student to produce and sell high-quality meth.', 62, 1560, 14820),
	('S003', 'Vikings', 45, '2013-03-03', 'Vikings is a historical drama series that follows the legendary Norse hero Ragnar Lothbrok and his adventures in Viking Age Scandinavia.', 89, 3250, 29475);



-- Sample data for Genre table
INSERT INTO Genre (ID, GenreName)
VALUES
    ('G001', 'Action'),
    ('G002', 'Drama'),
    ('G003', 'Crime'),
    ('G004', 'Adventure'),
	('G005', 'Thriller');

-- Sample data for FProduce table
INSERT INTO FProduce (PID, FID)
VALUES
    ('P001', 'F001'),
	('P003', 'F002'),
	('P001', 'F003');


-- Sample data for SProduce table
INSERT INTO SProduce (PID, SEID)
VALUES
    ('P002', 'S001'),
    ('P004', 'S002'),
    ('P005', 'S002'),
    ('P006', 'S003'),
    ('P007', 'S003');


-- Sample data for FdirectedBy table
INSERT INTO FdirectedBy (DID, FID)
VALUES
    ('D001', 'F001'),
	('D003', 'F002'),
	('D001', 'F003');


-- Sample data for SdirectedBy table
INSERT INTO SdirectedBy (DID, SEID)
VALUES
    ('D002', 'S001'),
    ('D004', 'S002'),
	('D005', 'S003');


-- Sample data for FappearedIn table
INSERT INTO FappearedIn (AID, FID)
VALUES
    ('A001', 'F001'),
    ('A002', 'F001'),
    ('A003', 'F001'),
    ('A004', 'F001'),
    ('A009', 'F002'),
    ('A010', 'F002'),
    ('A011', 'F002'),
    ('A012', 'F002'),
	('A016', 'F003'),
    ('A017', 'F003'),
    ('A018', 'F003'),
    ('A019', 'F003');

-- Sample data for SappearedIn table
INSERT INTO SappearedIn (AID, SEID)
VALUES
    ('A005', 'S001'),
    ('A006', 'S001'),
    ('A007', 'S001'),
    ('A008', 'S001'),
	('A013', 'S002'),
    ('A014', 'S002'),
    ('A015', 'S002'),
	('A020', 'S003'),
    ('A021', 'S003'),
    ('A022', 'S003');



-- Sample data for FhasGenre table
INSERT INTO FhasGenre (GID, FID)
VALUES
    ('G001', 'F001'),
    ('G002', 'F001'),
    ('G003', 'F001'),
    ('G002', 'F002'),
    ('G003', 'F002'),
    ('G001', 'F003'),
    ('G004', 'F003');

-- Sample data for ShasGenre table
INSERT INTO ShasGenre (GID, SEID)
VALUES
    ('G001', 'S001'),
    ('G002', 'S001'),
    ('G004', 'S001'),
    ('G002', 'S002'),
    ('G003', 'S002'),
    ('G005', 'S002'),
	('G002', 'S003'),
    ('G003', 'S003');

-- Sample data for FRated table
INSERT INTO FRated (USID, FID, point)
VALUES
    ('U001', 'F001', 9),
	('U003', 'F002', 9),
	('U003', 'F001', 8),
    ('U001', 'F002', 8),
	('U004', 'F003', 8),
    ('U002', 'F003', 8);

-- Sample data for SRated table
INSERT INTO SRated (USID, SEID, point)
VALUES
    ('U002', 'S001', 9),
    ('U004', 'S002', 9),
	('U001', 'S003', 8),
    ('U002', 'S003', 7),
    ('U003', 'S003', 8);


-- Sample data for ISfaveMovie table
INSERT INTO ISfaveMovie (USID, FID)
VALUES
    ('U001', 'F001'),
	('U003', 'F002'),
	('U004', 'F003');

-- Sample data for ISfaveSeries table
INSERT INTO ISfaveSeries (USID, SEID)
VALUES
    ('U002', 'S001'),
    ('U004', 'S002'),
	('U002', 'S003'),
    ('U003', 'S003');

-- Sample data for CommentOnFilm table
INSERT INTO CommentOnFilm (USID, FID, Comment)
VALUES
    ('U001', 'F001', 'The Dark Knight is an amazing film! The acting and storytelling are top-notch.'),
	('U003', 'F002', 'The Godfather is an amazing film! The acting and storytelling are top-notch.'),
	('U004', 'F003', 'Inception is an amazing film! The acting and storytelling are top-notch.');


-- Sample data for CommentOnSeries table
INSERT INTO CommentOnSeries (USID, SEID, Comment)
VALUES
    ('U002', 'S001', 'Game of Thrones is my all-time favorite series! The characters and plot are captivating.'),
	('U004', 'S002', 'breaking bad is my all-time favorite series! The characters and plot are captivating.'),
	('U003', 'S003', 'Ragnar Lothbrok is an amazing character, and Travis Fimmel s performance was outstanding.');