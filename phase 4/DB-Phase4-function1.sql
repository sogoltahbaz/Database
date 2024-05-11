CREATE FUNCTION [dbo].COMPUTE_RATE(@sum real, @cnt bigint)
returns real as
BEGIN
	DECLARE @return_val real
	IF @cnt = 0
		SET @return_val = 0
	ELSE
		SET @return_val = @sum / @cnt
	RETURN @return_val
END;