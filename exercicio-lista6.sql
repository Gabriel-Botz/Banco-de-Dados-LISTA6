# 📚 Sistema de Biblioteca - Índices, Views e Performance

## 📖 Contextualização

Em bancos de dados relacionais, a performance das consultas é um fator essencial, principalmente em sistemas que manipulam grandes volumes de informações, como uma biblioteca. Para melhorar essa eficiência, utilizam-se recursos como índices e views, que ajudam tanto na velocidade de acesso aos dados quanto na organização das consultas.

Neste exercício, foram aplicadas técnicas de otimização por meio da criação de índices e também a construção de uma view para facilitar a visualização do histórico de empréstimos. Além disso, foi realizada uma análise prática da performance das consultas utilizando o comando `EXPLAIN ANALYZE`.

---

## 🎯 Objetivo

* Criar índices para otimizar buscas no banco de dados;
* Desenvolver uma view para visualização de dados;
* Entender o funcionamento dos índices;
* Analisar a performance de consultas com e sem índices.

---

## 🛠️ Tecnologias Utilizadas

* SQL
* PostgreSQL (ou outro SGBD relacional)

---

## 📌 Atividades Desenvolvidas

### 1. Índice para busca por título de livro

```sql
CREATE INDEX idx_livro_titulo
ON biblioteca.livro(titulo);
```

---

### 2. Índice para otimizar buscas por data de empréstimo

```sql
CREATE INDEX idx_emprestimo_data
ON biblioteca.emprestimo(data_emprestimo);
```

---

### 3. Criação da VIEW de histórico de empréstimos

```sql
CREATE VIEW biblioteca.vw_historico_emprestimos AS
SELECT 
    u.nome AS nome_usuario,
    l.titulo AS titulo_livro,
    e.data_emprestimo,
    e.data_devolucao
FROM biblioteca.emprestimo e
JOIN biblioteca.usuario u 
     ON e.id_usuario = u.id_usuario
JOIN biblioteca.livro l 
     ON e.id_livro = l.id_livro;
```

Consulta da view:

```sql
SELECT * FROM biblioteca.vw_historico_emprestimos;
```

---

### 4. Explicação sobre índices

Os índices são estruturas que permitem ao banco de dados localizar informações de forma mais rápida, funcionando de maneira semelhante ao índice de um livro.

* **Sem índice:** o banco realiza uma varredura completa na tabela (FULL SCAN), analisando todas as linhas, o que pode ser lento.
* **Com índice:** o banco acessa diretamente os dados desejados, tornando a consulta muito mais eficiente.

#### ⚠️ Impactos negativos do uso excessivo de índices:

* Maior consumo de espaço em disco;
* Redução na performance de operações de escrita (`INSERT`, `UPDATE`, `DELETE`);
* Maior custo de manutenção dos dados pelo SGBD.

---

### 5. Teste de performance com EXPLAIN ANALYZE

#### 🔴 Consulta sem índice

```sql
DROP INDEX IF EXISTS biblioteca.idx_livro_titulo;

EXPLAIN ANALYZE
SELECT *
FROM biblioteca.livro
WHERE titulo = 'A Sombra do Amanhã';
```

---

#### 🟢 Consulta com índice

```sql
CREATE INDEX idx_livro_titulo
ON biblioteca.livro(titulo);

ANALYZE biblioteca.livro;

EXPLAIN ANALYZE
SELECT *
FROM biblioteca.livro
WHERE titulo = 'A Sombra do Amanhã';
```

---

## 📊 Resultados Esperados

Com a aplicação dos índices, espera-se:

* Melhora significativa no tempo de resposta das consultas;
* Redução do custo de busca em tabelas grandes;
* Facilidade na visualização de dados com a utilização da view.

---

## ✅ Conclusão

A criação de índices e views é uma prática fundamental para otimizar o desempenho e a organização de bancos de dados. Neste exercício, foi possível compreender como os índices influenciam diretamente na velocidade das consultas e como as views facilitam o acesso a informações estruturadas.

Além disso, a análise com `EXPLAIN ANALYZE` permitiu observar na prática a diferença de performance, reforçando a importância dessas técnicas no desenvolvimento de sistemas eficientes e escaláveis.

---

## 📎 Observação

Os resultados podem variar de acordo com a quantidade de dados armazenados e a configuração do ambiente de execução.
