---------------------------------------------------------
--------- EXEMPLO DE USO DE CONTROLE DE FLUXO -----------
---------------------------------------------------------

-- "OBJECT_ID" VERIFICA A EXISTENCIA DE ALGUM OBJETO,
-- O PRIMEIRO PARÂMETRO É O NOME, O SEGUNDO O TIPO.

IF OBJECT_ID('TABELA_TESTE', 'U') IS NOT NULL DROP TABLE TABELA_TESTE
	CREATE TABLE TABELA_TESTE (ID VARCHAR(10))
----------------------------------------------------------

-- UTILIZANDO SELECT NA COMPARAÇÃO

DECLARE @LIMITE_MAXIMO FLOAT, @LIMITE_ATUAL FLOAT
DECLARE @BAIRRO VARCHAR(20)

SET @BAIRRO = 'Jardins'
SET @LIMITE_MAXIMO = '500000'

IF @LIMITE_MAXIMO <= (SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins')
BEGIN
	PRINT 'Valor estourou. Não é possível abrir novos créditos'
END
ELSE
BEGIN
	PRINT 'Valor não estourou. É possível abrir novos créditos'
END
---------------------------------------------------------------------