--SELECT t1.idTransacaoProduto,
       --count(t1.IdProduto) AS espadasFlamejantes

--FROM transacao_produto AS t1

--WHERE IdProduto = 21

--GROUP BY t1.idTransacaoProduto

SELECT idTransacaoProduto,
       IdProduto
       

FROM transacao_produto AS t1

WHERE t1.IdProduto IN

(SELECT IdProduto

FROM produtos

WHERE IdProduto = 21)


