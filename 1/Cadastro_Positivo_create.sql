-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-02-10 13:51:45.028

-- tables
-- Table: Cliente
CREATE TABLE Cliente (
    IdfcCli char(10)  NOT NULL,
    EnvioHistoricoCredito_CnpjIf char(18)  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY (IdfcCli)
);

-- Table: DetalheOperacao
CREATE TABLE DetalheOperacao (
    Operacao_NrUnco char(10)  NOT NULL,
    InPreFix char(10)  NOT NULL,
    DtVnctUltPcl date  NOT NULL,
    VlCtrdFut decimal(10,2)  NOT NULL,
    QtPcl int  NOT NULL,
    CONSTRAINT DetalheOperacao_pk PRIMARY KEY (Operacao_NrUnco)
);

-- Table: EnvioHistoricoCredito
CREATE TABLE EnvioHistoricoCredito (
    CnpjIf char(18)  NOT NULL,
    DtRms date  NOT NULL,
    CONSTRAINT EnvioHistoricoCredito_pk PRIMARY KEY (CnpjIf)
);

-- Table: Operacao
CREATE TABLE Operacao (
    NrUnco char(10)  NOT NULL,
    Cliente_IdfcCli char(10)  NOT NULL,
    DtCtrc date  NULL,
    DtAprc date  NULL,
    CdMdld char(10)  NULL,
    CONSTRAINT Operacao_pk PRIMARY KEY (NrUnco)
);

-- Table: PagamentoParcelaAnterior
CREATE TABLE PagamentoParcelaAnterior (
    index serial  NOT NULL,
    DtPgtoPclAnt date  NOT NULL,
    VlPgtoPclAnt decimal(10,2)  NOT NULL,
    ParcelaAnterior_index int  NOT NULL,
    CONSTRAINT PagamentoParcelaAnterior_pk PRIMARY KEY (index)
);

-- Table: ParcelaAnterior
CREATE TABLE ParcelaAnterior (
    index serial  NOT NULL,
    Operacao_NrUnco char(10)  NOT NULL,
    DtVnctPclAnt date  NOT NULL,
    VlPclAnt decimal(10,2)  NOT NULL,
    CONSTRAINT ParcelaAnterior_pk PRIMARY KEY (index)
);

-- Table: ParcelasFuturas
CREATE TABLE ParcelasFuturas (
    index serial  NOT NULL,
    DtVnctPrxPcl date  NOT NULL,
    VlPrxPcl decimal(10,2)  NOT NULL,
    QtPclVncr int  NOT NULL,
    QtPclPgr int  NOT NULL,
    Operacao_NrUnco char(10)  NOT NULL,
    CONSTRAINT ParcelasFuturas_pk PRIMARY KEY (index)
);

-- foreign keys
-- Reference: Cliente_EnvioHistoricoCredito (table: Cliente)
ALTER TABLE Cliente ADD CONSTRAINT Cliente_EnvioHistoricoCredito
    FOREIGN KEY (EnvioHistoricoCredito_CnpjIf)
    REFERENCES EnvioHistoricoCredito (CnpjIf)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: DetalheOperacao_Operacao (table: DetalheOperacao)
ALTER TABLE DetalheOperacao ADD CONSTRAINT DetalheOperacao_Operacao
    FOREIGN KEY (Operacao_NrUnco)
    REFERENCES Operacao (NrUnco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Operacao_Cliente (table: Operacao)
ALTER TABLE Operacao ADD CONSTRAINT Operacao_Cliente
    FOREIGN KEY (Cliente_IdfcCli)
    REFERENCES Cliente (IdfcCli)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PagamentoParcelaAnterior_ParcelaAnterior (table: PagamentoParcelaAnterior)
ALTER TABLE PagamentoParcelaAnterior ADD CONSTRAINT PagamentoParcelaAnterior_ParcelaAnterior
    FOREIGN KEY (ParcelaAnterior_index)
    REFERENCES ParcelaAnterior (index)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ParcelaAnterior_Operacao (table: ParcelaAnterior)
ALTER TABLE ParcelaAnterior ADD CONSTRAINT ParcelaAnterior_Operacao
    FOREIGN KEY (Operacao_NrUnco)
    REFERENCES Operacao (NrUnco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ParcelasFuturas_Operacao (table: ParcelasFuturas)
ALTER TABLE ParcelasFuturas ADD CONSTRAINT ParcelasFuturas_Operacao
    FOREIGN KEY (Operacao_NrUnco)
    REFERENCES Operacao (NrUnco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

