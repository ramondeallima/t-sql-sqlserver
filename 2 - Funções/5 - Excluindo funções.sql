-- Caso o bloco seja executado em conjunto, um erro ser� apresentado
-- pois comandos do tipo create function, procedures.. devem ser
-- os primeiros a serem executados. 

IF OBJECT_ID('EnderecoCompleto2', 'FN') IS NOT NULL
DROP FUNCTION [dbo].[EnderecoCompleto2]

CREATE FUNCTION EnderecoCompleto2
(@ENDERECO VARCHAR(100), @CIDADE VARCHAR(50), @ESTADO VARCHAR(50), @CEP VARCHAR(20))	
RETURNS VARCHAR(250)
AS
BEGIN
	DECLARE @ENDERECO_COMPLETO VARCHAR(250)
	SET @ENDERECO_COMPLETO = @ENDERECO + ' - ' + @CIDADE + ' - ' + @ESTADO + ' - ' + @CEP
	RETURN @ENDERECO_COMPLETO
END

-- Comando somente para ilustra��es de outras possibilidades de como excluir,
-- por�m � poss�vel excluir atrav�s da listagem no Object Explorer.
