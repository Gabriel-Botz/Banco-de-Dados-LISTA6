# 📚 Sistema de Biblioteca - Funções de Agregação e Agrupamento

## 📖 Contextualização

Em um cenário real, sistemas de gerenciamento de bibliotecas são essenciais para organizar e analisar dados relacionados a livros, usuários e empréstimos. Esse tipo de sistema permite não apenas o controle operacional, mas também a extração de informações estratégicas por meio de consultas ao banco de dados.

Neste trabalho, foi utilizado um banco de dados de biblioteca para aplicar funções de agregação e técnicas de agrupamento em SQL. Essas funcionalidades são fundamentais para gerar relatórios, identificar padrões de uso e auxiliar na tomada de decisões, como entender quais gêneros são mais populares ou quais usuários utilizam mais o sistema.

---

## 🎯 Objetivo

Aplicar funções de agregação (`COUNT`, `AVG`, `MIN`, `MAX`) e agrupamento (`GROUP BY`) em consultas SQL, com o intuito de extrair informações relevantes do banco de dados de uma biblioteca.

---

## 🛠️ Tecnologias Utilizadas

* SQL
* PostgreSQL (ou outro SGBD relacional)

---

## 📌 Consultas Desenvolvidas

### 1. Contar quantos livros estão cadastrados

```sql
SELECT COUNT(*) AS total_livros
FROM biblioteca.livro;
```

---

### 2. Calcular a média de tempo de empréstimo dos livros

```sql
SELECT (AVG(data_devolucao - data_emprestimo), 2) AS media_dias_emprestimo
FROM biblioteca.emprestimo
WHERE data_devolucao IS NOT NULL;
```

---

### 3. Encontrar o livro mais antigo e o mais recente

```sql
SELECT 
    MIN(ano_publicacao) AS livro_mais_antigo,
    MAX(ano_publicacao) AS livro_mais_recente
FROM biblioteca.livro;
```

---

### 4. Listar quantos empréstimos cada usuário realizou

```sql
SELECT 
    u.nome,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM biblioteca.usuario u
LEFT JOIN biblioteca.emprestimo e
       ON u.id_usuario = e.id_usuario
GROUP BY u.nome
ORDER BY total_emprestimos DESC;
```

---

### 5. Mostrar quantos livros existem por gênero

```sql
SELECT 
    genero,
    COUNT(*) AS total_livros
FROM biblioteca.livro
GROUP BY genero
ORDER BY total_livros DESC;
```

---

## 📊 Resultados Esperados

As consultas desenvolvidas permitem:

* Identificar a quantidade total de livros cadastrados;
* Calcular o tempo médio de empréstimos;
* Verificar a antiguidade do acervo;
* Analisar o comportamento dos usuários;
* Entender a distribuição dos livros por gênero.

Essas informações são importantes para melhorar a gestão da biblioteca e otimizar seus serviços.

---

## ✅ Conclusão

A utilização de funções de agregação e agrupamento em SQL é fundamental para transformar dados brutos em informações úteis. Neste trabalho, foi possível aplicar esses conceitos em um contexto prático de biblioteca, permitindo análises relevantes sobre livros e usuários.

Além disso, esse tipo de consulta é amplamente utilizado no mercado de tecnologia, especialmente em sistemas que necessitam de relatórios e análises de dados. Dessa forma, o exercício contribui diretamente para o desenvolvimento de habilidades essenciais na área de banco de dados.

---

## 📎 Observação

Os resultados das consultas podem variar de acordo com os dados inseridos no banco.

