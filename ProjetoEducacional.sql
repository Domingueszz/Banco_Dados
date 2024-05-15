-------->>DDL<<---------
--CONJUNTO TABELA ALUNO: --(2-31)---------------------------------------------
CREATE TABLE alunos(
	cpf int PRIMARY KEY,
	nome_aluno varchar(50) NOT NULL,
	data_nasc varchar (10),
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	UF varchar(2),
	cep int,
	pais varchar(20)
);

ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar(15)

CREATE TABLE telefone(
	cpf varchar(15) REFERENCES alunos,
	cod_pais int,
	ddd int,
    numero int
);

CREATE TABLE emails(
	cpf varchar(15) REFERENCES alunos,
	email varchar(80),
	dominio varchar (20)
);
-------------------------------------------------------------------------------------
--CONJUNTO TABELA MATRICULA(CURSO, DEPARTAMENTO): --(32-52)-------------------------------------------------
CREATE TABLE departamentos(
	id_dpto SERIAL PRIMARY KEY,
	sigla_dpto varchar(4),
	nome_dpto varchar(10)
);

CREATE TABLE cursos(
	id_cursos SERIAL PRIMARY KEY,
	nome_curso varchar (10),
	id_dpto SERIAL REFERENCES departamentos
);

CREATE TABLE matriculas(
	ra SERIAL PRIMARY KEY,
    cpf varchar(15) REFERENCES alunos,
	status varchar(10),
	id_curso SERIAL REFERENCES cursos
);

---------------------------------------------------------------------------------------------------------------
--CONJUTO TABELA DISCIPLINAS: --(53-71)--------------------------------
CREATE TABLE disciplinas (
	id_disciplina SERIAL PRIMARY KEY,
	nome_disciplina varchar(10),
	optativa boolean
);

CREATE TABLE cursos_disciplinas(
	id_curso SERIAL REFERENCES cursos,
	id_disciplina SERIAL REFERENCES disciplinas
);

ALTER TABLE disciplinas ALTER COLUMN nome_disciplina TYPE varchar(20)

CREATE TABLE matriculas_disciplinas(
	ra SERIAL REFERENCES matriculas,
	id_disciplinas SERIAL REFERENCES disciplinas
);
-----------------------------------------------------------------
-->>DML<<----
-- Inserindo dados na tabela 'alunos'
INSERT INTO alunos (cpf, nome_aluno, data_nasc, idade, rua, numero, bairro, cidade, UF, cep, pais)
VALUES
    ('12345678901', 'João Silva', '01/01/2000', 24, 'Rua A', '100', 'Bairro A', 'Cidade A', 'SP', 12345000, 'Brasil'),
    ('12345678902', 'Maria Souza', '12/05/2002', 22, 'Rua B', '200', 'Bairro B', 'Cidade B', 'RJ', 22345678, 'Brasil'),
    ('12345678903', 'Carlos Costa', '15/09/1999', 24, 'Rua C', '300', 'Bairro C', 'Cidade C', 'MG', 32345678, 'Brasil'),
    ('12345678904', 'Ana Oliveira', '25/07/2001', 23, 'Rua D', '400', 'Bairro D', 'Cidade D', 'BA', 42345678, 'Brasil'),
    ('12345678905', 'Pedro Santos', '30/12/1998', 25, 'Rua E', '500', 'Bairro E', 'Cidade E', 'PR', 52345678, 'Brasil'),
    ('12345678906', 'Laura Lima', '11/11/2003', 21, 'Rua F', '600', 'Bairro F', 'Cidade F', 'PE', 62345678, 'Brasil'),
    ('12345678907', 'Lucas Mendes', '05/03/2000', 24, 'Rua G', '700', 'Bairro G', 'Cidade G', 'RS', 72345678, 'Brasil'),
    ('12345678908', 'Isabela Rocha', '19/08/2001', 23, 'Rua H', '800', 'Bairro H', 'Cidade H', 'GO', 82345678, 'Brasil'),
    ('12345678909', 'Gabriel Moreira', '07/02/2004', 20, 'Rua I', '900', 'Bairro I', 'Cidade I', 'SP', 92345678, 'Brasil'),
    ('12345678910', 'Carolina Reis', '23/06/2002', 22, 'Rua J', '1000', 'Bairro J', 'Cidade J', 'MG', 10123456, 'Brasil');

