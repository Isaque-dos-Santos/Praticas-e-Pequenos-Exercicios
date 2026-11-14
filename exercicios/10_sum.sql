SELECT IdTransacao,
        SUM(QtdePontos),
        SUM(CASE
            WHEN QtdePontos > 0 THEN QtdePontos
        END) AS QtdePontosPositivos,
        
        (CASE WHEN QtdePontos < 0 THEN QtdePontos
        END) AS QtdePontosNegativos

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
AND QtdePontos > 0

ORDER BY QtdePontos