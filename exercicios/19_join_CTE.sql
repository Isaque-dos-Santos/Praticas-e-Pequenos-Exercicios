-- Como foi a curva de Churn do curso de SQL?

--SELECT 
       --substr(DtCriacao,1,10) AS dtDia,
       --count(DISTINCT idCliente) AS qtdeClientes
       

--FROM transacoes

--WHERE DtCriacao >= '2025-08-25'
--AND DtCriacao < '2025-08-30'

--GROUP BY dtDia

WITH tb_clientes_d1 AS (

SELECT DISTINCT IdCliente 

FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-26'

),

tb_join AS (

SELECT
       substr(t2.DtCriacao,1,10) AS dtDia,
       count(DISTINCT t1.idCliente) AS qtdeCliente,
       1.* count(DISTINCT t1.idCliente) / (select count(*) from tb_clientes_d1) pctRetencao,
   1 - 1.* count(DISTINCT t1.idCliente) / (select count(*) from tb_clientes_d1) pctChurn

FROM tb_clientes_d1 AS T1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

WHERE t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'

GROUP BY dtDia

)

SELECT * 

FROM tb_join