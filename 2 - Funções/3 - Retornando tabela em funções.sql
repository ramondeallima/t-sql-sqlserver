
--------------------------------------------------------------------------
-------------------------- EXEMPLO PRÁTICO -------------------------------
--------------------------------------------------------------------------

-- RETORNANDO ATRAVÉS DE UMA FUNÇÃO O MESMO
-- RESULTADO DA QUERY ABAIXO.

SELECT * FROM [NOTAS FISCAIS]
WHERE CPF = '1471156710'


CREATE FUNCTION ListaNotasCliente(@CPF AS VARCHAR(12)) RETURNS TABLE
AS
RETURN SELECT * FROM [NOTAS FISCAIS] WHERE CPF = @CPF

SELECT * FROM [dbo].[ListaNotasCliente]('1471156710')
---------------------------------------------------------------------------
-- UTILIZANDO DUAS FUNÇÕES CRIADAS PARA RETORNAR
-- O NÚMERO TOTAL DE NOTAS GERADAS POR CLIENTE E
-- O TOTAL DE FATURAMENTO
SELECT
	A.CPF, A.NUM_NOTA,
	B.TOTAL_FATURAMENTO 
FROM
	(SELECT CPF, (SELECT COUNT(*) FROM [dbo].[ListaNotasCliente](CPF)) AS NUM_NOTA
	FROM [TABELA DE CLIENTES]) A
INNER JOIN
	(SELECT CPF, SUM([dbo].[FaturamentoNota](NUMERO)) AS TOTAL_FATURAMENTO
	FROM [NOTAS FISCAIS] GROUP BY CPF) B
ON A.CPF = B.CPF

--------------------------------------------------------------------------
-------------------------- EXERCÍCIO -------------------------------------
--------------------------------------------------------------------------

CREATE FUNCTION FuncTabelaNotas 
	(
		@DATA_INI AS DATE, 
		@DATA_FIN AS DATE
	 ) RETURNS TABLE
RETURN SELECT DISTINCT DATA, [dbo].[NUMERONOTAS](DATA) AS NUMERO 
	   FROM [NOTAS FISCAIS] WHERE DATA >= @DATA_INI AND DATA <= @DATA_FIN


SELECT * FROM [dbo].[FuncTabelaNotas]('20170101', '20170110')