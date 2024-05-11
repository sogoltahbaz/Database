USE [DB-Project]

ALTER TABLE Users
ADD CONSTRAINT email_unique UNIQUE (Email);

ALTER TABLE CommentOnFilm
ADD CONSTRAINT comment_len CHECK (LEN(Comment) <= 300);

ALTER TABLE CommentOnFilm
ADD CONSTRAINT film_comment_time CHECK (commentDate <= GETDATE());

ALTER TABLE Users
DROP CONSTRAINT Name_not_null;

ALTER TABLE Users
Drop CONSTRAINT prof_size;

