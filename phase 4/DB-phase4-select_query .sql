USE [DB-Project]

SELECT FILM.ID , Film.Title , Film.ProductionYear , (film.RatingSum/Film.RatingCount) as rating
FROM Film,FdirectedBy,Directors
WHERE Film.id = FdirectedBy.FID and FdirectedBy.DID = Directors.ID and (Directors.FirstName + Directors.LastName) LIKE '%nolan%'

SELECT Series.ID , Series.Title , Series.ProductionYear , (Series.RatingSum/Series.RatingCount) as rating
FROM Series,SdirectedBy,Directors
WHERE Series.id = SdirectedBy.SEID
and SdirectedBy.DID = Directors.ID and (Directors.FirstName + Directors.LastName) LIKE '%Nutter%'

SELECT FILM.ID , Film.Title , Film.ProductionYear , (film.RatingSum/Film.RatingCount) as rating
FROM Film,FappearedIn,Actors
WHERE Film.id = FappearedIn.FID and FappearedIn.AID = Actors.ID and (Actors.FirstName + Actors.LastName) like '%pacino%'


SELECT Series.ID , Series.Title , Series.ProductionYear , (Series.RatingSum/Series.RatingCount) as rating
FROM Series,SappearedIn,Actors
WHERE Series.id = SappearedIn.SEID and SappearedIn.AID = Actors.ID and (Actors.FirstName + Actors.LastName) like '%Harington%'


SELECT Actors.FirstName , Actors.LastName , Actors.Profile_picture
FROM Actors,FappearedIn,Film
WHERE Actors.id = FappearedIn.AID and FappearedIn.FID = Film.ID and Film.Title like 'inception'

SELECT Actors.FirstName , Actors.LastName , Actors.Profile_picture
FROM Actors,SappearedIn,Series
WHERE Actors.id = SappearedIn.AID and SappearedIn.SEID = Series.ID and Series.Title like 'Game of Thrones'

SELECT *
FROM Film
WHERE YEAR(film.ProductionYear) = 2010

SELECT *
FROM Series
WHERE YEAR(Series.ProductionYear) = 2008

SELECT TOP 10 * ,(Film.RatingSum/Film.RatingCount) as rating
FROM Film
ORDER BY rating DESC

SELECT TOP 10 * , (Series.RatingSum/Series.RatingCount) as rating
FROM Series
ORDER BY rating DESC

SELECT TOP 10  FILM.ID , Film.Title , Film.ProductionYear , (film.RatingSum/Film.RatingCount) as rating
FROM Film,FhasGenre,Genre
WHERE Film.ID = FhasGenre.FID AND FhasGenre.GID = Genre.id and Genre.GenreName like 'Action'
ORDER BY rating DESC

SELECT TOP 10  Series.ID , Series.Title , Series.ProductionYear , (Series.RatingSum/Series.RatingCount) as rating
FROM Series,ShasGenre,genre
WHERE Series.ID = ShasGenre.SEID AND ShasGenre.GID = Genre.id and Genre.GenreName like 'adventure'
ORDER BY rating DESC

SELECT TOP 10  FILM.ID , Film.Title , Film.ProductionYear , (film.RatingSum/Film.RatingCount) as rating
FROM Film,FhasGenre
WHERE Film.ID = FhasGenre.FID AND YEAR(film.ProductionYear) = 2010
ORDER BY rating DESC

SELECT TOP 10  Series.ID , Series.Title , Series.ProductionYear , (Series.RatingSum/Series.RatingCount) as rating
FROM Series,ShasGenre
WHERE Series.ID = ShasGenre.SEID AND YEAR(Series.ProductionYear) = 2008
ORDER BY rating DESC

SELECT Series.ID , Series.Title , Series.ProductionYear , (Series.RatingSum/Series.RatingCount) as rating
FROM Series
WHERE Series.NoEpisodes > 40

SELECT DISTINCT TOP 5 (Actors.FirstName +' '+ Actors.LastName) as Name , COUNT(*) as Count
FROM 
	Actors,
	FappearedIn,Film,FhasGenre,Genre
WHERE Actors.ID = FappearedIn.AID and Film.ID = FappearedIn.FID and Film.ID = FhasGenre.FID AND FhasGenre.GID = Genre.id and Genre.GenreName like 'Crime'
GROUP BY Actors.FirstName + ' ' + Actors.LastName
ORDER BY Count DESC

SELECT DISTINCT TOP 5 (Actors.FirstName +' '+ Actors.LastName) as Name , COUNT(*) as Count
FROM 
	Actors,
	SappearedIn,Series,ShasGenre,Genre
WHERE Actors.ID = SappearedIn.AID and Series.ID = SappearedIn.SEID and Series.ID = ShasGenre.SEID AND ShasGenre.GID = Genre.id and Genre.GenreName like 'Drama'
GROUP BY Actors.FirstName + ' ' + Actors.LastName
ORDER BY Count DESC

SELECT Actors.ID, SUM(Film.RatingSum) / SUM(Film.RatingCount) as film_point, SUM(Series.RatingSum) / SUM(Series.RatingCount) as series_point
FROM FILM, FappearedIn, Actors, Series, SappearedIn
WHERE (FappearedIn.AID = Actors.ID and FappearedIn.FID = Film.ID) or (SappearedIn.AID = Actors.ID and SappearedIn.SEID = Series.ID)
GROUP BY Actors.ID
ORDER BY (SUM(Film.RatingSum) + SUM(Series.RatingSum) / SUM(Film.RatingCount) + SUM(Series.RatingCount)) DESC

-- فیلم های برتر کارگردان یک فیلم
SELECT TOP 5 Film.Title, Film.RatingSum / Film.RatingCount as rating
FROM 
( select Directors.ID
	from FdirectedBy,Directors,Film
	where Directors.ID = FdirectedBy.DID and FdirectedBy.FID = film.ID and Film.Title like 'Inception%') as dir ,Film,FdirectedBy
WHERE FdirectedBy.DID = dir.ID and FdirectedBy.FID = film.ID
ORDER BY rating DESC

SELECT TOP 5 Series.Title, Series.RatingSum / Series.RatingCount as rating
FROM 
( select Directors.ID
	from SdirectedBy,Directors, Series
	where Directors.ID = SdirectedBy.DID and SdirectedBy.SEID = Series.ID and Series.Title like 'Vikings%') as dir , Series, SdirectedBy
where SdirectedBy.DID = dir.ID and SdirectedBy.SEID = Series.ID
order by rating desc

