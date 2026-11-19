# Análise de Comportamento do Consumidor — Queries SQL Autorais

Projeto de análise de dados de varejo usando a base **Customer Shopping Behavior**, com foco em **logística, sensibilidade a desconto, mix de produtos e sazonalidade**. 
As queries SQL deste repositório foram escritas por mim para responder a perguntas de negócio específicas, usando o dataset público disponibilizado por Amlan Mohanty.

## 📊 Sobre a Base de Dados
- **Nome:** Customer Shopping Behavior
- **Fonte original:** [amlanmohanty1/customer-trends-data-analysis-SQL-Python-PowerBI](https://github.com/amlanmohanty1/customer-trends-data-analysis-SQL-Python-PowerBI)
- **Arquivo:** `customer_shopping_behavior.csv` (disponível no repositório original)

> ⚠️ **Nota de atribuição:** O dataset **não é de minha autoria**. Ele foi disponibilizado publicamente no repositório do Amlan Mohanty. Este projeto é uma **reinterpretação analítica autoral**: utilizei o mesmo CSV, mantive os nomes originais das colunas para facilitar a reprodução, mas escrevi **minhas próprias queries SQL** para responder às perguntas de negócio que defini.

## 🧠 Perguntas de Negócio e Queries

| # | Arquivo | Pergunta de Negócio | O que a query faz |
|---|---------|---------------------|-------------------|
| Q1 | `queries/panorama_geral.sql` | Qual é a modalidade de entrega mais popular e como a base está distribuída entre os fretes? | Conta clientes por modalidade e calcula o percentual sobre o total |
| Q2 | `queries/comportamento_compra.sql` | O tipo de frete muda o tipo de produto comprado? | Cruza categoria × tipo de envio e calcula o percentual de cada categoria dentro de cada frete |
| Q3 | `queries/sensibilidade_desconto.sql` | Qual modalidade de entrega tem a maior dependência de cupons? | Calcula a taxa de uso de desconto (Yes/No) por tipo de envio |
| Q4 | `queries/impacto_financeiro.sql` | Os clientes do frete mais caro compensam com ticket maior ou gastam menos e ainda pedem desconto? | Cruza volume, faturamento, ticket médio e taxa de desconto por modalidade |
| Q5 | `queries/sazonalidade.sql` | O volume de vendas por categoria sofre grandes picos de sazonalidade? | Distribui a frequência de compra por categoria e período |

## 📈 Principais Insights

### 1. Panorama geral — equilíbrio logístico
A base é **extremamente equilibrada**: nenhuma modalidade de envio concentra mais de 20% dos clientes (cada uma tem entre ~650 e 675 clientes). O Free Shipping lidera (17,31%), mas não há sobrecarga em um único canal logístico — a operação tem diversidade saudável e o cliente tem liberdade de escolha.

### 2. Comportamento de compra — mix resiliente
O mix de produtos é **estável em todos os fretes**: Clothing (Roupas) representa quase **45%** das compras em todas as modalidades, seguido por Accessories (Acessórios) com **~32%**. 
**Implicação:** o tipo de frete **não altera** o padrão de consumo. A empresa pode padronizar a separação de estoque — roupas e acessórios são sempre prioridade, independentemente do frete.

### 3. Sensibilidade ao desconto — alerta no Next Day Air
O **Next Day Air** é o grande ponto de atenção: **45,52%** dos pedidos usam cupom de desconto — a maior taxa entre todas as modalidades. 
Em contrapartida, o **2-Day Shipping** tem a menor dependência (**40,67%**). 
**Implicação:** o frete mais caro e urgente é o que mais exige subsídio via desconto, o que pode corroer a margem.

### 4. Impacto financeiro — problema confirmado
O **Next Day Air não se paga**: tem a maior taxa de uso de cupom (45,52%) e, ao mesmo tempo, o **segundo pior ticket médio da base (R$ 58,63)**. 
Ou seja, estamos subsidiando o frete mais caro para compras de baixo valor — um alerta crítico de margem.

### 5. Sazonalidade — demanda linear
A volumetria é **linear**: não há flutuações drásticas na frequência de compra por categoria. 
**Implicação:** a demanda é previsível, o que permite fluxo contínuo (Just in Time), reduz custos de estocagem e dispensa grandes liquidações. A estratégia deve focar em **recorrência e fidelidade**, não em picos promocionais.

## 🔧 Como reproduzir
1. Baixe o arquivo `customer_shopping_behavior.csv` no [repositório original](https://github.com/amlanmohanty1/customer-trends-data-analysis-SQL-Python-PowerBI).
2. Abra o seu banco de dados SQLite (usando uma ferramenta como DBeaver, DB Browser for SQLite ou a extensão SQLite do VS Code).
3. Importe o arquivo CSV para criar a tabela `customer` (certifique-se de que o cabeçalho do CSV seja lido como o nome das colunas).
4. Execute as queries da pasta `queries/` para reproduzir os insights.

## 🛠️ Tecnologias
- **SQL** (SQLite)

## 🙏 Créditos e Atribuição
- **Base de dados e projeto de referência:** [Amlan Mohanty](https://github.com/amlanmohanty1/customer-trends-data-analysis-SQL-Python-PowerBI).
- **Queries SQL deste repositório:** escritas por mim, com base nas perguntas de negócio que defini.
