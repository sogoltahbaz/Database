USE [DB-Project]  
GO  
CREATE PROCEDURE [dbo].SearchFilm   
    @Name nvarchar(100)   
AS   
    SET NOCOUNT ON;  
    SELECT * 
    FROM [dbo].Film  
    WHERE Title like @Name
GO  