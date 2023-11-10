CREATE DATABASE Registro;

SHOW DATABASES;

USE Registro;

CREATE TABLE Registro.Clientes (
ClienteID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(255) NOT NULL
);

INSERT INTO Clientes (ClienteID, Nome, Endereco, Cidade)
VALUES
    (1, 'João', 'Rua dos Beija Flores', 'Salvador'),
    (2, 'Felipe', 'Rua da Saudade', 'Conde'),
    (3, 'Luiz', 'Ruas dos Antes', 'Barra Itariri'),
    (4, 'Vitor', 'Rua das Gaivotas', 'Arembepe'),
    (5, 'Gabriel', 'Rua das Flores', 'Jauá');
    
 CREATE TABLE Registro.Pagamentos (
PagamentoID INT AUTO_INCREMENT PRIMARY KEY,
ClienteID INT NOT NULL,
Nome VARCHAR(255) NOT NULL,
DataPagamento DATE NOT NULL,
ValorPagamento DOUBLE NOT NULL,
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

INSERT INTO Pagamentos (PagamentoID, ClienteID, DataPagamento, ValorPagamento )
VALUES
    (1, 1, '2023-01-10', 100.00),
    (2, 1, '2023-02-15', 75.50),
    (3, 2, '2023-02-20', 200.00),
    (4, 3, '2023-03-05', 50.25),
    (5, 4, '2023-04-01', 300.75); 
    
 CREATE VIEW relatorio_pagamentos_cidade AS
SELECT c.Cidade AS nome_cidade, SUM(p.ValorPagamento) AS valor_total_pagamentos
FROM Clientes c
LEFT JOIN Pagamentos p ON c.ClienteID = p.ClienteID
GROUP BY c.Cidade;   
    

 
    



