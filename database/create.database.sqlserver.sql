CREATE DATABASE DOTWARE
GO

USE DOTWARE
Go

CREATE LOGIN dotware WITH PASSWORD = 'sa@dotware.2019'
GO

CREATE USER user_dotware FOR LOGIN dotware WITH DEFAULT_SCHEMA = dbo
GO


EXEC sp_addrolemember 'db_owner', 'user_dotware'
GO
