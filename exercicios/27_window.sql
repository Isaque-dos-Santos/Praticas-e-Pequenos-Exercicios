-- Saldo de pontos acumulados por usuário

WITH tb_qtd_pontos AS (

SELECT idCliente,
       substr(dtCriacao,1,10) AS dtDia,
       sum(qtdePontos) AS qtdPontosAcum,
       sum(CASE WHEN qtdePontos > 0 THEN qtdePontos ELSE 0 END) AS qtdePontosPos

FROM transacoes

GROUP BY idCliente, dtDia

)

SELECT *,
       sum(qtdPontosAcum) OVER (PARTITION BY idCliente ORDER BY dtDia) AS saldoPontosAcum,
       sum(qtdePontosPos) OVER (PARTITION BY idCliente ORDER BY dtDia) AS saldoPontosPos
FROM tb_qtd_pontos