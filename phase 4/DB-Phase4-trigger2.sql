CREATE TRIGGER film_rating_trigger
ON FRATED
AFTER INSERT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @F_ID nvarchar(50)
	SELECT @F_ID = inserted.FID
	FROM inserted

	DECLARE @rate nvarchar(50)
	SELECT @rate = inserted.point
	FROM inserted

	DECLARE @old_cnt bigint
	SELECT @old_cnt = Film.RatingCount
	FROM Film
	WHERE Film.ID = @F_ID

	DECLARE @old_sum real
	SELECT @old_cnt = Film.RatingSum
	FROM Film
	WHERE Film.ID = @F_ID

	UPDATE Film
	SET RatingSum = @old_sum + @rate, RatingCount = @old_cnt + 1
	WHERE ID = @F_ID
END;
