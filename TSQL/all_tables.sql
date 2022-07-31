DECLARE @name nvarchar(255)
DECLARE @statement nvarchar(2048)

DECLARE db_cursor CURSOR FOR 
select [name] from sys.all_objects where [type] ='U'

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @name  

WHILE @@FETCH_STATUS = 0  
BEGIN  
	SET @statement = 'TRUNCATE TABLE '+ @name + ';'
	PRINT @statement
	FETCH NEXT FROM db_cursor INTO @name 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 
