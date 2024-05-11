CREATE TRIGGER film_comment_trigger
ON CommentOnFilm
AFTER INSERT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @F_ID nvarchar(50)
	SELECT @F_ID = inserted.FID
	FROM inserted

	DECLARE @old_cnt bigint
	SELECT @old_cnt = Film.comment_count
	FROM Film
	WHERE Film.ID = @F_ID

	UPDATE Film
	SET comment_count = @old_cnt + 1
	WHERE ID = @F_ID
END;
