/* ListarComissoesVendedores.sql

SCRIPT PARA DA PROCEDURE ListarComissoesVendedores.
Deve ser executado após a criação das tabelas.

*/

USE DBCONCESSIONARIA
GO

CREATE OR ALTER PROCEDURE ListarComissoesVendedores
AS
	DECLARE @Comissoes AS TABLE
	(IdVenda INT, Vendedor VARCHAR(200), QtdVales INT, ValorVenda NUMERIC(10, 2), Desconto NUMERIC(10, 2), Comissao NUMERIC(10, 2))

	INSERT INTO @Comissoes
		(IdVenda, Vendedor, QtdVales, ValorVenda, Desconto, Comissao)
	SELECT
		VND002_VENDA.IdeVenda,
		VND001_VENDEDOR.NmeVendedor,
		CAST(VND002_VENDA.StaValeCombustivel AS INT) AS Vale,
		VND002_VENDA.VlrPrecoVenda, 
		CASE WHEN VND002_VENDA.StaValeCombustivel = 0 THEN 0 WHEN VEI004_MODELO_VERSAO.IdeCombustivel = 1 THEN 200 WHEN VEI004_MODELO_VERSAO.IdeCombustivel = 2 THEN 180 ELSE 150 END AS Desconto,
		VND002_VENDA.VlrPrecoVenda * 0.01 AS Comissao

	FROM VND002_VENDA INNER JOIN
		VND001_VENDEDOR ON VND002_VENDA.IdeVendedor = VND001_VENDEDOR.IdeVendedor INNER JOIN
		VEI004_MODELO_VERSAO ON VND002_VENDA.IdeModeloVersao = VEI004_MODELO_VERSAO.IdeModeloVersao INNER JOIN
		VEI003_COMBUSTIVEL ON VEI004_MODELO_VERSAO.IdeCombustivel = VEI003_COMBUSTIVEL.IdeCombustivel;

	UPDATE @Comissoes
	SET Desconto = 0
	WHERE Comissao - Desconto < 0;

	SELECT
		Vendedor,
		COUNT(IdVenda) AS QuantidadeVendas,	
		SUM(QtdVales) AS QuantidadeVales,
		SUM(ValorVenda) AS TotalVendas,
		--SUM(Desconto) AS TotalDescontos,
		--SUM(Comissao) AS TotalComissao,
		SUM(Comissao) - SUM(Desconto) AS TotalFinalComissao
	FROM @Comissoes
	GROUP BY Vendedor;

GO
--EXEC ListarComissoesVendedores