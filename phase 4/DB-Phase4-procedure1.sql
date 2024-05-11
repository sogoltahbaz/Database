USE [DB-Project]  
GO  
CREATE PROCEDURE [dbo].SearchActor   
    @Name nvarchar(100)   
AS   
    SET NOCOUNT ON;  
    SELECT * 
    FROM [dbo].Actors  
    WHERE FirstName + LastName like @Name
GO  