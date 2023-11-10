CREATE DATABASE GerenciamentoEsto;

DROP DATABASE GerenciamentoEsto;

USE GerenciamentoEsto;

CREATE TABLE Produtos(
IdProduto INT AUTO_INCREMENT PRIMARY KEY,
NomeProduto VARCHAR(255) NOT NULL,
QntdE INT NOT NULL
);

INSERT INTO Produtos (NomeProduto, QntdE) VALUES ('Caderno', 100);
INSERT INTO Produtos (NomeProduto, QntdE) VALUES ('Borracha', 150);
INSERT INTO Produtos (NomeProduto, QntdE) VALUES ('Caneta', 200);


CREATE TABLE Vendas(
IdVenda INT AUTO_INCREMENT PRIMARY KEY,
DataVenda DATETIME NOT NULL
);

INSERT INTO Vendas (DataVenda) VALUES ('2023-11-09 10:00:00');
INSERT INTO Vendas (DataVenda) VALUES ('2023-11-10 09:15:00');
INSERT INTO Vendas (DataVenda) VALUES ('2023-11-09 14:30:00');

CREATE TABLE Itens_Vendas(
IdItem INT AUTO_INCREMENT PRIMARY KEY,
VendaId INT,
FOREIGN KEY (VendaId) REFERENCES Vendas (IdVenda),
ProdutoId INT,
FOREIGN KEY (ProdutoId) REFERENCES Produtos(IdProduto),
Qntd INT NOT NULL
);

INSERT INTO Itens_Vendas (VendaId, ProdutoId, Qntd) VALUES (1, 1, 5);
INSERT INTO Itens_Vendas (VendaId, ProdutoId, Qntd) VALUES (2, 3, 2);
INSERT INTO Itens_Vendas (VendaId, ProdutoId, Qntd) VALUES (3, 1, 10);



DELIMITER //
CREATE TRIGGER verificar_quantidade_estoque
BEFORE INSERT ON Itens_Vendas
FOR EACH ROW 
BEGIN
    DECLARE Quantidade INT;
        SELECT Quantidade_estoque INTO Quantidade
    FROM produtos
    WHERE IdProduto = NEW.ProdutoId;
	IF Quantidade < NEW.Qntd THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'ERRO: Produto fora do estoque.';
    END IF;
END;
// DELIMITER ;

SELECT * FROM Produtos;
