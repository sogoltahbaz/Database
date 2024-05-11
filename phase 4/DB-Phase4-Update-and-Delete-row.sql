USE [DB-Project]

UPDATE Users
SET Email = 'new_mail@mail.com'
WHERE ID = 'iD';

UPDATE CommentOnFilm
SET Comment = 'new comment'
WHERE USID = 'UID' and FID = 'fid';

DELETE FROM CommentOnSeries
WHERE USID = 'uid' and SEID = 'sid'

DELETE FROM Users
WHERE ID = 'id001' and HashPassword = 'hashed_password';
