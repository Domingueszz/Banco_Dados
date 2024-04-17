CREATE TABLE curso(
idcurso SERIAL  PRIMARY KEY,
nomecurso text
);

CREATE TABLE turma(
idturma SERIAL PRIMARY KEY,
professor text not null
);

CREATE TABLE aluno (
idaluno SERIAL PRIMARY KEY
);

CREATE TABLE escola (
idaluno int,
idturma int,
idcurso int,
FOREIGN KEY (idaluno) REFERENCES aluno,
FOREIGN KEY (idturma) REFERENCES turma,
FOREIGN KEY (idcurso) REFERENCES curso,
nomecompleto text not null,
datanasc varchar (10)
);

INSERT INTO curso (idcurso,nomecurso) VALUES
(1,'Mecatrônica'),
(2,'Eletrônica'),
(3,'Mecânica'),
(4,'Nutrição'),
(5,'Química'),
(6,'Alimentos'),
(7,'Serviços Jurídicos'),
(8,'Enfermagem'),
(9,'Eletromecânica'),
(10,'Eletroquímica');

INSERT INTO aluno (idaluno) VALUES
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8), 
 (9),
 (10);

INSERT INTO turma (idturma,professor) VALUES
(1,'Cainã'),
(2,'Antonia Flores'),
(4,'Felipe Castro'),
(6,'Marcos Lipe'),
(5,'Rebecca Santos'),
(3,'Walter Blanco'),
(8,'Marcela Reis'),
(9,'Antonio Freites'),
(7,'Alexandre Souza'),
(10,'Theo Henrique');

INSERT INTO escola (idaluno,idturma,idcurso,nomecompleto,datanasc) VALUES
(9,1,1,'Mônica Santos Silva','20/11/2005'),
(8,8,1,'Welder Silva Canolli','21/11/2005'),
(7,8,1,'Bento Chico Damasco','21/12/2006'),
(6,2,3,'Marcos Silveira Cruz','03/01/2005'),
(5,2,3,'Felix Mertes Meyuri','30/10/2005'),
(4,2,3,'Maria Eduarda Miranda','18/02/2005'),
(3,4,7,'Ane Camarão','20/12/2005'),
(2,3,7,'Silvane Albertin Shols','29/09/2005'),
(1,3,7,'Paulo Souza Moreira','19/09/2005'),
(10,3,7,'Cirilo Alberto Nunes','10/05/2005');


--1.a)
SELECT escola.nomecompleto, escola.idturma 
FROM escola INNER JOIN aluno USING (idaluno)
WHERE idturma = 3

-- b)
SELECT curso.nomecurso, escola.idturma 
FROM curso INNER JOIN escola USING (idcurso)
WHERE idcurso = 1

-- c)
SELECT idturma, COUNT(idaluno) AS nomecompleto
FROM escola
GROUP BY idturma;






SELECT * FROM turma
SELECT * FROM aluno
SELECT * FROM curso

DROP TABLE curso CASCADE
DROP TABLE turma CASCADE
DROP TABLE escola CASCADE
DROP TABLE aluno CASCADE






