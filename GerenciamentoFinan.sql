CREATE DATABASE Financas;

DROP DATABASE Financas;

USE Financas;

CREATE TABLE Contas(
IdConta INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(255) NOT NULL,
Saldo DECIMAL(10,2) NOT NULL
);

INSERT INTO Contas(Nome, Saldo) VALUES ('Thalita', 1200.00);
INSERT INTO Contas(Nome, Saldo) VALUES ('Thiago', 1400.00);


CREATE TABLE Transacoes(
IdTransacao INT AUTO_INCREMENT PRIMARY KEY,
ContaId INT,
FOREIGN KEY (ContaId) REFERENCES Contas (IdConta),
Tipo VARCHAR(20) NOT NULL,
Valor DECIMAL(10,2) NOT NULL
);

INSERT INTO Transacoes(ContaId, Tipo, Valor) VALUES (1, 'Conta Corrente', 1300.00);
INSERT INTO Transacoes(ContaId, Tipo, Valor) VALUES (2, 'Conta Poupança', 1500.00);


DELIMITER //

CREATE TRIGGER autualizar_saldo_conta
AFTER INSERT ON Transacoes
FOR EACH ROW
BEGIN
	IF NEW.tipo = 'entrada' THEN
		UPDATE Contas
		SET Saldo = Saldo + NEW.Valor
		WHERE IdConta = NEW.ContaId;
    ELSE
    UPDATE Contas
    SET Saldo = Saldo - NEW.Valor
    WHERE IdConta = NEW.ContaId;
    
END IF;
END
    
// DELIMITER ;

SELECT * FROM Transacoes;