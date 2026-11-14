-- Clientes mais antigos tem mais frequência de transação?

SELECT t1.idCliente,
    CAST(julianday('now') - julianday(substr(t1.DtCriacao, 1,19)) AS INT) AS idadeConta,
    count(t2.IdTransacao) AS totalTransacao


FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.IdCliente = t2.IdCliente

GROUP BY 1

ORDER BY t1.idCliente, idadeConta
 
