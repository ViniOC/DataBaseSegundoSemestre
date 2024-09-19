-- inserindo valores dos estados
INSERT INTO T_SAK_ESTADO (cd_estado,nm_estado,sg_estado) VALUES (1,'SÃO PAULO','SP');
INSERT INTO T_SAK_ESTADO (cd_estado,nm_estado,sg_estado) VALUES (2,'RIO DE JANEIRO','RJ');
-- inserindo valores das cidades
INSERT INTO T_SAK_CIDADE (cd_cidade,cd_estado,nm_cidade) VALUES (10,1,'BOTUCATU');
INSERT INTO T_SAK_CIDADE (cd_cidade,cd_estado,nm_cidade) VALUES (11,2,'ANGRA DOS REIS');
-- inserindo valores dos bairros usando select
INSERT INTO T_SAK_BAIRRO (cd_bairro,cd_cidade,nm_bairro) VALUES (111,10,'CENTRO');
INSERT INTO T_SAK_BAIRRO (cd_bairro,cd_cidade,nm_bairro) VALUES (222,11,'VILA SANTO ANTONIO');
-- inserindo valores dos endereços
INSERT INTO T_SAK_ENDERECO (cd_end_correio,cd_bairro,nr_cep,ds_logradouro) VALUES (1000,111,18603590,'RUA DOS PRINCIPES');
INSERT INTO T_SAK_ENDERECO (cd_end_correio,cd_bairro,nr_cep,ds_logradouro) VALUES (2000,222,09530681,'AVENIDA PRESIDENTE VARGAS');
-- inserindo valores do departamento
INSERT INTO T_SAK_DEPTO (cd_depto,nm_depto,sg_depto) VALUES (1234,'TECNOLOGIA DA INFORMAÇÃO CORPORATIVA','TIC');
-- inserindo valores dos funcionarios
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1000,1234,'PAULO SILVA',TO_DATE('30/04/1988','DD/MM/YYYY'),'SOLTEIRO',10000,TO_DATE('19/09/2020','DD/MM/YYYY'));
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1001,1234,'MARIANA SOUZA',TO_DATE('25/06/2000','DD/MM/YYYY'),'SOLTEIRA',5000,TO_DATE('12/02/2018','DD/MM/YYYY'));
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1002,1234,'RAFAELA DIAS',TO_DATE('18/12/1974','DD/MM/YYYY'),'CASADA',20000,TO_DATE('21/07/2000','DD/MM/YYYY'));
-- inserindo tipos de endereços
INSERT INTO T_SAK_TIPO_ENDERECO (cd_tipo_endereco,nm_tipo_endereco) VALUES (1,'RESIDENCIAL');
INSERT INTO T_SAK_TIPO_ENDERECO (cd_tipo_endereco,nm_tipo_endereco) VALUES (2,'VERANEIO');
-- inserindo valores da tabela de funcionarios com endereços
INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1000, 1, 1000,1,NULL,2080);
INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1001, 1, 2000,2,'BLOCO C APTO 51',1543);
INSERT INTO T_SAK_FUNCIONARIO_ENDERECO (cd_func,cd_end_func,cd_end_correio,cd_tipo_endereco,ds_complemento,nr_logradouro) VALUES (1002, 1, 2000,2,'RUA SEM SAÍDA',658);
-- atualizando os salarios dos funcionarios
UPDATE T_SAK_FUNCIONARIO SET VL_SALARIO = VL_SALARIO * 1.4723;
-- inserindo valores dos projetos
INSERT INTO T_SAK_PROJETO (cd_projeto,nm_projeto,vl_budget_projeto,dt_inicio) VALUES (456,'DRAGON BALL',200000,TO_DATE('19/09/2020','DD/MM/YYYY'));
-- atualizando data do projeto para data de hoje
UPDATE T_SAK_PROJETO SET DT_TERMINO = SYSDATE WHERE CD_PROJETO = 456;
-- inserindo funcionario de teste
INSERT INTO T_SAK_FUNCIONARIO (cd_func,cd_depto,nm_funcionario,dt_nascimento,ds_estado_civil,vl_salario,dt_admissao) VALUES (1003,1234,'TESTE DA APLICAÇÃO',TO_DATE('12/12/1980','DD/MM/YYYY'),'DIVORCIADO',7500,TO_DATE('05/01/2005','DD/MM/YYYY'));
-- atualizando o salario do funcionario teste para a média salarial da empresa
UPDATE T_SAK_FUNCIONARIO SET VL_SALARIO = (SELECT NVL( AVG(VL_SALARIO),0) AS VL_MEDIO FROM T_SAK_FUNCIONARIO) WHERE NM_FUNCIONARIO = 'TESTE DA APLICAÇÃO';
-- inserindo telefone relacionado a um funcionario usando select
INSERT INTO T_SAK_TELEFONE (CD_FUNC,CD_TELEFONE,NR_DDD,NR_TELEFONE) VALUES (1002,1,13,33540421);
-- deletando telefone
DELETE FROM T_SAK_TELEFONE WHERE CD_FUNC = 1002 AND CD_TELEFONE = 1;
-- commit
COMMIT;