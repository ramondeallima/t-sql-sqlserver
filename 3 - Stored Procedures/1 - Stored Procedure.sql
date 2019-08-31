CREATE PROCEDURE BuscaPorEntidades @ENTIDADE AS VARCHAR(10)
AS
BEGIN
IF @ENTIDADE = 'CLIENTES'
	SELECT [CPF] AS IDENTIFICADOR, [NOME] AS DESCRITOR,
	[BAIRRO] AS BAIRRO FROM [TABELA DE CLIENTES]
ELSE IF @ENTIDADE = 'VENDEDORES'
	SELECT [CPF] AS IDENTIFICADOR, [NOME] AS DESCRITOR,
	[BAIRRO] AS BAIRRO FROM [TABELA DE CLIENTES]
END

EXEC BuscaPorEntidades @ENTIDADE = 'CLIENTES'