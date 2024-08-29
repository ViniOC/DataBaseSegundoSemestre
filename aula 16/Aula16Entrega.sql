--1) Utilizando o conceito de DDL manual, crie uma tabela chamada 
--T_RHSTU_MEDICO_CONTATO com as seguintes colunas: cd_medico number
-- PK, id_contato number(3) PK, tp_contato varchar2(30), ds_contato
--varchar2(40), st_contato. Todas essas colunas devem ser obrigat�rias.
CREATE TABLE T_RHSTU_MEDICO_CONTATO (
    CD_MEDICO number not null,
    id_contato number(3) not null,
    tp_contato varchar2(30) not null,
    ds_contato varchar2(40) not null,
    st_contato char(1) not null,
    CONSTRAINT PK_MEDICO_CONTATO_NEW PRIMARY KEY (CD_MEDICO, id_contato)
);



--2) Para a coluna tp_contato apenas os seguintes valores s�o poss�veis: Telefone 
--Fixo; Telefone Celular; email; Telefone Contato.
ALTER TABLE T_RHSTU_MEDICO_CONTATO
ADD CONSTRAINT CHK_TIPO_CONTATO  CHECK (tp_contato IN('telefone fixo', 'telefone celular', 'email','telefone contato'))

--3) Para a coluna st_contato apenas os valores (A)tivo e (I)nativo s�o v�lidos.
ALTER TABLE T_RHSTU_MEDICO_CONTATO
ADD CONSTRAINT CHK_ST_CONTATO CHECK (st_contato in ('I', 'A'))
--4) Associe a tabela T_RHSTU_MEDICO_CONTATO ao m�dico, onde 1 m�dico pode 
--ter v�rios contatos.
ALTER TABLE T_RHSTU_MEDICO_CONTATO
ADD CONSTRAINT FK_MEDICO FOREIGN KEY (CD_MEDICO) REFERENCES T_RHSTU_MEDICO(CD_MEDICO)

--5) Houve um equ�voco e agora a coluna TP_CONTATO deve ter o conte�do 
--VARCHAR2(50). Realize o comando DDL que altere essa estrutura.
ALTER TABLE T_RHSTU_MEDICO_CONTATO
MODIFY tp_contato VARCHAR2(50)

--6. Na tabela T_RHSTU_MEDICO_CONTATO , crie uma coluna DT_CADASTRO do 
--tipo DATE com conte�do opcional.
ALTER TABLE T_RHSTU_MEDICO_CONTATO
add dt_cadastro DATE

--7. Agora essa coluna deve ser obrigat�ria. Utilize o comando ALTER TABLE para 
--criar essa restri��o.

ALTER TABLE T_RHSTU_MEDICO_CONTATO
add dt_cadastro DATE not null

--8. A coluna DT_CADASTRO n�o ficou boa nessa tabela. Favor elimina-la via 
--comando ALTER TABLE
ALTER TABLE T_RHSTU_MEDICO_CONTATO
drop column dt_cadstro

--9. Cadastre 1 m�dico e um contato poss�vel de ser feito com ele, criando 2 
--instru��es INSERT. Confirme as transa��es pendentes.
Insert into T_RHSTU_MEDICO(
CD_MEDICO,
NM_MEDICO,
NR_CRM,
DS_ESPECIALIDADE)
values (1, 1,1234, 'pediatra' );

Insert into T_RHSTU_MEDICO_CONTATO (
CD_MEDICO,
ID_CONTATO,
TP_CONTATO,
DS_CONTATO,
ST_CONTATO
)values(1, 1, 'telefone fixo', 'nao sei', 'A');

--10. Por fim, crie uma instru��o SQL que exiba todos os dados do m�dico e seus 
--respectivos contatos.
select * from T_RHSTU_MEDICO;

select * from T_RHSTU_MEDICO_CONTATO;

