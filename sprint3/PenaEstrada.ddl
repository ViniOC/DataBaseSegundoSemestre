-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2024-09-03 14:01:15 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE t_pe_bairro CASCADE CONSTRAINTS;

DROP TABLE t_pe_cidade CASCADE CONSTRAINTS;

DROP TABLE t_pe_diagnostico CASCADE CONSTRAINTS;

DROP TABLE t_pe_estado CASCADE CONSTRAINTS;

DROP TABLE t_pe_login_porto_seguro CASCADE CONSTRAINTS;

DROP TABLE t_pe_logradouro CASCADE CONSTRAINTS;

DROP TABLE t_pe_oficina CASCADE CONSTRAINTS;

DROP TABLE t_pe_orcamento CASCADE CONSTRAINTS;

DROP TABLE t_pe_peca CASCADE CONSTRAINTS;

DROP TABLE t_pe_servico CASCADE CONSTRAINTS;

DROP TABLE t_pe_telefone_oficina CASCADE CONSTRAINTS;

DROP TABLE t_pe_telefone_usuario CASCADE CONSTRAINTS;

DROP TABLE t_pe_usuario CASCADE CONSTRAINTS;

DROP TABLE t_pe_usuario_endereco CASCADE CONSTRAINTS;

DROP TABLE t_pe_veiculo CASCADE CONSTRAINTS;

CREATE TABLE t_pe_bairro (
    id_bairro       NUMBER(8) NOT NULL,
    id_cidade       NUMBER(8) NOT NULL,
    nm_bairro       VARCHAR2(45) NOT NULL,
    nm_zona_bairro  VARCHAR2(20) NOT NULL
);

ALTER TABLE t_pe_bairro
    ADD CONSTRAINT uk_t_pkd_bairro_zona CHECK ( nm_zona_bairro IN (
        'CENTRO',
        'ZONA LESTE',
        'ZONA NORTE',
        'ZONA OESTE',
        'ZONA SUL'
    ) );

COMMENT ON COLUMN t_pe_bairro.id_bairro IS
    'Esta coluna irá receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.';

COMMENT ON COLUMN t_pe_bairro.nm_bairro IS
    'Esta coluna irá receber o nome do Bairro  pertencente Cidade do Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.';

COMMENT ON COLUMN t_pe_bairro.nm_zona_bairro IS
    'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.';

ALTER TABLE t_pe_bairro ADD CONSTRAINT pk__pe_bairro PRIMARY KEY ( id_bairro );

CREATE TABLE t_pe_cidade (
    id_cidade  NUMBER(8) NOT NULL,
    id_estado  NUMBER(2) NOT NULL,
    nm_cidade  VARCHAR2(60) NOT NULL,
    cd_ibge    NUMBER(8) NOT NULL,
    nr_ddd     NUMBER(3) NOT NULL
);

COMMENT ON COLUMN t_pe_cidade.id_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório e será preenchido automaticamente pelo sistema.

';

COMMENT ON COLUMN t_pe_cidade.id_estado IS
    'Esta coluna irá receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.';

COMMENT ON COLUMN t_pe_cidade.nm_cidade IS
    'Esta coluna irá receber o nome do Cidade pertencente ao Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.';

COMMENT ON COLUMN t_pe_cidade.cd_ibge IS
    'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.';

ALTER TABLE t_pe_cidade ADD CONSTRAINT pk_pe_cidade PRIMARY KEY ( id_cidade );

CREATE TABLE t_pe_diagnostico (
    id_orcamento    NUMBER(10) NOT NULL,
    id_diagnostico  NUMBER(10) NOT NULL,
    ds_descricao    VARCHAR2(1200) NOT NULL
);

ALTER TABLE t_pe_diagnostico ADD CONSTRAINT t_pe_diagnostico_pk PRIMARY KEY ( id_diagnostico,
                                                                              id_orcamento );

