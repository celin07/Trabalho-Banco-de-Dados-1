/*Mostra a URL e os nomes de perfis de empresas cadastradas na rede social*/
SELECT P.URL_PF,  P.NOME
FROM PERFIL P, USUARIOS U
WHERE P.ID = U.ID AND U.CARACTERISTICA = 'empresa'; 

/*Apresenta o nome do moderador que modera a pagina com a URL em questão*/
SELECT M.NOME, MA.URL_PAG
FROM MODERADOR M, MODERA MA
WHERE MA.URL_PAG = 'www.redesocialteste.com.br/suporte' AND M.REGISTRO = MA.REG_MOD;

/*Apresenta o nome de funcionarios que são, ou moderadores, ou suportes empresariais*/
SELECT M.NOME
FROM MODERADOR M, FUNCIONARIOS F
WHERE F.REGISTRO = M.REGISTRO
UNION
SELECT S.NOME
FROM SUPORTE S, SUP_EMPRESARIAL SE
WHERE SE.CPF = S.CPF;

/*Seleciona as URL de perfis de pessoas comuns(que não são empresa)*/
SELECT U.URL
FROM USUARIOS U
WHERE U.ID IN (SELECT C.ID
			   FROM COMUM C, USUARIOS U
               WHERE U.CARACTERISTICA = 'comum');
               
/*Mostra a URL de perfis de empresas do ramo de alimentos*/
SELECT U.URL
FROM USUARIOS U
WHERE U.ID IN (SELECT E.ID
			   FROM EMPRESA E 
               WHERE E.DESCRICAO = 'Alimentos');
               
/*Mostra a URL e a data de criação do perfil das empresas requisitadas*/
SELECT U.URL, U.DATA_CRIACAO
FROM USUARIOS U 
WHERE U.ID IN (SELECT E.ID
               FROM EMPRESA E
               WHERE E.NOME = 'Ducis' OR E.NOME = 'Ballet');

/*Mostra o nome e descricao do perfil de pessoas comums(nao empresas) que criaram a conta em 07/12/2021*/
SELECT P.NOME, P.DESCRICAO
FROM PERFIL P
WHERE P.ID IN (SELECT U.ID
			   FROM USUARIOS U 
               WHERE U.DATA_CRIACAO = '2021-12-07' AND U.CARACTERISTICA = 'comum');
               
/*Mostra o RG do funcionário que possui o maior valor de Registro no sistema*/
SELECT F.RG
FROM FUNCIONARIOS F
WHERE F.REGISTRO = (SELECT MAX(F.REGISTRO)
					FROM FUNCIONARIOS F);
                    
/*Mostra o nome e o salario do suporte com o maior e menor salário respectivimente*/
SELECT S.NOME, S.SALARIO
FROM SUPORTE S
WHERE S.SALARIO = (SELECT MAX(S.SALARIO)
				   FROM SUPORTE S)
UNION
SELECT S.NOME, S.SALARIO
FROM SUPORTE S
WHERE S.SALARIO = (SELECT MIN(S.SALARIO)
				   FROM SUPORTE S);
                   
/*Mostra o numero de registro dos funcionarios que foram contratados depois do dia 10/12/2021*/
SELECT S.REGISTRO
FROM SUPORTE S
WHERE S.REGISTRO IN (SELECT F.REGISTRO
					 FROM FUNCIONARIOS F
                     WHERE F.DATA_CONTRATO > '2021-12-10');
                     
/*URL GITHUB = https://github.com/celin07/Trabalho-Banco-de-Dados-1*/