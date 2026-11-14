-- Qual o valor médio de pontos positivos por dia?

SELECT sum(qtdePontos) AS TotalPontos,
        
        --count(substr(DtCriacao,1,10)) AS QtdeDiasRepetidos,
        
        count(DISTINCT substr(DtCriacao,1,10)) AS QtdeDiasUnicos,

        sum(qtdePontos) / count(DISTINCT substr(DtCriacao,1,10)) AS avgPontosDia

FROM transacoes

WHERE qtdePontos > 0