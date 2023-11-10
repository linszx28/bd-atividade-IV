CREATE DATABASE Loja;

SHOW databases;

USE Loja;

CREATE TABLE Loja.Produto (
ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
preco_unitario DOUBLE NOT NULL,
Categoria VARCHAR(255) NOT NULL
);

INSERT INTO Produto (ProdutoID, Nome, preco_unitario, Categoria)
VALUES (1, 'Shampo', 15.00, 'Higiene'),
    (2, 'Feijão', 20.00, 'Comida'),
    (3, 'Celular', 2.000, 'Tecnologia'),
    (4, 'Arroz', 20.00, 'Comida'),
    (5, 'Vassoura', 10.00, 'Limpeza');


CREATE TABLE Loja.Estoque (
ProdutoID INT NOT NULL,
Quantidade INT NOT NULL,
FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

INSERT INTO estoque (ProdutoID, Quantidade)
VALUES
    (1, 8),
    (2, 12),
    (3, 10),
    (4, 6),
    (5, 4);

CREATE VIEW estoque_critico AS
SELECT p.Nome AS p_nome, e.Quantidade AS e_Quantidade
FROM Produto p
INNER JOIN Estoque e ON p.ProdutoID = e.ProdutoID
WHERE e_Quantidade < 15000;