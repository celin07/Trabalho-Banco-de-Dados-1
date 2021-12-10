CREATE DATABASE REDE_SOCIAL;

USE REDE_SOCIAL;

CREATE TABLE FUNCIONARIOS(
	Registro integer,
    Data_contrato date,
    rg char(9),
    
    PRIMARY KEY(Registro)
);

CREATE TABLE REDE_SOCIAL(
	URL varchar(100),
    Assinatura varchar(50),
    Cookies integer,
    Registro integer,
    
    FOREIGN KEY (Registro) REFERENCES FUNCIONARIOS(Registro) ON DELETE CASCADE,
    PRIMARY KEY (URL)
);
    
CREATE TABLE MODERADOR(
	Registro integer,
	cpf char(11),
    nome varchar(50),
    salario decimal(10,2),
    
    FOREIGN KEY (Registro) REFERENCES FUNCIONARIOS(Registro) ON DELETE CASCADE,
    PRIMARY KEY(Registro)
);
    
CREATE TABLE SUPORTE(
	Registro integer,
	cpf char(11),
    nome varchar(50),
    salario decimal(10,2),
    
    FOREIGN KEY (Registro) REFERENCES FUNCIONARIOS(Registro) ON DELETE CASCADE,
    PRIMARY KEY(cpf, Registro)
);

CREATE TABLE SUP_EMPRESARIAL(
	cpf char(11),
    id_supE integer,
    
    FOREIGN KEY(cpf) REFERENCES SUPORTE(cpf) ON DELETE CASCADE,
    PRIMARY KEY(cpf)
);

CREATE TABLE SUP_COMUM(
	cpf char(11),
    id_supC integer,
    
    FOREIGN KEY (cpf) REFERENCES SUPORTE(cpf) ON DELETE CASCADE,
    PRIMARY KEY(cpf)
);

CREATE TABLE PAGINA(
	URL varchar(100),
	URL_P varchar(100),
    nome varchar(100),
    conteudo varchar(500),
    
    FOREIGN KEY (URL) REFERENCES REDE_SOCIAL(URL) ON DELETE CASCADE,
    PRIMARY KEY(URL_P)
);