-- Inserindo dados na tabela 'telefone'
INSERT INTO telefone (cpf, cod_pais, ddd, numero)
VALUES
    ('12345678901', 55, 11, 99887766),
    ('12345678902', 55, 21, 98765432),
    ('12345678903', 55, 31, 91234567),
    ('12345678904', 55, 71, 97654321),
    ('12345678905', 55, 41, 96385274),
    ('12345678906', 55, 81, 98653214),
    ('12345678907', 55, 51, 97415326),
    ('12345678908', 55, 62, 93516274),
    ('12345678909', 55, 11, 97423165),
    ('12345678910', 55, 31, 97684532);
	
	-- Inserindo dados na tabela 'emails'
INSERT INTO emails (cpf, email, dominio)
VALUES
    ('12345678901', 'joao.silva@gmail.com', 'gmail.com'),
    ('12345678902', 'maria.souza@yahoo.com', 'yahoo.com'),
    ('12345678903', 'carlos.costa@outlook.com', 'outlook.com'),
    ('12345678904', 'ana.oliveira@gmail.com', 'gmail.com'),
    ('12345678905', 'pedro.santos@hotmail.com', 'hotmail.com'),
    ('12345678906', 'laura.lima@yahoo.com', 'yahoo.com'),
    ('12345678907', 'lucas.mendes@outlook.com', 'outlook.com'),
    ('12345678908', 'isabela.rocha@gmail.com', 'gmail.com'),
    ('12345678909', 'gabriel.moreira@hotmail.com', 'hotmail.com'),
    ('12345678910', 'carolina.reis@outlook.com', 'outlook.com');
	
	-- Inserindo dados na tabela 'departamentos'
INSERT INTO departamentos (sigla_dpto, nome_dpto)
VALUES
    ('SAUD', 'SAÚDE'),
    ('TECN', 'TECNOLOGIA'),
    ('ENGE', 'ENGENHARIA'),
    ('HUMA', 'HUMANAS');
   

-- Inserindo dados na tabela 'cursos'
INSERT INTO cursos (nome_curso, id_dpto)
VALUES
    ('Medicina', 1),  -- Departamento de Saúde
    ('Enfermagem', 1),
    ('Cálculo', 2), -- Departamento de Tecnologia
    ('Algoritmos', 2),
    ('Física', 2),
    ('Química', 2),
    ('Direito', 3), -- Departamento de Humanas
    ('Economia', 3),
    ('Sociologia', 3),
    ('Civil', 4), -- Departamento de Engenharia
    ('Elétrica', 4),
    ('Mecânica', 4);

-- Inserindo dados na tabela 'matriculas'
INSERT INTO matriculas (cpf, status, id_curso)
VALUES
    ('12345678901', 'Ativo', 1), -- Medicina
    ('12345678902', 'Inativo', 2), -- Enfermagem
    ('12345678903', 'Ativo', 3), -- Cálculo
    ('12345678903', 'Ativo', 4), -- Algoritmos
    ('12345678905', 'Ativo', 5), -- Física Geral
    ('12345678906', 'Inativo', 6), -- Química Geral
    ('12345678907', 'Ativo', 7), -- Direito Constitucional
    ('12345678908', 'Formado', 8), -- Economia
    ('12345678909', 'Formado', 9), -- Sociologia
    ('12345678905', 'Ativo', 10); -- Eng. Civil
	
	DROP TABLE matriculas CASCADE

-- Inserindo dados na tabela 'disciplinas'
INSERT INTO disciplinas (nome_disciplina, optativa)
VALUES
    ('Anatomia', FALSE),
    ('Citologia', FALSE),
    ('Cálculo I', FALSE),
    ('Cálculo II', FALSE),
    ('Física I', FALSE),
    ('Física II', FALSE),
    ('Direito I', FALSE),
    ('Direito II', FALSE),
    ('Economia I', FALSE),
    ('Sociologia I', FALSE),
    ('Engenharia I', FALSE),
    ('Engenharia II', FALSE);
	
	-- Inserindo dados na tabela 'cursos_disciplinas'