CREATE TABLE t_pe_estado (
    id_estado  NUMBER(2) NOT NULL,
    sg_estado  CHAR(2) NOT NULL,
    nm_estado  VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_pe_estado.id_estado IS
    'Esta coluna irá receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.';

COMMENT ON COLUMN t_pe_estado.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN t_pe_estado.nm_estado IS
    'Esta coluna irá receber o nome do estado. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.';

ALTER TABLE t_pe_estado ADD CONSTRAINT pk_pe_estado PRIMARY KEY ( id_estado );

CREATE TABLE t_pe_login_porto_seguro (
    id_usuario  NUMBER(10) NOT NULL,
    ds_email    VARCHAR2(90) NOT NULL,
    ds_senha    VARCHAR2(100) NOT NULL
);

ALTER TABLE t_pe_login_porto_seguro ADD CONSTRAINT t_pe_login_porto_seguro_pk PRIMARY KEY ( id_usuario );

CREATE TABLE t_pe_logradouro (
    id_logradouro  NUMBER(10) NOT NULL,
    id_bairro      NUMBER(8) NOT NULL,
    nm_logradouro  VARCHAR2(100) NOT NULL,
    nr_cep         NUMBER(8) NOT NULL
);

COMMENT ON COLUMN t_pe_logradouro.id_logradouro IS
    'Esta coluna irá receber o codigo interno para garantir o lograouro, que esta localizado no  cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.';

COMMENT ON COLUMN t_pe_logradouro.id_bairro IS
    'Esta coluna irá receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.';

COMMENT ON COLUMN t_pe_logradouro.nm_logradouro IS
    'Esta coluna irá receber o nome do lograoduro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.';

COMMENT ON COLUMN t_pe_logradouro.nr_cep IS
    'Esta coluna irá receber o número do CEP do lograoduro. O padrão de armazenmento é  numérico  e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.';

ALTER TABLE t_pe_logradouro ADD CONSTRAINT pk_pe_logradouro PRIMARY KEY ( id_logradouro );

CREATE TABLE t_pe_oficina (
    id_oficina               NUMBER(10) NOT NULL,
    nm_unid_oficina          VARCHAR2(80) NOT NULL,
    nm_razao_social_oficina  VARCHAR2(80) NOT NULL,
    id_logradouro            NUMBER(10) NOT NULL,
    nr_logradouro            NUMBER(7),
    ds_complemento_numero    VARCHAR2(30),
    ds_ponto_referencia      VARCHAR2(50),
    st_oficina               CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_pe_oficina.nr_logradouro IS
    'Esse atributo irá receber o número do logradouro do endereco da Oficina.  Seu conteúdo é opcional.';

COMMENT ON COLUMN t_pe_oficina.ds_complemento_numero IS
    'Esse atributo irá receber o complemeneto  do logradouro do endereco da Oficina caso ele exista. Seu conteúdo é opcional.';

COMMENT ON COLUMN t_pe_oficina.ds_ponto_referencia IS
    'Esse atributo irá receber o ponto de referência  do logradouro do endereco da Oficina.';

ALTER TABLE t_pe_oficina ADD CONSTRAINT t_psa_oficina_pk PRIMARY KEY ( id_oficina );

CREATE TABLE t_pe_orcamento (
    id_orcamento  NUMBER(10) NOT NULL,
    id_oficina    NUMBER(10) NOT NULL,
    id_usuario    NUMBER(10) NOT NULL,
    id_veiculo    NUMBER(10) NOT NULL,
    dt_inicio     DATE NOT NULL,
    dt_entrega    DATE NOT NULL,
    dt_finalizao  DATE
);

ALTER TABLE t_pe_orcamento ADD CONSTRAINT t_psa_orcamento_pk PRIMARY KEY ( id_orcamento );

CREATE TABLE t_pe_peca (
    id_peca    NUMBER(10) NOT NULL,
    nm_peca    VARCHAR2(90) NOT NULL,
    cd_modelo  VARCHAR2(50) NOT NULL
);

ALTER TABLE t_pe_peca ADD CONSTRAINT t_psa_peca_pk PRIMARY KEY ( id_peca );

CREATE TABLE t_pe_servico (
    id_servico      NUMBER(10) NOT NULL,
    id_diagnostico  NUMBER(10) NOT NULL,
    id_orcamento    NUMBER(10) NOT NULL,
    id_peca         NUMBER(10),
    ds_servico      VARCHAR2(300) NOT NULL,
    vl_peca         NUMBER(9, 2),
    vl_mao_obra     NUMBER(9, 2) NOT NULL
);

ALTER TABLE t_pe_servico ADD CONSTRAINT t_pe_servico_pk PRIMARY KEY ( id_servico );

CREATE TABLE t_pe_telefone_oficina (
    id_telefone  NUMBER(10) NOT NULL,
    id_oficina   NUMBER(10) NOT NULL,
    nr_ddi       NUMBER(3) NOT NULL,
    nr_ddd       NUMBER(3) NOT NULL,
    nr_telefone  NUMBER(10) NOT NULL
);

ALTER TABLE t_pe_telefone_oficina ADD CONSTRAINT t_pe_telefone_pk PRIMARY KEY ( id_telefone );

CREATE TABLE t_pe_telefone_usuario (
    id_telefone  NUMBER(10) NOT NULL,
    id_usuario   NUMBER(10) NOT NULL,
    nr_ddi       NUMBER(3) NOT NULL,
    nr_ddd       NUMBER(3) NOT NULL,
    nr_telefone  NUMBER(10) NOT NULL
);

ALTER TABLE t_pe_telefone_usuario ADD CONSTRAINT t_pe_telefone_usuario_pk PRIMARY KEY ( id_telefone );

CREATE TABLE t_pe_usuario (
    id_usuario   NUMBER(10) NOT NULL,
    nm_usuario   VARCHAR2(90) NOT NULL,
    nr_cpf       VARCHAR2(11) NOT NULL,
    nr_telefone  VARCHAR2(11) NOT NULL,
    ds_email     VARCHAR2(90) NOT NULL,
    ds_senha     VARCHAR2(100) NOT NULL
);

ALTER TABLE t_pe_usuario ADD CONSTRAINT t_porto_usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE t_pe_usuario_endereco (
    id_endereco            NUMBER(10) NOT NULL,
    id_usuario             NUMBER(10) NOT NULL,
    id_logradouro          NUMBER(10) NOT NULL,
    nr_logradouro          NUMBER(7),
    ds_complemento_numero  VARCHAR2(30),
    ds_ponto_referencia    VARCHAR2(50)
);

COMMENT ON COLUMN t_pe_usuario_endereco.nr_logradouro IS
    'Esse atributo irá receber o número do logradouro do endereco da Oficina.  Seu conteúdo é opcional.';

COMMENT ON COLUMN t_pe_usuario_endereco.ds_complemento_numero IS
    'Esse atributo irá receber o complemeneto  do logradouro do endereco da Oficina caso ele exista. Seu conteúdo é opcional.';

COMMENT ON COLUMN t_pe_usuario_endereco.ds_ponto_referencia IS
    'Esse atributo irá receber o ponto de referência  do logradouro do endereco da Oficina.';

ALTER TABLE t_pe_usuario_endereco ADD CONSTRAINT t_pe_usuario_endereco_pk PRIMARY KEY ( id_endereco );

CREATE TABLE t_pe_veiculo (
    id_veiculo        NUMBER(10) NOT NULL,
    id_usuario        NUMBER(10) NOT NULL,
    ds_marca          VARCHAR2(40) NOT NULL,
    ds_modelo         VARCHAR2(40) NOT NULL,
    dt_anolancamento  VARCHAR2(4) NOT NULL,
    ds_placa          VARCHAR2(7) NOT NULL,
    nr_rodas          NUMBER(8) NOT NULL
);

ALTER TABLE t_pe_veiculo ADD CONSTRAINT t_psa_veiculo_pk PRIMARY KEY ( id_veiculo,
                                                                       id_usuario );

ALTER TABLE t_pe_orcamento
    ADD CONSTRAINT fk_oficina_orcamento FOREIGN KEY ( id_oficina )
        REFERENCES t_pe_oficina ( id_oficina );

ALTER TABLE t_pe_logradouro
    ADD CONSTRAINT fk_pe_bairro_logradouro FOREIGN KEY ( id_bairro )
        REFERENCES t_pe_bairro ( id_bairro );

ALTER TABLE t_pe_bairro
    ADD CONSTRAINT fk_pe_cidade_bairro FOREIGN KEY ( id_cidade )
        REFERENCES t_pe_cidade ( id_cidade );

ALTER TABLE t_pe_cidade
    ADD CONSTRAINT fk_pe_estado_cidade FOREIGN KEY ( id_estado )
        REFERENCES t_pe_estado ( id_estado );

ALTER TABLE t_pe_diagnostico
    ADD CONSTRAINT relation_11 FOREIGN KEY ( id_orcamento )
        REFERENCES t_pe_orcamento ( id_orcamento );

ALTER TABLE t_pe_orcamento
    ADD CONSTRAINT relation_12 FOREIGN KEY ( id_veiculo,
                                             id_usuario )
        REFERENCES t_pe_veiculo ( id_veiculo,
                                  id_usuario );

ALTER TABLE t_pe_servico
    ADD CONSTRAINT relation_17 FOREIGN KEY ( id_diagnostico,
                                             id_orcamento )
        REFERENCES t_pe_diagnostico ( id_diagnostico,
                                      id_orcamento );

ALTER TABLE t_pe_telefone_usuario
    ADD CONSTRAINT relation_18 FOREIGN KEY ( id_usuario )
        REFERENCES t_pe_usuario ( id_usuario );

ALTER TABLE t_pe_veiculo
    ADD CONSTRAINT relation_19 FOREIGN KEY ( id_usuario )
        REFERENCES t_pe_usuario ( id_usuario );

ALTER TABLE t_pe_telefone_oficina
    ADD CONSTRAINT relation_20 FOREIGN KEY ( id_oficina )
        REFERENCES t_pe_oficina ( id_oficina );

ALTER TABLE t_pe_servico
    ADD CONSTRAINT relation_23 FOREIGN KEY ( id_peca )
        REFERENCES t_pe_peca ( id_peca );

ALTER TABLE t_pe_usuario_endereco
    ADD CONSTRAINT relation_25 FOREIGN KEY ( id_logradouro )
        REFERENCES t_pe_logradouro ( id_logradouro );

ALTER TABLE t_pe_usuario_endereco
    ADD CONSTRAINT relation_26 FOREIGN KEY ( id_usuario )
        REFERENCES t_pe_usuario ( id_usuario );

ALTER TABLE t_pe_oficina
    ADD CONSTRAINT relation_27 FOREIGN KEY ( id_logradouro )
        REFERENCES t_pe_logradouro ( id_logradouro );

ALTER TABLE t_pe_login_porto_seguro
    ADD CONSTRAINT relation_7 FOREIGN KEY ( id_usuario )
        REFERENCES t_pe_usuario ( id_usuario );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             31
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
