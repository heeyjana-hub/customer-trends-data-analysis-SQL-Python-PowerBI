/* Pergunta de Negócio: Qual modalidade de entrega possui a maior dependência de cupons de desconto?
Análise Obtida: O Next Day Air é o grande alerta, com 45,52% dos pedidos usando cupom. Isto é, o frete mais caro e urgente da operação é o que mais exige que o produto seja subsidiado por um desconto. Em contrapartida, o 2-Day Shipping tem a menor dependência (40,67%).*/

SELECT 
    shipping_type, 
    discount_applied, 
    COUNT(discount_applied) AS qtd,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY shipping_type), 2) AS t_percentual
FROM customer
GROUP BY  shipping_type, discount_applied
ORDER BY  shipping_type, qtd DESC;
