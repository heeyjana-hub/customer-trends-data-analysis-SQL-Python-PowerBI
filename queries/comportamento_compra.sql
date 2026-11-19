/* Pergunta de Negócio: "O tipo de frete que o cliente escolhe muda o tipo de produto que ele compra?
 Análise Obtida: O mix de produtos é altamente resiliente. Clothing (Roupas) representa quase 45% das compras em todos os fretes, seguido por Accessories (Acessórios) com ~32%. O tipo de frete NÃO altera o padrão de consumo. A empresa pode padronizar a separação de estoque: roupas e acessórios são sempre a prioridade máxima, independente do frete.*/

SELECT 
    shipping_type, 
    category, 
    COUNT(*) AS qtd,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY shipping_type), 2) AS percentual_category
FROM customer
GROUP BY shipping_type, category
ORDER BY shipping_type, percentual_category DESC;
