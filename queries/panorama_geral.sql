/*Pergunta de Negócio: Qual é a modalidade de entrega mais popular da nossa loja e como nossa base está distribuída entre as opções de frete?
Análise da Devolutiva: A base é extremamente equilibrada. Nenhuma modalidade tem mais de 20% de dominância absoluta (cada uma tem entre ~650 e 675 clientes). Não há um gap operacional ou uma sobrecarga em um único canal. */

SELECT 
shipping_type, 
COUNT(customer_id) AS qtd_customer,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM customer
GROUP BY shipping_type
ORDER BY qtd_customer DESC
