--Qual cliente ganhou mais pontos positivos em 2025-05?

SELECT idCliente,
        sum(qtdePontos) AS totalpontos,
        DtCriacao

FROM clientes

    WHERE DtCriacao >= '2025-05-01'
    AND DtCriacao < '2025-06-01'
    AND QtdePontos > 0

GROUP BY qtdePontos

ORDER BY sum(qtdePontos) DESC

LIMIT 1

