CREATE TABLE pacient(
idpacient int PRIMARY KEY,
namepacient text not null,
datanasc varchar(10)
);

CREATE TABLE medico(
idmedico int PRIMARY KEY,
nomemedico text not null,
espec text
);

CREATE TABLE registros(
idregistro int PRIMARY KEY
);

CREATE TABLE hospital(
idpacient int,
idmedico int,
idregistros int,
FOREIGN KEY(idpacient)REFERENCES pacient,
FOREIGN KEY(idmedico)REFERENCES medico,
FOREIGN KEY(idregistros)REFERENCES registros
);

INSERT INTO pacient (idpacient, namepacient,datanasc) VALUES
(1,'Roberto Carlos', '30/04/1998'),
(2,'Gil Gomes', '30/04/1998'),
(3,'Maria Antonia', '30/04/1998'),
(4,'Nila Flores', '03/09/1985'),
(5,'José Freitas', '21/06/1971'),
(6,'Almeida Silva', '05/08/1968'),
(7,'Raquel Bella', '23/02/2001'),
(8,'Yago Maia', '15/07/2002'),
(9,'Roberto Andrade', '26/01/1981'),
(10,'Andreia Gomes', '17/11/1976');

INSERT INTO medico (idmedico, nomemedico, espec) VALUES
(1,'Mario Carlos', 'Ortopedista'),
(2,'Gabriel Silva', 'Radiologista'),
(3,'Antonio Elvis', 'Pediatra'),
(4,'Nila Gomes', 'Ortopedista'),
(5,'Joana Shzouls', 'Demartologista'),
(6,'Albert Sheik', 'Neurologista'),
(7,'Meyer Souza', 'Neurologista'),
(8,'Miria Maia', 'Cardiologista'),
(9,'Marcelo Ferreira', 'Radilogista'),
(10,'Théo Silvestre', 'Fisioterapeuta');

INSERT INTO registros (idregistro) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO hospital (idpacient,idmedico,idregistros) VALUES
(1,1,7),
(2,1,7),
(3,2,2),
(4,3,5),
(5,3,5),
(6,8,1),
(7,9,4),
(8,9,4),
(9,7,3),
(10,6,8);

SELECT * FROM hospital 

DROP TABLE  hospital CASCADE

-- 3. a)
SELECT hospital.idmedico, pacient.namepacient  
FROM hospital INNER JOIN pacient USING (idpacient)
WHERE idmedico = 3

-- b)
SELECT hospital.idpacient, medico.nomemedico  
FROM hospital INNER JOIN medico USING (idmedico)
WHERE idpacient = 2

-- c)
SELECT nomemedico, COUNT(idpacient) AS consulta_pacientes, 
COUNT(idpacient)*1.0/(SELECT COUNT(*) FROM medico) AS media_pacientes_por_medico
FROM medico
LEFT JOIN hospital ON medico.idmedico = hospital.idmedico
GROUP BY nomemedico;

