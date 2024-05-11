USE [DB-Project]

ALTER TABLE Actors
ADD InstagramPage nvarchar(MAX);

ALTER TABLE Actors
ADD Spouse nvarchar(50)

ALTER TABLE CommentOnSeries
ADD commentDate DATETIME DEFAULT GETDATE();

ALTER TABLE Film
ADD comment_count bigint DEFAULT 0;