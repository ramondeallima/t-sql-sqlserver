
-- TABELA TEMPOR�RIA VIS�VEL SOMENTE P/ O BLOCO A QUAL EST� SENDO EXECUTADA
DECLARE @REGISTROS_FISCAIS TABLE  (DATA_VENDA DATE NULL, NOTAS_EMITIDAS INT NULL)	

-- TABELA TEMPOR�RIA CONEX�O ATUAL
IF OBJECT_ID('#REGISTROS_FISCAIS2', 'U') IS NOT NULL
BEGIN
	DROP TABLE #REGISTROS_FISCAIS2
	CREATE TABLE #REGISTROS_FISCAIS2 (DATA_VENDA DATE NULL, NOTAS_EMITIDAS INT NULL)	
END

-- TABELA TEMPOR�RIA P/ TODAS AS CONEX�ES 
IF OBJECT_ID('##REGISTROS_FISCAIS3', 'U') IS NOT NULL
BEGIN
	DROP TABLE ##REGISTROS_FISCAIS3
	CREATE TABLE ##REGISTROS_FISCAIS3 (DATA_VENDA DATE NULL, NOTAS_EMITIDAS INT NULL)	
END

DECLARE @NUM_NOTAS INT, @DT_INICIAL DATE, @DT_FINAL DATE

SET @DT_INICIAL = '20170101'
SET @DT_FINAL = '20170110' 

WHILE @DT_INICIAL <= @DT_FINAL
BEGIN
	SELECT 
		@NUM_NOTAS = COUNT(*) FROM [NOTAS FISCAIS]
	WHERE 
		DATA = @DT_INICIAL
	
	BEGIN
		INSERT INTO @REGISTROS_FISCAIS (DATA_VENDA, NOTAS_EMITIDAS) VALUES (@DT_INICIAL, @NUM_NOTAS)
		INSERT INTO #REGISTROS_FISCAIS2 (DATA_VENDA, NOTAS_EMITIDAS) VALUES (@DT_INICIAL, @NUM_NOTAS)
		INSERT INTO ##REGISTROS_FISCAIS3 (DATA_VENDA, NOTAS_EMITIDAS) VALUES (@DT_INICIAL, @NUM_NOTAS)
	END
	
	SELECT @DT_INICIAL = DATEADD(DAY, 1, @DT_INICIAL)
END

SELECT * FROM @REGISTROS_FISCAIS
SELECT * FROM #REGISTROS_FISCAIS2
SELECT * FROM ##REGISTROS_FISCAIS3