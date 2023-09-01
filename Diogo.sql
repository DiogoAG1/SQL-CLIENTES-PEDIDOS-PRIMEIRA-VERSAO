/* Diogo: */

CREATE TABLE `senac` . `Clientes` (`ID` INT NOT NULL,
   `Cliente_Idade` INT NOT NULL,
    `Cliente_Email` CHAR(20) NOT NULL,
    `Cliente_Formacao` CHAR(50) NOT NULL,
    `Cliente_Nome` CHAR(50) NOT NULL,
    `Cliente_Endereco` CHAR(50) NOT NULL,
    `Cliente_Genero` CHAR(10) NOT NULL,
    `Cliente_Naturalidade` CHAR(30) NOT NULL,
    `Cliente_Nsocial` CHAR(50) NOT NULL,
    `Cliente_Bairro` CHAR(50) NOT NULL,
    `Cliente_Fone` INT NOT NULL,
    `Cliente_Profissao` CHAR(50) NOT NULL,
    `Cliente_RG` CHAR(7) NOT NULL,
    `Cliente_Salario` DECIMAL NOT NULL,
    `Cliente_Ecivil` CHAR(10) NOT NULL,
    `Cliente_CEP` CHAR(8) NOT NULL,
    `Cliente_UF` CHAR(2) NOT NULL,
    `Cliente_ID` INT NOT NULL,
    `Cliente_CPF` CHAR(11) NOT NULL ) ENGINE = InnoDB;
    PRIMARY KEY (Cliente_Nome, Cliente_Nsocial, Cliente_Fone, Cliente_ID, Cliente_CPF)
);

CREATE TABLE `senac` . `Pedidos` (
    'Pedido_TotalPedido' DECIMAL NOT NULL,
    'Pedido_Cupom' CHAR(10),
    'Pedido_IDCliente' INT NOT NULL,
    'Pedido_Data' DATE NOT NULL,
    'Pedido_CodPedido' CHAR(15),
    'Pedido_Hora' DATE NOT NULL,
    'Pedido_ID' INT NOT NULL,
    'Pedido_ValCupom' CHAR(10) NOT NULL ) ENGINE = InnoDB; 
    fk_Clientes_Cliente_Nome CHAR,
    fk_Clientes_Cliente_Nsocial CHAR,
    fk_Clientes_Cliente_Fone INT,
    fk_Clientes_Cliente_ID INTEGER,
    fk_Clientes_Cliente_CPF CHAR,
    PRIMARY KEY (Pedido_IDCliente, Pedido_Data, Pedido_CodPedido, Pedido_ID)
);

CREATE TABLE `senac` . `Funcionarios` (
    'Funcionarios_Convenio' CHAR(30),
    'Funcionarios_ID' INT NOT NULL,
    'Funcionarios_Horarios' DATE NOT NULL,
    'Funcionarios_Ecivil' CHAR(11) NOT NULL,
    'Funcionarios_DescontarIMP' BOOLEAN NOT NULL,
    'Funcionarios_Nome' CHAR(50) NOT NULL,
    'Funcionarios_RG' CHAR(12) NOT NULL,
    'Funcionarios_DescontarVT' BOOLEAN NOT NULL,
    'Funcionarios_Nsocial' CHAR(50),
    'Funcionarios_CodFunc' INT NOT NULL,
    'Funcionarios_Dependentes' INT,
    'Funcionarios_CPF' CHAR(11) NOT NULL,
    'Funcionarios_Cargo CHAR(40) NOT NULL,
    'Funcionarios_Salario' DECIMAL NOT NULL,
    'Funcionarios_DtaEncerramento' DATE NOT NULL,
    'Funcionarios_Pensao' INT NOT NULL,
    'Funcionarios_DtaAdmissao' DATE NOT NULL ) ENGINE = InnoDB; 
    PRIMARY KEY (Funcionarios_ID, Funcionarios_Nome, Funcionarios_Nsocial, Funcionarios_CodFunc, Funcionarios_CPF)
);

CREATE TABLE `senac` . `Produto` (
    'Produto_ValVenda' DECIMAL NOT NULL,
    'Produto_ValCompra' DECIMAL NOT NULL,
    'Produto_NF' CHAR(11) NOT NULL,
    'Produto_Validade' CHAR(15) NOT NULL,
    'Produto_ID' INT NOT NULL,
    'Produto_Fornecedor' CHAR(20) NOT NULL,
    'Produto_QTD' INT NOT NULL,
    'Produto_OBS' CHAR(30) NOT NULL,
    'Produto_Descricao' CHAR(50) NOT NULL,
    'Produto_DataUltCompra' DATE NOT NULL ) ENGINE = InnoDB; 
    PRIMARY KEY (Produto_ID, Produto_Fornecedor, Produto_Descricao)
);

CREATE TABLE `senac` . `Itens_Pedido` (
    'ItenPed_QTD' DECIMAL NOT NULL,
    'ItenPed_ID' INT NOT NULL,
    'ItenPed_ValVenda' DECIMAL NOT NULL,
    'ItenPed_CodPed' CHAR(11) NOT NULL,
    'ItenPed_IdProduto' INT NOT NULL ) ENGINE = InnoDB; 
    PRIMARY KEY (ItenPed_ID, ItenPed_CodPed, ItenPed_IdProduto)
);

