/* Pergunta de Negócio: Os clientes que usam o frete mais caro compensam o custo logístico gastando mais (maior ticket médio) ou estão gastando menos e ainda exigindo desconto?
Análise obtida: Problema confirmado. O Next Day Air não se paga. Ele tem a maior taxa de uso de cupom (45,52%) e, ao mesmo tempo, o **segundo pior ticket médio da base (R58,63)*/

SELECT 
    shipping_type, 
    COUNT(customer_id) AS qtd_customers,
    SUM(purchase_amount_usd) AS total_ticket,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_ticket,
    ROUND(SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS t_u_discount
FROM customer
GROUP BY shipping_type
ORDER BY avg_ticket DESC;
