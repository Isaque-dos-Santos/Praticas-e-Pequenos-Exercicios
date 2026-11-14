WITH tb_sumario_dias AS (

SELECT substr(dtCriacao,1,10) AS dtDia,
       count(DISTINCT idTransacao) AS qtdTransacoes

FROM transacoes

WHERE dtCriacao >= '2025-08-25'
AND dtCriacao < '2025-08-30'

GROUP BY dtDia

)

SELECT *,
        sum(qtdTransacoes) OVER (ORDER BY dtDia) AS qtdTransacoesAcum
FROM tb_sumario_dias