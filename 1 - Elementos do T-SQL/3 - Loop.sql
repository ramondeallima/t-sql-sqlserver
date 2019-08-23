---------------------------------------------------------
----------------- EXEMPLO DE USO DE LOOP ----------------
---------------------------------------------------------
DECLARE @LIMITE_MIN INT, @LIMITE_MAX INT, @LIMITE_BREAK INT

SET @LIMITE_MIN = 1
SET @LIMITE_MAX = 10
SET @LIMITE_BREAK = 8

WHILE @LIMITE_MIN <= @LIMITE_MAX
BEGIN
	PRINT @LIMITE_MIN
	SET @LIMITE_MIN = @LIMITE_MIN + 1
	IF @LIMITE_MIN = @LIMITE_BREAK
	BEGIN
		PRINT 'BREAK'
		BREAK
	END
END


-- Faça um script que, a partir do dia 01/01/2017, conte o número de notas fiscais até o dia 10/01/2017. 
-- Imprima a data e o número de notas fiscais.

DECLARE @NUM_NOTAS INT, @DT_INICIAL DATE, @DT_FINAL DATE

SET @DT_INICIAL = '20170101'
SET @DT_FINAL = '20170110' 

WHILE @DT_INICIAL <= @DT_FINAL
BEGIN
	SELECT @NUM_NOTAS = COUNT(*) FROM [NOTAS FISCAIS]
		WHERE DATA = @DT_INICIAL
	PRINT CONVERT(VARCHAR(10), @DT_INICIAL)+ '       -         ' + CONVERT(VARCHAR(10), @NUM_NOTAS)
	SELECT @DT_INICIAL = DATEADD(DAY, 1, @DT_INICIAL)
END