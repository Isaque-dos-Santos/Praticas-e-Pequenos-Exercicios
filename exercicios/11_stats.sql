SELECT ROUND(AVG(qtdePontos),2) AS mediaCarteira,
        1. * SUM(qtdePontos) / count(qtdePontos) AS mediaCarteiraRoot,
            min(qtdePontos) AS minCarteira,
            max(qtdePontos) AS maxCarteira,
            sum(flTwitch)
FROM clientes