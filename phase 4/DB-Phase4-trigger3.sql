CREATE TRIGGER series_rating_trigger
ON SRATED
AFTER INSERT
AS
SET NOCOUNT ON
BEGIN
	DECLARE @S_ID nvarchar(50)
	SELECT @S_ID = inserted.SEID
	FROM inserted

	DECLARE @rate nvarchar(50)
	SELECT @rate = inserted.point
	FROM inserted

	DECLARE @old_cnt bigint
	SELECT @old_cnt = Series.RatingCount
	FROM Series
	WHERE Series.ID = @S_ID

	DECLARE @old_sum real
	SELECT @old_cnt = Series.RatingSum
	FROM Series
	WHERE Series.ID = @S_ID

	UPDATE Series
	SET RatingSum = @old_sum + @rate, RatingCount = @old_cnt + 1
	WHERE ID = @S_ID
END;
