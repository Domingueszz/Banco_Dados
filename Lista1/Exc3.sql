CREATE TABLE projeto (
    idprojeto int PRIMARY KEY,
    nomeproj varchar(100),
    descricao text
);

CREATE TABLE funcionario (
    idfuncionario int PRIMARY KEY,
    nomefunc varchar(100),
    dataAdmissao date
);

CREATE TABLE associacao (
    idprojeto int,
    idfuncionario int,
    PRIMARY KEY (idprojeto, idfuncionario),
    FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto),
    FOREIGN KEY (idfuncionario) REFERENCES funcionario(idfuncionario)
);

INSERT INTO projeto (idprojeto, nomeproj , descricao) VALUES
(1, 'Projeto A', 'Desenvolvimento de um sistema de gerenciamento de vendas online para uma loja de roupas.'),
(2, 'Projeto B', 'Implementação de um novo sistema de controle de estoque para uma rede de supermercados.'),
(3, 'Projeto C', 'Desenvolvimento de um aplicativo móvel para rastreamento de encomendas.'),
(4, 'Projeto D', 'Desenvolvimento de um sistema de gestão de recursos humanos para uma empresa de tecnologia.'),
(5, 'Projeto E', 'Implementação de um novo sistema de pagamento online para uma plataforma de e-commerce.'),
(6, 'Projeto F', 'Desenvolvimento de um aplicativo de entrega de comida.'),
(7, 'Projeto G', 'Desenvolvimento de um sistema de gestão financeira para pequenas empresas.'),
(8, 'Projeto H', 'Implementação de um sistema de reserva de hotéis online.'),
(9, 'Projeto I', 'Desenvolvimento de um aplicativo de controle de gastos pessoais.'),
(10, 'Projeto J', 'Implementação de um sistema de monitoramento de tráfego urbano.');


INSERT INTO funcionario (idfuncionario, nomefunc, dataAdmissao) VALUES
(1, 'Carlos', '03-03-2024'),
(2, 'Samuel', '20-02-2022'),
(3, 'Juliane', '19-09-2019'),
(4, 'Maria', '10-01-2023'),
(5, 'João', '05-06-2021'),
(6, 'Ana', '15-03-2020'),
(7, 'Pedro', '25-11-2022'),
(8, 'Mariana', '02-04-2019'),
(9, 'Lucas', '30-07-2020'),
(10, 'Laura', '18-09-2023');

INSERT INTO associacao (idprojeto, idfuncionario) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 1),
(3, 3),
(4, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

--a
SELECT associacao.idprojeto, Associacao.idfuncionario FROM associacao
WHERE idprojeto = '1'

--b 
SELECT associacao.idfuncionario, associacao.idprojeto FROM associacao
WHERE idfuncionario = '1'