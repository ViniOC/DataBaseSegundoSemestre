--Para cada tabela da estrutura do banco de dados do projeto SIP:
--Criar o comando INSERT, para popular as tabelas.

-- As tabelas que possuem campos (colunas) do tipo de dado DATE, deverão ter seus 
--conteúdos inseridos, utilizando a função: TO_DATE (<data-hora>,<formato>)

-- Após todos os comandos para popular o banco de dados, efetive todas as 
--transações pendentes, executando o comando: COMMIT.

--CRIA TABELA TELEFONE
CREATE TABLE T_SIP_TELEFONE (
    CD_TELEFONE NUMBER(5,0) PRIMARY KEY,
    NR_MATRICULA NUMBER(5,0),
    DS_TELEFONE VARCHAR2(20 BYTE),
    CONSTRAINT fk_matricula FOREIGN KEY (NR_MATRICULA) REFERENCES T_SIP_FUNCIONARIO(NR_MATRICULA)
);

--POPULAÇÃO DOS DEPARTAMENTOS
INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(1,'COMERCIAL','CMR');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(2,'CONTABILIDADE','CBL');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(3,'ESTOQUE','ETQ');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(4,'FINANCEIRO','FNC');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(5,'ATENDIMENTO AO CLIENTE','SAC');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(6,'RECURSOS HUMANOS','RH');

INSERT INTO T_SIP_DEPTO(cd_depto,nm_depto,sg_depto) 
VALUES(7,'TECNOLOGIA DA INFORMAÇÃO','TI');

--POPULAÇÃO DOS FUNCIONARIOS 
INSERT INTO T_SIP_FUNCIONARIO(NR_MATRICULA,
CD_DEPTO,
NM_FUNCIONARIO,
DT_NASCIMENTO,
DT_ADMISSAO,
VL_SALARIO) 
VALUES(101,
1,
'JOÃO SILVA',
TO_DATE('15/05/1984', 'DD/MM/YYYY'),
TO_DATE('01/06/2010', 'DD/MM/YYYY'),
5000);