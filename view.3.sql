
CREATE DATABASE Empresa;

SHOW DATABASES;

USE Empresa;

CREATE TABLE Empresa.Funcionarios(
FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Cargo VARCHAR(255) NOT NULL,
Salario DOUBLE NOT NULL
);

INSERT INTO Funcionarios (FuncionarioID, Nome, Cargo, Salario)
VALUES
    (1, 'Carlos', 'Vendedor', 2500.00),
    (2, 'Luizão', 'Gerente', 3500.00),
    (3, 'Kaique', 'Vendedor', 2400.00),
    (4, 'Augusto', 'Vendedor', 2300.00),
    (5, 'Gustavo', 'Gerente', 3600.00);
    
 CREATE TABLE Empresa.Vendas(
 VendaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
 FuncionarioID INT NOT NULL,
 DataVenda DATE NOT NULL, 
 ValorVenda DOUBLE NOT NULL,
 FOREIGN KEY (FuncionarioID) REFERENCES Funcionarios(FuncionarioID)
 );

INSERT INTO Vendas (VendaID, FuncionarioID, DataVenda, VAlorVenda)
VALUES
    (1, 1, '2023-01-10', 80.00),
    (2, 1, '2023-02-15', 55.50),
    (3, 2, '2023-02-20', 200.00),
    (4, 3, '2023-03-05', 34.00),
    (5, 4, '2023-04-01', 400.75);
    
    
CREATE VIEW relatorio_vendas_funcionario AS
SELECT f.Nome AS nome_funcionario, COUNT(v.VendaID) AS numero_vendas, SUM(v.ValorVenda) AS valor_total_vendas
FROM Funcionarios f
LEFT JOIN Vendas v ON f.FuncionarioID = v.FuncionarioID
GROUP BY f.Nome;

SELECT * FROM relatorio_vendas_funcionario;