--======================================================================
--===========================LISTA 2====================================
--======================================================================

--1. Crie um banco de dados chamado biblioteca. 

--CREATE DATABASE minhaBiblioteca
--CREATE SCHEMA biblioteca


--2. Crie uma tabela livro com os seguintes campos: 

CREATE TABLE biblioteca.livro(
	id_livro SERIAL PRIMARY KEY,
	titulo varchar (40) NOT NULL,
	autor varchar (40) NOT NULL,
	ano_publicacao int NOT NULL,
	genero varchar(20) NOT NULL,
	quantidade_estoque int NOT NULL
);

-- 3. Crie uma tabela usuario com os campos: 

CREATE TABLE biblioteca.usuario(
	id_usuario SERIAL PRIMARY KEY,
	nome varchar (40) NOT NULL,
	cpf varchar (15) UNIQUE,
	email varchar (40) UNIQUE,
	telefone varchar(20) NOT NULL,
	endereco varchar (40) NOT NULL	
);




 --4. Crie uma tabela emprestimo com os seguintes campos: 

CREATE TYPE status_pedido AS ENUM ('emprestado', 'devolvido')
CREATE TABLE biblioteca.emprestimo(
	id_emprestimo SERIAL PRIMARY KEY,
	id_usuario int REFERENCES biblioteca.usuario(id_usuario),
	id_livro int REFERENCES biblioteca.livro(id_livro),
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	status status_pedido	 	
);

--5. Escreva um comando SQL para alterar a tabela livro, adicionando um campo editora
--VARCHAR(100).
		
	ALTER TABLE biblioteca.livro 
	ADD COLUMN editora varchar(100);

--======================================================================
--===========================LISTA 3====================================
--======================================================================

--1. Insira 10 registros na tabela livro com informações fictícias.

	INSERT INTO biblioteca.livro (titulo, autor, ano_publicacao, genero, quantidade_estoque, editora)
	VALUES ('A Sombra do Amanhã', 'Lucas Andrade', 2018, 'Ficção', 5, 'Nova Era'),
		   ('Código Invisível', 'Mariana Silva', 2021, 'Tecnologia', 8, 'TechBooks'),
		   ('O Último Horizonte', 'Rafael Costa', 2015, 'Aventura', 3, 'Mundo Livre'),
		   ('Entre Linhas e Segredos', 'Fernanda Rocha', 2019, 'Romance', 6, 'Coração Literário'),
		   ('A Fórmula do Caos', 'Bruno Martins', 2020, 'Suspense', 4, 'Mistério Editora'),
		   ('Ecos do Passado', 'Juliana Alves', 2017, 'Drama', 7, 'Memória Viva' ),
		   ('Além do Código', 'Gabriel Souza', 2022, 'Tecnologia', 9, 'DevBooks'),
		   ('A Cidade Perdida', 'Ricardo Nunes', 2016, 'Aventura', 2, 'Explorar'),
		   ('Segredos da Mente', 'Patrícia Lima', 2014, 'Psicologia', 5, 'Saber'),
		   ('O Despertar Final', 'André Ferreira', 2023, 'Ficção', 10, 'Futuro');


--2. Insira 5 registros na tabela usuario com diferentes usuários. 

INSERT INTO biblioteca.usuario (nome, cpf, email, telefone, endereco)
	VALUES ('Gabriel Botelho', '111.111.111-11', 'email@1.com', '(11)1111-1112', 'rua 1'),
		   ('João Pedro Pires', '111.111.111-12', 'email@2.com', '(11)1111-1113', 'rua 2'),
		   ('Emanuel Ribeiro', '111.111.111-13', 'email@3.com', '(11)1111-1114', 'rua 3'),
		   ('Jonathan Carvalho', '111.111.111-14', 'email@4.com', '(11)1111-1115', 'rua 4'),
		   ('Eduardo Motta', '111.111.111-15', 'email@5.com', '(11)1111-1116', 'rua 5'),
		   ('Eduarda Mello', '111.111.111-16', 'email@6.com', '(11)1111-1117', 'rua 6'),
		   ('Carlos Carvalho', '111.111.111-17', 'email@7.com', '(11)1111-1118', 'rua 7'),
		   ('Gabriela Mesquita', '111.111.111-18', 'email@8.com', '(11)1111-1119', 'rua 8'),
		   ('Sabrina Louro', '111.111.111-19', 'email@9.com', '(11)1111-1111', 'rua 9'),
		   ('Guilherme Louro', '111.111.111-10', 'email@10.com', '(11)1111-1110', 'rua 10');
	
