WITH tb_transacoes AS (

SELECT *

FROM transacoes

WHERE substr(dtCriacao,1,10) >= '2025-08-25'
AND substr(dtCriacao,1,10) < '2025-08-30'

),

        tb_transacoes_clientes AS (

        SELECT  t1.idCliente,
                substr(t1.dtCriacao,1,10) AS dtDia,
                count(DISTINCT idTransacao) AS qtdTransacoes
        

        FROM tb_transacoes AS t1

        LEFT JOIN clientes AS t2
        ON t1.idCliente = t2.idCliente

        GROUP BY t1.idCliente, dtDia


)

SELECT *,
        sum(qtdTransacoes) OVER (PARTITION BY idCliente ORDER BY dtDia) AS qtdTransacoesCliente
FROM tb_transacoes_clientes