INSERT INTO cursos_disciplinas (id_curso, id_disciplina)
VALUES
    (1, 1), -- Anatomia para Medicina
    (1, 2), -- Microbiologia para Medicina
    (3, 3), -- Cálculo I para Cálculo
    (3, 4), -- Cálculo II para Cálculo
    (5, 5), -- Física I para Física Geral
    (5, 6), -- Física II para Física Geral
    (7, 7), -- Direito I para Direito Constitucional
    (7, 8), -- Direito II para Direito Constitucional
    (8, 9), -- Economia I para Economia
    (9, 10), -- Sociologia I para Sociologia
    (10, 11), -- Engenharia I para Eng. Civil
    (10, 12); -- Engenharia II para Eng. Civil
	
	-- Inserindo dados na tabela 'matriculas_disciplinas'
INSERT INTO matriculas_disciplinas (ra, id_disciplinas)
VALUES
    (1, 1),
    (1, 2),
    (3, 3),
    (3, 4),
    (5, 5),
    (5, 6),
    (7, 7),
    (7, 8),
    (8, 9),
    (9, 10),
    (10, 11),
    (10, 12);
---------------------------------------------------------------------------------------------------------------------
-->>DQL<<--
--FILTROS--
1) SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade, alunos.rua, alunos.rua, alunos.bairro, alunos.cidade, alunos.UF, alunos.cep, alunos.pais
FROM alunos FULL JOIN matriculas USING (cpf)  
WHERE ra = 9

2) SELECT cursos.id_cursos, cursos.nome_curso
FROM cursos FULL JOIN departamentos USING (id_dpto)  
WHERE nome_dpto = 'SAÚDE'

3) SELECT cursos.nome_curso, cursos.id_cursos
FROM disciplinas FULL JOIN cursos_disciplinas ON disciplinas.id_disciplina = cursos_disciplinas.id_disciplina
                 FULL JOIN cursos ON cursos_disciplinas.id_curso = cursos.id_cursos
WHERE disciplinas.nome_disciplina = 'Anatomia';


4) SELECT disciplinas.nome_disciplina, disciplinas.optativa
FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
            INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
            INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE alunos.cpf = '12345678901';


5) SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade
FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
            INNER JOIN cursos ON matriculas.id_curso = cursos.id_cursos
WHERE cursos.nome_curso = 'Medicina' ;


6) SELECT alunos.cpf, alunos.nome_aluno, alunos.data_nasc, alunos.idade
FROM alunos FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
            FULL JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
            FULL JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE disciplinas.nome_disciplina = 'Engenharia I';

7) SELECT alunos.nome_aluno, matriculas.status
FROM alunos FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
WHERE matriculas.status = 'Formado'

8) SELECT alunos.nome_aluno, matriculas.status
FROM alunos FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
WHERE matriculas.status = 'Ativo'

9) SELECT cursos.nome_curso, COUNT(alunos.cpf) AS quantidade_alunos_ativos
FROM alunos FULL JOIN matriculas ON alunos.cpf = matriculas.cpf
            FULL JOIN cursos ON matriculas.id_curso = cursos.id_cursos
WHERE matriculas.status = 'Ativo' 
GROUP BY cursos.nome_curso;

10) SELECT disciplinas.nome_disciplina, COUNT(alunos.cpf) AS quantidade_alunos_ativos
FROM alunos INNER JOIN matriculas ON alunos.cpf = matriculas.cpf
            INNER JOIN matriculas_disciplinas ON matriculas.ra = matriculas_disciplinas.ra
			INNER JOIN disciplinas ON matriculas_disciplinas.id_disciplinas = disciplinas.id_disciplina
WHERE matriculas.status = 'Ativo' 
GROUP BY disciplinas.nome_disciplina;





	
	

