-------------------------------------------------------
-- Declarando variáveis e atribuindo de forma manual --
-------------------------------------------------------
DECLARE @IDADE INT, @NOME VARCHAR(200), @DATA DATE

SET @IDADE = 20
SET @NOME = 'JOÃO DA SILVA'
SET @DATA = '20180517'

DECLARE @CPF VARCHAR(12)
SET @CPF = '1471156710'
-------------------------------------------------------
----  Selecionando registros utilizando variável ------
-------------------------------------------------------
SELECT NOME, 
	   [DATA DE NASCIMENTO] 
FROM [TABELA DE CLIENTES]
WHERE
	CPF = @CPF
-------------------------------------------------------
----- Atribuindo valores às variáveis com select ------
-------------------------------------------------------
DECLARE @IDADE2 INT, @NOME2 VARCHAR(200), @DATA2 DATE

SELECT @NOME2 = NOME, @DATA2 = [DATA DE NASCIMENTO], @IDADE2 = IDADE FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF

PRINT @NOME2
PRINT @DATA2
PRINT @IDADE2