--3. Atualize o telefone de um usuário específico usando o comando UPDATE. 

	INSERT INTO biblioteca.emprestimo (id_livro, id_usuario, data_emprestimo, data_devolucao, status)
	VALUES (1, 1, '2026-03-12', '2026-03-22', 'emprestado'),
		   (2, 1, '2026-02-15', '2026-04-02', 'devolvido'),
		   (5, 2, '2026-01-05', '2026-04-05', 'emprestado'),
		   (4, 2, '2026-01-05', '2026-04-06', 'emprestado'),
		   (10, 3, '2026-01-05', '2026-04-07', 'emprestado'),
		   (9, 3, '2026-01-05', '2026-04-08', 'devolvido'),
		   (6, 4, '2026-01-05', '2026-04-09', 'emprestado'),
		   (7, 4, '2026-01-05', '2026-04-10', 'devolvido'),
		   (6, 4, '2026-01-05', '2026-04-11', 'emprestado'),
		   (8, 5, '2026-01-05', '2026-04-12', 'devolvido');


--4. Tente remover um usuário específico da tabela usuario que possui um empréstimo. O que
--aconteceu? Explique o que ocorreu? 

	DELETE FROM biblioteca.usuario
	WHERE id_usuario = 2;

--5. (DESAFIO) Explique a diferença entre DELETE FROM e TRUNCATE TABLE. Em qual situação
--cada um deve ser utilizado?

/*  Ocorreu um erro ao tentar deletar o usuário, O DELETE FROM deve ser utilizado quando há necessidade de excluir registros 
	específicos da tabela, permitindo o uso de condições. Já o TRUNCATE TABLE é mais 
	indicado quando se deseja apagar todos os dados de forma rápida e eficiente, 
	especialmente em tabelas grandes, pois realiza a remoção de forma mais performática. */

--======================================================================
--===========================LISTA 4====================================
--======================================================================

--1. Selecione todos os livros cadastrados no banco de dados. 

		
SELECT titulo AS Livros_Cadastrados FROM biblioteca.livro 
	
	
--2. Liste o nome do usuário e o título do livro de todos os empréstimos realizados, utilizando um
--JOIN. 


SELECT
	   biblioteca.usuario.nome,
	   biblioteca.livro.titulo   
  FROM biblioteca.emprestimo
  JOIN biblioteca.usuario
  	   ON biblioteca.emprestimo.id_usuario = biblioteca.usuario.id_usuario
  JOIN biblioteca.livro
  	   ON biblioteca.emprestimo.id_livro = biblioteca.livro.id_livro;


--3. Selecione todos os empréstimos que ainda não foram devolvidos (status = 'emprestado'). 

 
SELECT
	   biblioteca.usuario.nome,
	   biblioteca.livro.titulo,
	   biblioteca.emprestimo.status
  FROM biblioteca.emprestimo
  
  JOIN biblioteca.usuario
  	   ON biblioteca.emprestimo.id_usuario = biblioteca.usuario.id_usuario
  JOIN biblioteca.livro
  	   ON biblioteca.emprestimo.id_livro = biblioteca.livro.id_livro
 WHERE biblioteca.emprestimo.status = 'emprestado'
	

--4. Liste todos os autores e os livros que eles escreveram. 	


 SELECT biblioteca.livro.autor,
		biblioteca.livro.titulo
   FROM biblioteca.livro	


