WITH tb_cliente_dia AS (

SELECT idCliente,
       substr(dtCriacao,1,10) AS dtDia,
       count(DISTINCT idTransacao) AS qtdTransacoes 

FROM transacoes

WHERE dtCriacao >= '2025-08-25'
AND dtCriacao < '2025-08-30'

GROUP BY idCliente, dtDia

),

tb_lag AS (

SELECT *,
        sum(qtdTransacoes) OVER (PARTITION BY idCliente ORDER BY dtDia) AS acum,
        lag(qtdTransacoes) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacoes

FROM tb_cliente_dia

)

SELECT *,
          1. * qtdTransacoes / lagTransacoes AS percTransacoes

FROM tb_lag