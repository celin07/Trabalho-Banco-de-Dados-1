CREATE DATABASE REDE_SOCIAL;

USE REDE_SOCIAL;

CREATE TABLE REDE_SOCIAL(
	URL varchar(100),
    Assinatura varchar(50),
    Cookies integer,
    
    PRIMARY KEY (URL)
);

CREATE TABLE FUNCIONARIOS(
	Registro integer,
    Data_contrato date,
    rg char(9),
    
    PRIMARY KEY(Registro)
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
	URL_P varchar(100),
    nome varchar(100),
    conteudo varchar(500),
    
    PRIMARY KEY(URL_P)
);

CREATE TABLE USUARIOS(
	id integer,
    caracteristica varchar(100),
    data_criacao date,
    
    PRIMARY KEY(id)
);

CREATE TABLE COMUM(
	id integer,
	registro integer,
    nome varchar(60),
    descricao varchar(200),
    
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
	URL_PF varchar(100),
	nome varchar(20),
    descricao varchar(200),
    
    PRIMARY KEY(URL_PF)
);

CREATE TABLE PUBLICACOES(
	conteudo varchar(500),
    data_publi date,
    tamanho integer,
    
    PRIMARY KEY(conteudo)
);

CREATE TABLE REDE_PAG(
	URL_rede varchar(100),
    URL_pag varchar(100),
    
    FOREIGN KEY(URL_rede) REFERENCES REDE_SOCIAL(URL),
    FOREIGN KEY(URL_PAG) REFERENCES PAGINA(URL_P),
    PRIMARY KEY(URL_pag)
);

CREATE TABLE REDE_FUNCIONARIOS(
	URL_rede varchar(100),
    Registro_func integer,
    
    FOREIGN KEY(URL_rede) REFERENCES REDE_SOCIAL(URL),
    FOREIGN KEY(Registro_func) REFERENCES FUNCIONARIOS(Registro),
    PRIMARY KEY(Registro_func)
);

CREATE TABLE MODERA(
	Reg_mod integer,
    URL_pag varchar(100),
    
    FOREIGN KEY (Reg_mod) REFERENCES MODERADOR(Registro),
    FOREIGN KEY (URL_pag) REFERENCES PAGINA(URL_P),
    PRIMARY KEY(Reg_mod, URL_pag)
);

CREATE TABLE PAG_PF_PUBLI(
	URL_pag varchar(100),
    URL_perf varchar(100),
    conteudo_publi varchar(500),
    
    FOREIGN KEY(URL_pag) REFERENCES PAGINA(URL_P),
    FOREIGN KEY(URL_perf) REFERENCES PERFIL(URL_PF),
    FOREIGN KEY(conteudo_publi) REFERENCES PUBLICACOES(conteudo),
    PRIMARY KEY(URL_pag, URL_perf, conteudo_publi)
);

CREATE TABLE PERFIL_USUARIO(
	URL_pf varchar(100),
    id_user integer,
    
    FOREIGN KEY(URL_pf) REFERENCES PERFIL(URL_PF),
    FOREIGN KEY(id_user) REFERENCES USUARIOS(id),
    PRIMARY KEY(id_user)
);

CREATE TABLE AUX_EMP(
	id_emp integer,
    cpf_ue char(11),
    
    FOREIGN KEY(id_emp) REFERENCES EMPRESA(id),
    FOREIGN KEY(cpf_ue) REFERENCES SUP_EMPRESARIAL(cpf),
    PRIMARY KEY(id_emp, cpf_ue)
);

CREATE TABLE AUX_COM(
	id_usu integer,
    cpf_uc char(11),
    
    FOREIGN KEY(id_usu) REFERENCES COMUM(id),
    FOREIGN KEY(cpf_uc) REFERENCES SUP_COMUM(cpf),
    PRIMARY KEY(id_usu, cpf_uc)
);

CREATE TABLE RS_PAG_USU(
	URL_RS varchar(100),
    id_user integer,
    URL_pg varchar(100),
    
    FOREIGN KEY(URL_pg) REFERENCES PAGINA(URL_P),
    FOREIGN KEY(id_user) REFERENCES USUARIOS(id),
    FOREIGN KEY(URL_RS) REFERENCES REDE_SOCIAL(URL),
    PRIMARY KEY(URL_pg, id_user)
);
	