CREATE TABLE `senac` . `Estacionamento` (
    'Estacionamento_Nvaga' INT NOT NULL,
    'Estacionamento_ID' INT NOT NULL,
    ''Estacionamento_Flamula' CHAR(15) NOT NULL,
    'Estacionamento_CodFunc` INT NOT NULL,
    `Estacionamento_PlacaCarro` INT NOT NULL ) ENGINE = InnoDB; 
    PRIMARY KEY (Estacionamento_Nvaga, Estacionamento_ID, Estacionamento_Flamula, Estacionamento_CodFunc, Estacionamento_PlacaCarro)
);

CREATE TABLE `senac` `PossuiProd` (
    fk_Produto_Produto_ID INTEGER,
    fk_Produto_Produto_Fornecedor CHAR,
    fk_Produto_Produto_Descricao CHAR,
    fk_Itens_Pedido_ItenPed_ID INTEGER,
    fk_Itens_Pedido_ItenPed_CodPed CHAR,
    fk_Itens_Pedido_ItenPed_IdProduto INTEGER
);

CREATE TABLE `senac` . `PossuiVaga` (
    fk_Estacionamento_Estacionamento_Nvaga INTEGER,
    fk_Estacionamento_Estacionamento_ID INTEGER,
    fk_Estacionamento_Estacionamento_Flamula CHAR,
    fk_Estacionamento_Estacionamento_CodFunc INTEGER,
    fk_Estacionamento_Estacionamento_PlacaCarro INTEGER,
    fk_Funcionarios_Funcionarios_ID INTEGER,
    fk_Funcionarios_Funcionarios_Nome CHAR,
    fk_Funcionarios_Funcionarios_Nsocial CHAR,
    fk_Funcionarios_Funcionarios_CodFunc INTEGER,
    fk_Funcionarios_Funcionarios_CPF CHAR
);

CREATE TABLE `senac` `PossuiItenPed` (
    fk_Pedidos_Pedido_IDCliente INTEGER,
    fk_Pedidos_Pedido_Data DATE,
    fk_Pedidos_Pedido_CodPedido CHAR,
    fk_Pedidos_Pedido_ID INTEGER,
    fk_Itens_Pedido_ItenPed_ID INTEGER,
    fk_Itens_Pedido_ItenPed_CodPed CHAR,
    fk_Itens_Pedido_ItenPed_IdProduto INTEGER
);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_2
    FOREIGN KEY (fk_Clientes_Cliente_Nome, fk_Clientes_Cliente_Nsocial, fk_Clientes_Cliente_Fone, fk_Clientes_Cliente_ID, fk_Clientes_Cliente_CPF)
    REFERENCES Clientes (Cliente_Nome, Cliente_Nsocial, Cliente_Fone, Cliente_ID, Cliente_CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE PossuiProd ADD CONSTRAINT FK_PossuiProd_1
    FOREIGN KEY (fk_Produto_Produto_ID, fk_Produto_Produto_Fornecedor, fk_Produto_Produto_Descricao)
    REFERENCES Produto (Produto_ID, Produto_Fornecedor, Produto_Descricao)
    ON DELETE SET NULL;
 
ALTER TABLE PossuiProd ADD CONSTRAINT FK_PossuiProd_2
    FOREIGN KEY (fk_Itens_Pedido_ItenPed_ID, fk_Itens_Pedido_ItenPed_CodPed, fk_Itens_Pedido_ItenPed_IdProduto)
    REFERENCES Itens_Pedido (ItenPed_ID, ItenPed_CodPed, ItenPed_IdProduto)
    ON DELETE SET NULL;
 
ALTER TABLE PossuiVaga ADD CONSTRAINT FK_PossuiVaga_1
    FOREIGN KEY (fk_Estacionamento_Estacionamento_Nvaga, fk_Estacionamento_Estacionamento_ID, fk_Estacionamento_Estacionamento_Flamula, fk_Estacionamento_Estacionamento_CodFunc, fk_Estacionamento_Estacionamento_PlacaCarro)
    REFERENCES Estacionamento (Estacionamento_Nvaga, Estacionamento_ID, Estacionamento_Flamula, Estacionamento_CodFunc, Estacionamento_PlacaCarro)
    ON DELETE SET NULL;
 
ALTER TABLE PossuiVaga ADD CONSTRAINT FK_PossuiVaga_2
    FOREIGN KEY (fk_Funcionarios_Funcionarios_ID, fk_Funcionarios_Funcionarios_Nome, fk_Funcionarios_Funcionarios_Nsocial, fk_Funcionarios_Funcionarios_CodFunc, fk_Funcionarios_Funcionarios_CPF)
    REFERENCES Funcionarios (Funcionarios_ID, Funcionarios_Nome, Funcionarios_Nsocial, Funcionarios_CodFunc, Funcionarios_CPF)
    ON DELETE SET NULL;
 
ALTER TABLE PossuiItenPed ADD CONSTRAINT FK_PossuiItenPed_1
    FOREIGN KEY (fk_Pedidos_Pedido_IDCliente, fk_Pedidos_Pedido_Data, fk_Pedidos_Pedido_CodPedido, fk_Pedidos_Pedido_ID)
    REFERENCES Pedidos (Pedido_IDCliente, Pedido_Data, Pedido_CodPedido, Pedido_ID)
    ON DELETE SET NULL;
 
ALTER TABLE PossuiItenPed ADD CONSTRAINT FK_PossuiItenPed_2
    FOREIGN KEY (fk_Itens_Pedido_ItenPed_ID, fk_Itens_Pedido_ItenPed_CodPed, fk_Itens_Pedido_ItenPed_IdProduto)
    REFERENCES Itens_Pedido (ItenPed_ID, ItenPed_CodPed, ItenPed_IdProduto)
    ON DELETE SET NULL;