--------------------------------------------------------------
------------------- Exemplo de Funções UDF -------------------
--------------------------------------------------------------

CREATE FUNCTION FaturamentoNota (@NUMERO AS INT) RETURNS FLOAT
AS 
BEGIN
	DECLARE @FATURAMENTO FLOAT
	SELECT 
		@FATURAMENTO = (QUANTIDADE * [PREÇO]) 
	FROM [ITENS NOTAS FISCAIS]
	WHERE 
		NUMERO = @NUMERO
	RETURN @FATURAMENTO
END


SELECT NUMERO, [dbo].[FaturamentoNota](NUMERO) AS FATURAMENTO FROM [NOTAS FISCAIS]


----------------------------------------------------------
------ FUNÇÃO PARA OBTER O NÚMERO DE NOTAS FISCAIS -------
----------------------------------------------------------

CREATE FUNCTION NumeroNotas (@DATA AS DATE) RETURNS INT
AS 
BEGIN
	DECLARE @NUMNOTAS INT
	SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
	WHERE DATA = @DATA
	RETURN @NUMNOTAS
END

SELECT CONVERT(CHAR, DATA, 103),[dbo].[NumeroNotas](DATA)  FROM [NOTAS FISCAIS]
GROUP BY
	DATA
ORDER BY
	DATA