/* Pergunta de Negócio: O nosso volume de vendas por categoria sofre grandes picos de sazonalidade ao longo do ano?
Análise Obtida: A volumetria é linear. Não há flutuações drásticas. A demanda é previsível, o que traz segurança para a cadeia de suprimentos e para o planejamento financeiro. A estratégia deve focar em recorrência (fidelidade) ao invés de grandes picos promocionais*/

SELECT 
    frequency_of_purchases, 
    category,
    COUNT(category) AS qtd_category,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY frequency_of_purchases), 2) AS percentual
FROM customer
GROUP BY frequency_of_purchases, category
ORDER BY frequency_of_purchases, percentual DESC;
