CREATE DATABASE Shopping;

SHOW DATABASES;

USE Shopping;

CREATE TABLE Shopping.Categorias(
CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL, 
Descricao VARCHAR(255) NOT NULL
);

INSERT INTO Categorias (CategoriaID, Nome, Descricao)
VALUES
    (1, 'Limpeza', 'Algo para limpeza'),
    (2, 'Higiene', 'ALgo para higiene'),
    (3, 'Comida', 'ALgo para comer');
    
    
CREATE TABLE Shopping.Produtos(
ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
CategoriaID INT NOT NULL,
Nome VARCHAR(255) NOT NULL, 
PrecoUnitario DOUBLE NOT NULL,
FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

INSERT INTO Produtos (ProdutoID, Nome, PrecoUnitario, CategoriaID)
VALUES
    (1, 'Vassoura', 10.00, 1),
    (2, 'Sabao', 20.00, 2),
    (3, 'Feijao', 15.00, 1);
   

CREATE VIEW relatorio_produtos_categoria AS
SELECT c.Nome AS nome_categoria, COUNT(p.ProdutoID) AS quantidade_de_produtos
FROM Categorias c
LEFT JOIN Produtos p ON c.CategoriaID = p.CategoriaID
GROUP BY c.Nome;

SELECT * FROM relatorio_produtos_categoria;