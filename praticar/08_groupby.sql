-- Qual o produto com mais pontos transacionado?

SELECT IdProduto,
        SUM(vlProduto * QtdeProduto) AS SumPontosProduto,
        SUM(QtdeProduto) AS QtdeVendas


FROM transacao_produto

GROUP BY 1
ORDER BY 2 DESC