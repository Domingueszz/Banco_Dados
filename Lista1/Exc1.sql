CREATE TABLE autor (
	idautor SERIAL PRIMARY KEY,
	firstname text,
	lastname text
);

CREATE TABLE books (
	isbn SERIAL PRIMARY KEY
);

CREATE TABLE biblio (
	idautor int,
	isbn int,
	CONSTRAINT fk_livro FOREIGN KEY (idautor) REFERENCES autor (idautor),
	CONSTRAINT fk_autor FOREIGN KEY (isbn) REFERENCES books (isbn),
	titulolivro varchar(30),
	ano varchar(4),
	editora text
);

INSERT INTO autor (firstname,lastname) VALUES
 ( 'Nicolas', 'Silva'),
 ( 'Mario', 'César'),
 ( 'Rui', 'Barbosa'),
 ( 'Marcus', 'Linau'),
 ( 'Pablo', 'Açal'),
 ( 'Henry', 'Albeto'),
 ( 'Maria', 'Eduarda'),
 ( 'Carlos', 'Freik'),
 ( 'Andrade', 'Freik'),
 ( 'Vinicius', 'Souza');

INSERT INTO books (isbn) VALUES 
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8), 
 (9);
 
INSERT INTO biblio (idautor,isbn,titulolivro,ano,editora) VALUES 
 (1,1,'Jogos da Vida', '2001', 'EST'),
 (6,2,'Avião', '2007', 'Umbrella'),
 (1,3,'Vida Nova', '2000', 'EST'),
 (1,4,'Fim de Vida', '2003', 'EST'),
 (5,5,'MINDSET', '2022', 'MarçalStudios'),
 (7,6,'Calculo 220', '1998', 'Empire'),
 (3,6,'Calculo 220', '1998', 'Empire'),
 (2,7,'Acertos entre Erros', '2023', 'PD.Studios'), 
 (9,8,'Lua & Sol', '2005', 'D.E.S'),
 (9,9,'Terra & Mar', '2006', 'D.E.S');
 
--1.a):
SELECT biblio.titulolivro, autor.firstname, autor.lastname
FROM biblio INNER JOIN autor USING (idautor)

--b):
SELECT biblio.titulolivro, autor.firstname, autor.lastname
FROM biblio INNER JOIN autor USING (idautor)
WHERE firstname = 'Nicolas'

--c):
SELECT biblio.titulolivro, autor.firstname, autor.lastname
FROM biblio INNER JOIN autor USING (idautor)
WHERE isbn = 6




SELECT * FROM books
DROP TABLE books CASCADE
DROP TABLE autor CASCADE
DROP TABLE biblio CASCADE
