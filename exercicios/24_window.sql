-- Quantidade de transações acumuladas ao longo do tempo?

WITH tb_transacoes AS (

    SELECT substr(dtCriacao,1,10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdTransacoes
    FROM transacoes



GROUP BY dtDia

),

    tb_transacoes_sum AS (

    SELECT *,
            sum(qtdTransacoes) OVER (ORDER BY dtDia) AS qtdTransacoesAcum
            
    FROM tb_transacoes

),

    tb_rn_sum AS (

    SELECT *,
        ROW_NUMBER() OVER (ORDER BY qtdTransacoesAcum DESC) AS rn

    FROM tb_transacoes_sum

)

SELECT * FROM tb_rn_sum
WHERE rn = 1
