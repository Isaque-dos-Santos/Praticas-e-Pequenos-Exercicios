-- Intervalos
-- De 0 a 500       -> Recruta
-- De 501 a 1000    -> Irmão Juramentado
-- De 1001 a 5000   -> Mestre
-- De 5001 a 10000  -> Oficial Superior
-- +10001           -> Lorde Comandante

SELECT 
    idCliente, qtdePontos,
    CASE
        WHEN qtdePontos <= 500 THEN 'Recruta'
        WHEN qtdePontos <= 1000 THEN 'Irmão Juramentado'
        WHEN qtdePontos <= 5000 THEN 'Mestre'
        WHEN qtdePontos <= 10000 THEN 'Oficial Superior'
        ELSE 'Lorde Comandante'
    END AS Patente,

    CASE 
        WHEN qtdePontos <= 500 THEN 1
        ELSE 0
    END AS flRecruta,

    CASE 
        WHEN qtdePontos >= 10001 THEN 1
        ELSE 0
    END AS flLordeComandante

FROM clientes

WHERE flLordeComandante = 1

ORDER BY qtdePontos DESC