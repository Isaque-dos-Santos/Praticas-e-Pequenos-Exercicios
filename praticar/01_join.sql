-- QUAL CATEGORIA TEM MAIS PRODUTOS VENDIDOS?

SELECT 
        p.DescCategoriaProduto,
        count(DISTINCT tp.IdTransacao) AS QtdeTransacao
        

FROM transacao_produto AS tp

LEFT JOIN produtos AS p
ON tp.IdProduto = p.IdProduto

GROUP BY p.DescCategoriaProduto
ORDER BY QtdeTransacao DESC


