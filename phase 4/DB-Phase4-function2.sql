CREATE FUNCTION [dbo].FullName(@FirstName nvarchar(50), @LastName nvarchar(50))
returns nvarchar(100) as
BEGIN
	DECLARE @return_val nvarchar(100)
	set @return_val = @FirstName + @LastName
	RETURN @return_val
END;