-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-02-13 13:57:05.693

-- tables
-- Table: Contratos
CREATE TABLE Contratos (
    NumeroUnico char(10)  NOT NULL,
    CNPJ char(14)  NOT NULL,
    Modalidade char(17)  NOT NULL,
    IndicadorPreFixado boolean  NOT NULL,
    DataVencimentoUltimaParcela date  NOT NULL,
    ValorContratadoFuturo decimal(10,2)  NOT NULL,
    QuantidadeParcelas int  NOT NULL,
    Pessoa_CPF char(11)  NOT NULL,
    CONSTRAINT Contratos_pk PRIMARY KEY (NumeroUnico)
);

-- Table: Pagamentos
CREATE TABLE Pagamentos (
    Index serial  NOT NULL,
    CNPJ char(14)  NOT NULL,
    DataVencimento date  NOT NULL,
    Valor decimal(10,2)  NOT NULL,
    DataPagamento date  NOT NULL,
    ValorPagamento decimal(10,2)  NOT NULL,
    Contratos_NumeroUnico char(10)  NOT NULL,
    Pessoa_CPF char(11)  NOT NULL,
    CONSTRAINT Pagamentos_pk PRIMARY KEY (Index)
);

-- Table: Pessoa
CREATE TABLE Pessoa (
    CPF char(11)  NOT NULL,
    CONSTRAINT Pessoa_pk PRIMARY KEY (CPF)
);

-- foreign keys
-- Reference: Contratos_Pessoa (table: Contratos)
ALTER TABLE Contratos ADD CONSTRAINT Contratos_Pessoa
    FOREIGN KEY (Pessoa_CPF)
    REFERENCES Pessoa (CPF)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_3_Contratos (table: Pagamentos)
ALTER TABLE Pagamentos ADD CONSTRAINT Table_3_Contratos
    FOREIGN KEY (Contratos_NumeroUnico)
    REFERENCES Contratos (NumeroUnico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Table_3_Pessoa (table: Pagamentos)
ALTER TABLE Pagamentos ADD CONSTRAINT Table_3_Pessoa
    FOREIGN KEY (Pessoa_CPF)
    REFERENCES Pessoa (CPF)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

