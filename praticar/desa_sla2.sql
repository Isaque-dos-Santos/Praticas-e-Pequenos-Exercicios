WITH tb_transacoesDia AS (

SELECT *,
    count(DISTINCT IdTransacao) as TotalTransacoes,
    sum(qtdePontos) as TotalPontos,
    dtCriacao as dtDia
    
FROM transacoes

WHERE substr(dtCriacao,1,10) >= '2025-01-01'
AND substr(dtCriacao,1,10) < '2026-01-01'

GROUP BY dtDia

),

tb_meses AS (

SELECT *,
    CASE WHEN substr(dtDia,6,2) = '01' THEN 'Janeiro'
        WHEN substr(dtDia,6,2) = '02' THEN 'Fevereiro'
        WHEN substr(dtDia,6,2) = '03' THEN 'Março'
        WHEN substr(dtDia,6,2) = '04' THEN 'Abril'
        WHEN substr(dtDia,6,2) = '05' THEN 'Maio'
        WHEN substr(dtDia,6,2) = '06' THEN 'Junho'
        WHEN substr(dtDia,6,2) = '07' THEN 'Julho'
        WHEN substr(dtDia,6,2) = '08' THEN 'Agosto'
        WHEN substr(dtDia,6,2) = '09' THEN 'Setembro'
        WHEN substr(dtDia,6,2) = '10' THEN 'Outubro'
        WHEN substr(dtDia,6,2) = '11' THEN 'Novembro'
        WHEN substr(dtDia,6,2) = '12' THEN 'Dezembro'
END AS NomeMes

FROM tb_transacoesDia

),

tb_sumario_meses AS (

SELECT *,
    sum(TotalTransacoes) OVER (PARTITION BY NomeMes ORDER BY dtDia) AS TotalTransacoesAcumuladas,
    sum(TotalPontos) OVER (PARTITION BY NomeMes ORDER BY dtDia) AS TotalPontosAcumulados

FROM tb_meses

),

tb_rn AS (

SELECT dtDia,
       NomeMes,
       TotalTransacoesAcumuladas,
       TotalPontosAcumulados,
    ROW_NUMBER() OVER (PARTITION BY NomeMes ORDER BY dtDia DESC) AS RowNum

FROM tb_sumario_meses

)

SELECT *,
ROUND(
    TotalPontosAcumulados * 1.0 / TotalTransacoesAcumuladas,
    2
) AS Media
FROM tb_rn
WHERE RowNum = 1
GROUP BY dtDia
ORDER BY dtDia