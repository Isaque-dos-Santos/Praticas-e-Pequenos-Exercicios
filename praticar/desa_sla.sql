--WITH tb_transacoesf AS (

--SELECT *

--FROM transacoes

--WHERE DescSistemaOrigem = 'twitch'
--AND substr(dtCriacao,1,10) >= '2025-10-01'
--AND substr(dtCriacao,1,10) < '2025-11-01'

--),

--tb_transacoes_produto AS (

--SELECT *

--FROM tb_transacoesf AS t1

--LEFT JOIN transacao_produto AS t2
--ON t1.IdTransacao = t2.IdTransacao

--)

--SELECT DescCategoriaProduto,
       --count(t1.IdTransacao) AS qtdeTransacao

--FROM tb_transacoes_produto AS t1
--LEFT JOIN produtos AS t2
--ON t1.IdProduto = t2.IdProduto

--GROUP BY DescCategoriaProduto

--ORDER BY qtdeTransacao DESC

WITH tb_transacoesf AS (

    SELECT
        IdTransacao
    FROM transacoes
    WHERE DescSistemaOrigem = 'twitch'
      AND substr(DtCriacao, 1, 10) >= '2025-10-01'
      AND substr(DtCriacao, 1, 10) < '2025-11-01'

)

SELECT
    p.DescCategoriaProduto,

    COUNT(DISTINCT t.IdTransacao) AS qtdeTransacao,

    SUM(tp.QtdeProduto) AS qtdeProdutosVendidos,

    SUM(tp.QtdeProduto * tp.vlProduto) AS valorTotal

FROM tb_transacoesf AS t

INNER JOIN transacao_produto AS tp
    ON t.IdTransacao = tp.IdTransacao

INNER JOIN produtos AS p
    ON tp.IdProduto = p.IdProduto

GROUP BY p.DescCategoriaProduto

ORDER BY valorTotal DESC;