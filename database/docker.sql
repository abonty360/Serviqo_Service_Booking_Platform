CREATE LOGIN docker_user WITH PASSWORD = 'StrongPassword123';
GO

USE serviqo_s_df; 
--use your db name
GO

CREATE USER docker_user FOR LOGIN docker_user;
GO

ALTER ROLE db_owner ADD MEMBER docker_user;
GO

SELECT name FROM sys.sql_logins WHERE name = 'docker_user';
SELECT name FROM sys.database_principals WHERE name = 'docker_user';