CREATE TABLE USUARIOS(
	URL varchar(100),
	id integer,
    caracteristica varchar(100),
    data_criacao date,
    
    FOREIGN KEY (URL) REFERENCES PAGINA(URL_P) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE COMUM(
	id integer,
	registro integer,
    nome varchar(60),
    
    FOREIGN KEY(id) REFERENCES USUARIOS(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE EMPRESA(
	id integer,
    cnpj char(14),
    nome varchar(30),
    descricao varchar(200),
    
    FOREIGN KEY(id) REFERENCES USUARIOS(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE PERFIL(
	id integer,
	URL_PF varchar(100),
	nome varchar(40),
    descricao varchar(200),
    
    FOREIGN KEY (id) REFERENCES USUARIOS(id) ON DELETE CASCADE,
    FOREIGN KEY (URL_PF) REFERENCES PAGINA(url_p) ON DELETE CASCADE,
    PRIMARY KEY(URL_PF)
);

CREATE TABLE PUBLICACOES(
	conteudo varchar(500),
    data_publi date,
    tamanho integer,
    
    PRIMARY KEY(conteudo)
);

CREATE TABLE MODERA(
	Reg_mod integer,
    URL_pag varchar(100),
    
    FOREIGN KEY (Reg_mod) REFERENCES MODERADOR(Registro),
    FOREIGN KEY (URL_pag) REFERENCES PAGINA(URL_P),
    PRIMARY KEY(Reg_mod, URL_pag)
);

CREATE TABLE AUX_EMP(
	id_emp integer,
    cpf_ue char(11),
    
    FOREIGN KEY(id_emp) REFERENCES EMPRESA(id),
    FOREIGN KEY(cpf_ue) REFERENCES SUPORTE(cpf),
    PRIMARY KEY(id_emp, cpf_ue)
);

CREATE TABLE AUX_COM(
	id_usu integer,
    cpf_uc char(11),
    
    FOREIGN KEY(id_usu) REFERENCES COMUM(id),
    FOREIGN KEY(cpf_uc) REFERENCES SUPORTE(cpf),
    PRIMARY KEY(id_usu, cpf_uc)
);


INSERT INTO FUNCIONARIOS (Registro, Data_contrato, rg) VALUES
								(1, '2021-12-08', '123456789'),
								(2, '2021-12-08', '213456789'),
								(3, '2021-12-08', '987654321'),
                                (4, '2021-12-08', '854795123'),
                                (5, '2021-12-08', '234567592'),
                                (6, '2021-12-08', '112575598'),
                                (7, '2021-12-08', '985542314'),
                                (8, '2021-12-08', '987221564'),
                                (9, '2021-12-08', '563512356'),
                                (10, '2021-12-08', '789220124');
                                
INSERT INTO REDE_SOCIAL (URL, assinatura, cookies, registro) VALUES ('www.redesocialteste.com.br', 'assinaturas', 12, 1);

INSERT INTO MODERADOR (registro, cpf, nome, salario) VALUES (1, '12345678912', 'Jose Benicio', 1239.90),
															(2, '31246354646', 'Ricarto Oliveira', 1239.90),
                                                            (3, '56673100215', 'Gustavo Silva', 1239.90);
                                                            
INSERT INTO SUPORTE (registro, cpf, nome, salario) VALUES (4, '43266137901', 'Rogerio Roger', 978.50),
														  (5, '34567222803', 'Maria de Sousa', 978.50),
                                                          (6, '91665340721', 'Eliana Vieira', 978.50),
                                                          (7, '21033241201', 'Francisco Lima', 978.50),
                                                          (8, '55421302121', 'Pedro da Silva', 978.50),
                                                          (9, '22451332021', 'Felipe Giovanazzi', 978.50),
                                                          (10, '11202145789', 'Mathias Furlaneto', 978.50);

INSERT INTO SUP_EMPRESARIAL (cpf, id_supE) VALUES ('43266137901', 55),
												  ('34567222803', 96),
                                                  ('91665340721', 21);
                                                  
INSERT INTO SUP_COMUM (cpf, id_supC) VALUES ('21033241201', 30),
											('55421302121', 12),
                                            ('22451332021', 69),
                                            ('11202145789', 51);

INSERT INTO PAGINA (url, url_p, nome, conteudo) VALUES ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/inicio', 'Pagina inicial', 'Menu - Configurações - Outras Páginas'),
													   ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/suporte', 'Pagina ajuda', 'Contato com o suporte'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil1', 'Pagina perfil', 'Perfil1'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil2', 'Pagina perfil', 'Perfil2'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil3', 'Pagina perfil', 'Perfil3'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil4', 'Pagina perfil', 'Perfil4'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil5', 'Pagina perfil', 'Perfil5'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil6', 'Pagina perfil', 'Perfil6'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil7', 'Pagina perfil', 'Perfil7'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil8', 'Pagina perfil', 'Perfil8'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil9', 'Pagina perfil', 'Perfil9'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/perfil10', 'Pagina perfil', 'Perfil10'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/avaliacao', 'Pagina feedback', 'Feedback'),
                                                       ('www.redesocialteste.com.br', 'www.redesocialteste.com.br/fotos', 'Pagina fotos', 'Fotos');

INSERT INTO USUARIOS (url, id, caracteristica, data_criacao) VALUES ('www.redesocialteste.com.br/perfil1', 1, 'comum', '2021-12-07'),
																	('www.redesocialteste.com.br/perfil2', 2, 'comum', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil3', 3, 'comum', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil5', 4, 'comum', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil5', 5, 'comum', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil6', 6, 'empresa', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil7', 7, 'empresa', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil8', 8, 'empresa', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil9', 9, 'empresa', '2021-12-07'),
                                                                    ('www.redesocialteste.com.br/perfil10', 10, 'empresa', '2021-12-07');
                                                                    
INSERT INTO COMUM (id, registro, nome) VALUES (1, 01, 'Anastacio Silva'),    
											  (2, 02, 'Jorge Augusto'),
											  (3, 03, 'Eduarda Lima'),
											  (4, 04, 'Maria Julia'),
											  (5, 05, 'Rodolfo');
                                                         
INSERT INTO EMPRESA(id, cnpj, nome, descricao) VALUES (6, '53416452149531', 'Ducis', 'Doceria'),
													  (7, '64384266438765', 'Borracharia 014', 'Borracharia'),
                                                      (8, '43353421246567', 'Ballet', 'Escola de danca'),
                                                      (9, '67275564327626', 'McDonalds', 'Lanchonete'),
                                                      (10, '46563752616373', '4 Rodas', 'Auto mecanica');
                                                      
INSERT INTO PERFIL(id, url_pf, nome, descricao) VALUES (1, 'www.redesocialteste.com.br/perfil1', 'Anastacio Silva', 'Gosto de jogar basquete XD'),
													   (2, 'www.redesocialteste.com.br/perfil2', 'Jorginho A.', 'Cantor/Compositor'),
                                                       (3, 'www.redesocialteste.com.br/perfil3', 'Duda', 'Faço alguns desenhos legais'),
                                                       (4, 'www.redesocialteste.com.br/perfil4', 'Maju', 'Sou muito boa no volei'),
                                                       (5, 'www.redesocialteste.com.br/perfil5', 'Rods', 'Vai brasil'),
                                                       (6, 'www.redesocialteste.com.br/perfil6', 'Doceria Ducis', 'A melhor doceria da regiao'),
                                                       (7, 'www.redesocialteste.com.br/perfil7', 'Borracharia 014', 'Tudo em pneus'),
                                                       (8, 'www.redesocialteste.com.br/perfil8', 'Escola de dança Ballet', 'Chacoalhando o esqueleto'),
                                                       (9, 'www.redesocialteste.com.br/perfil9', 'McDonalds', 'A melhor opcao de drive thru'),
                                                       (10, 'www.redesocialteste.com.br/perfil10', 'Oficina 4 Rodas', 'O melhor para o seu carro');

INSERT INTO PUBLICACOES (conteudo, data_publi, tamanho) VALUES ('Convite para festa sabado', '2021-12-04', 10),
															   ('Olha que bonita essa jogada -->', '2021-12-04', 17),
                                                               ('Quero comprar uma guitarra!!!', '2021-12-04', 13),
                                                               ('Nos do condominio nos desculpamos pelo incidente, como forma de nos desculparmos reduziremos a mensalidade dos proximos 3 meses em 30%', '2021-12-04', 33),
                                                               ('Peça agora seu almoço no ifood', '2021-12-04', 12);
                                                               
INSERT INTO MODERA (reg_mod, url_pag) VALUES (1, 'www.redesocialteste.com.br/fotos'),
											 (2, 'www.redesocialteste.com.br/suporte'),
                                             (3, 'www.redesocialteste.com.br/avaliacao');
                                             
INSERT INTO AUX_EMP (id_emp, cpf_ue) VALUES (6, '43266137901'),
											(7, '55421302121'),
                                            (10, '91665340721');
                                            
INSERT INTO AUX_COM (id_usu, cpf_uc) VALUES (1, '21033241201'),
											(2, '55421302121'),
                                            (4, '22451332021'),
                                            (5, '11202145789');