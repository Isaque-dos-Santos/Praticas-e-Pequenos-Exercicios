-- CTE: COMMUN TABLE EXPRESSION

--SELECT count(DISTINCT t1.idCliente)

--FROM transacoes AS t1

--WHERE t1.idCliente IN

    --(SELECT DISTINCT idCliente

    --FROM transacoes

    --WHERE substr(DtCriacao,1,10) = '2025-08-25')

--AND substr(t1.DtCriacao,1,10) = '2025-08-29'


--SELECT  DISTINCT t2.idCliente,
       --t1.DtCriacao

--FROM transacoes AS t1

--LEFT JOIN clientes AS  t2
--ON t1.IdCliente = t2.IdCliente 

--WHERE substr(t1.DtCriacao,1,10) = '2025-08-25' 

--GROUP BY t2.idCliente

WITH tb_cliente_primeiro_dia AS (
    
    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-25'

),

tb_cliente_ultimo_dia AS (
    
    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-29'

),

tb_join AS (

SELECT t1.idCliente AS primCliente,
       t2.idCliente AS ultCliente

    FROM tb_cliente_primeiro_dia AS t1
    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.idCliente = t2.idCliente

)

SELECT count(primCliente),
       count(ultCliente),
       1. * count(primCliente) / count(ultCliente) AS proporacao

FROM tb_join