--5. Crie uma consulta que mostre todos os usuários e os livros que já pegaram emprestado,
--incluindo usuários que nunca pegaram livros..

SELECT biblioteca.usuario.nome,
       biblioteca.livro.titulo,
       biblioteca.emprestimo.status
  FROM biblioteca.usuario

    LEFT JOIN biblioteca.emprestimo
              ON biblioteca.usuario.id_usuario = biblioteca.emprestimo.id_usuario
    LEFT JOIN biblioteca.livro
              ON biblioteca.emprestimo.id_livro = biblioteca.livro.id_livro;


--======================================================================
--===========================LISTA 5====================================
--======================================================================

--1. Conte quantos livros estão cadastrados na biblioteca usando COUNT. 
	
SELECT COUNT(*) AS total_livros
FROM biblioteca.livro;

--2. Descubra a média de tempo de empréstimo dos livros utilizando AVG. 

SELECT (AVG(data_devolucao - data_emprestimo), 2) AS media_dias_emprestimo
FROM biblioteca.emprestimo
WHERE data_devolucao IS NOT NULL;

--3. Encontre o livro mais antigo e o mais recente utilizando MIN e MAX. 

SELECT 
    MIN(ano_publicacao) AS livro_mais_antigo,
    MAX(ano_publicacao) AS livro_mais_recente
FROM biblioteca.livro;

--4. Liste quantos empréstimos cada usuário já fez, agrupando por nome do usuário. 

SELECT 
    u.nome,
    COUNT(e.id_emprestimo) AS total_emprestimos
FROM biblioteca.usuario u
LEFT JOIN biblioteca.emprestimo e
       ON u.id_usuario = e.id_usuario
GROUP BY u.nome
ORDER BY total_emprestimos DESC;

--5. Mostre quantos livros existem por gênero, agrupando os resultados.

SELECT 
    genero,
    COUNT(*) AS total_livros
FROM biblioteca.livro
GROUP BY genero
ORDER BY total_livros DESC;


--======================================================================
--===========================LISTA 6====================================
--======================================================================

--1. Crie um índice na tabela livro para melhorar a busca pelo campo titulo. 

CREATE INDEX idx_livro_titulo
ON biblioteca.livro(titulo);
	
-- 2. Crie um índice na tabela emprestimo para otimizar a busca por data_emprestimo. 

CREATE INDEX idx_emprestimo_data
ON biblioteca.emprestimo(data_emprestimo);

--3. Crie uma VIEW chamada vw_historico_emprestimos que exiba o nome do usuário, título do
--livro, data do empréstimo e data de devolução. 

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

	 SELECT * FROM biblioteca.vw_historico_emprestimos;

--4. Explique como um índice pode melhorar a performance de uma consulta e quais são os
--impactos negativos de usar muitos índices. 

--======================================================================================

--Como índice melhora performance?

--Um índice funciona como o índice de um livro:

--Sem índice:
--O banco faz varredura completa (FULL SCAN) lê linha por linha

--Com índice:
--Ele vai direto no valor muito mais rápido

--======================================================================

--5. Teste a performance de uma consulta antes e depois de criar um índice usando EXPLAIN
--ANALYZE. (Caso já tenha criado os índices nos exercícios 1 e 2, utilize o comando DROP
--INDEX nome_indice; faça o teste, crie novamente e refaça o teste para analisar a diferença.)  

DROP INDEX IF EXISTS biblioteca.idx_livro_titulo;
EXPLAIN ANALYZE

SELECT *
FROM biblioteca.livro
WHERE titulo = 'A Sombra do Amanhã';

CREATE INDEX idx_livro_titulo
ON biblioteca.livro(titulo);

ANALYZE biblioteca.livro;

EXPLAIN ANALYZE
SELECT *
FROM biblioteca.livro
WHERE titulo = 'A Sombra do Amanhã';