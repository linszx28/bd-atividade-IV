CREATE DATABASE Adm;

SHOW DATABASES;

USE Adm;

CREATE TABLE Adm.Cliente (
ClienteID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL,
Telefone VARCHAR(255) NOT NULL
);

INSERT INTO Adm.Cliente(Nome, Email, Telefone)
VALUES ('Luiz', 'Luizfelipe@gmail.com', "7198875451"),
('Pontes', 'Pontes@gmail.com', "71584968"),
('Matheus', 'Matheus@gmail.com', "719554862"),
('Bruno', 'Bruno@gmail.com', "719655482"),
 ('Isabel', 'Isabel@gmai.com', "719658475");
 
 
CREATE TABLE Adm.Pedido (
PedidoID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
DataIncio DATE NOT NULL,
ValorTotal DOUBLE NOT NULL,
ClienteID INT NOT NULL,
FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

INSERT INTO Adm.Pedido(Nome, DataIncio, ValorTotal, ClienteID)
VALUES ('Vassoura', 2008-05-05, 50.00, 1); 

CREATE VIEW _relatorios_pedidos_cliente  AS
SELECT C.Nome AS NomeCLiente, COUNT(PedidoID) AS numeroPedido, SUM(ValorTotal) AS ValorTotal_Gasto
FROM Cliente c
LEFT JOIN Pedido p ON c.ClienteID = p.ClienteID
GROUP BY c.Nome;
 
SELECT * FROM _relatorios_pedidos_cliente;

