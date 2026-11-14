-- Qual o dia da semana mais ativo de cada usuário?

WITH tb_cliente_semana AS (

SELECT IdCliente,
       strftime('%w', substr(DtCriacao,1,10)) AS dtDiaSemana,
       count(DISTINCT idTransacao) AS qtdTransacoes


FROM transacoes

GROUP BY IdCliente, dtDiaSemana

),

tb_rn_cliente_semana AS (

SELECT *,
       CASE 
        WHEN
            dtDiaSemana = '0' THEN 'DOMINGO'
            WHEN dtDiaSemana = '1' THEN 'SEGUNDA-FEIRA'
            WHEN dtDiaSemana = '2' THEN 'TERÇA-FEIRA'
            WHEN dtDiaSemana = '3' THEN 'QUARTA-FEIRA'
            WHEN dtDiaSemana = '4' THEN 'QUINTA-FEIRA'
            WHEN dtDiaSemana = '5' THEN 'SEXTA-FEIRA'
            ELSE 'SABADO'
            END AS diaSemana,
            
            ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdTransacoes DESC) AS rn 
          

FROM tb_cliente_semana

)

SELECT * 

FROM tb_rn_cliente_semana
WHERE rn = 1