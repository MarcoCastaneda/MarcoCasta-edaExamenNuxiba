SELECT usuario.UserId
      ,Login
      ,[Nombre]
      ,Paterno
      ,Materno
      ,Empleado.Sueldo
  FROM [dbo].[Usuario]
	
	INNER JOIN Empleado
	ON Empleado.UserId = Usuario.UserId
	

	WHERE (usuario.UserId != 7 AND Usuario.UserId != 10 AND Usuario.UserId != 6  AND Usuario.UserId != 9)

--------------------------------------------------


UPDATE Empleado
SET
Sueldo = sueldo * 1.10

WHERE FechaIngreso > '2000-01-01' AND FechaIngreso < '2001-01-01'


------------------------------------------------------
SELECT usuario.UserId, 
      Empleado.Sueldo
  FROM [dbo].[Usuario]
	
	INNER JOIN Empleado
	ON Empleado.UserId = Usuario.UserId

	WHERE Empleado.Sueldo > 1200

	GROUP BY Usuario.UserId, Empleado.Sueldo

-----------------------------------------------------------------
	SELECT usuario.UserId,
		   Empleado.Sueldo
	FROM [dbo].[Usuario]
	
	INNER JOIN Empleado
	ON Empleado.UserId = Usuario.UserId

	WHERE Empleado.Sueldo < 1200

	GROUP BY Usuario.UserId, Empleado.Sueldo
	


--------------------------------------------------
SELECT usuario.UserId
      ,Login
      ,[Nombre]
      ,Paterno
      ,Materno
      ,Empleado.Sueldo
  FROM [dbo].[Usuario]
	
	INNER JOIN Empleado
	ON Empleado.UserId = Usuario.UserId
	

	WHERE 
	        (Usuario.Paterno LIKE 't%' AND Empleado.Sueldo > 10000) 
	ORDER BY Empleado.Sueldo desc  
			
	



-------------------------------------

SELECT * FROM Empleado