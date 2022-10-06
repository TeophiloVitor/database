CREATE DATABASE Ifood;

--Use the database Ifood
USE Ifood;


CREATE TABLE IF NOT EXISTS Usuario
(
    CPF VARCHAR(15) PRIMARY KEY, -- Primary Key column
    Email VARCHAR(100) NOT NULL UNIQUE ,
    Nome VARCHAR(100) NOT NULL ,
    Senha VARCHAR(100) NOT NULL ,
    Endereco VARCHAR(100) NOT NULL ,
    DataNascimento DATE NOT NULL,
    Telefone VARCHAR(100) NOT NULL UNIQUE
)


CREATE TABLE IF NOT EXISTS Entregador
(
    CPF VARCHAR(15) PRIMARY KEY, -- Primary Key column
    CNH VARCHAR(11) NOT NULL UNIQUE,

    FOREIGN KEY (CPF) REFERENCES Usuario (CPF)
)


CREATE TABLE IF NOT EXISTS Loja(
	CNPJ INT PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	Telefone VARCHAR(12) NOT NULL,
	Hora_Abre TIME(0) NOT NULL,
	Hora_Fecha TIME(0) NOT NULL
)


CREATE TABLE IF NOT EXISTS Produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	preco DECIMAL(10,2) NOT NULL,
	cnpj_loja INT NOT NULL,

	FOREIGN KEY (cnpj_loja) REFERENCES Loja(CNPJ)
)


CREATE TABLE IF NOT EXISTS Pedidos(
	id_pedido INT  AUTO_INCREMENT PRIMARY KEY,
	status VARCHAR(45) NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	data DATETIME NOT NULL,
	id_cliente VARCHAR(15) NOT NULL,
	id_entregador VARCHAR(15) NOT NULL,

	FOREIGN KEY (id_cliente) REFERENCES Usuario(CPF),
	FOREIGN KEY (id_entregador) REFERENCES Entregador(CPF)
)

CREATE TABLE IF NOT EXISTS Pedidos_Produtos(

	id_produto INT NOT NULL,
	id_pedido INT NOT NULL,

	PRIMARY KEY (id_produto, id_pedido),
	FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
	FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
)



CREATE TABLE IF NOT EXISTS Cartao
(
    Numero VARCHAR(20) PRIMARY KEY, -- Primary Key column
    Nome_titular VARCHAR(100) NOT NULL UNIQUE ,
    Bandeira VARCHAR(20) NOT NULL ,
    Validade DATE NOT NULL ,
    CV VARCHAR(3) NOT NULL ,
    CPF VARCHAR(15)
)


CREATE TABLE IF NOT EXISTS Usuario_Cartao(

	Numero_Cartao VARCHAR(20)  NOT NULL,
	cpf_cliente VARCHAR(15) NOT NULL,

	PRIMARY KEY (Numero_Cartao, cpf_cliente),
	FOREIGN KEY (Numero_Cartao) REFERENCES Cartao(Numero),
	FOREIGN KEY (cpf_cliente) REFERENCES Usuario(CPF)
)

CREATE TABLE IF NOT EXISTS Pagamento(

	id_cartao VARCHAR(20)  NOT NULL,
	id_pedido INT NOT NULL,

	PRIMARY KEY (id_cartao, id_pedido),
	FOREIGN KEY (id_cartao) REFERENCES Cartao(Numero),
	FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
)


//Insert USUARIOS
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES 
('123.456.789-10','teste@gmail.com', 'Maylo', 'teste123', 'Rua das Montanhas-Natal/RN', '1997/01/01', '84912346789');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('123.456.719-10','teste1@gmail.com', 'Vinicius', 'teste123','Rua dos Vilarejos-Mossoro/RN', '1998/01/01', '84992346789');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('123.456.729-10','teste2@gmail.com', 'Mizael', 'teste123', 'Rua dos Vilarejos-Mossoro/RN', '2005/01/01', '84999346789');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('123.456.739-10', 'teste3@gmail.com', 'Ricardo', 'teste123', 'Rua dos Carnaubenses-Natal/RN', '2000/01/01', '84999946789');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('132.456.879-11', 'teste4@gmail.com', 'Rich', 'teste123', 'Rua dos Bouganvilles-Natal/RN', '1980/01/01', '84999946779');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('132.456.809-11', 'teste5@gmail.com', 'Richard', 'teste123', 'Rua das Palmeiras-Natal/RN', '1985/01/01', '84999946769');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('132.456.819-11', 'teste6@gmail.com', 'Ferdinand', 'teste123', 'Rua das Dunas-Natal/RN', '1986/01/01', '84999946759');
INSERT INTO Usuario(CPF, Email, Nome, Senha, Endereco, DataNascimento, Telefone) VALUES ('132.456.829-11', 'teste7@gmail.com', 'Charles', 'teste123', 'Rua do Café-Natal/RN', '1987/01/01', '84999946749');

INSERT INTO ENTREGADOR(CPF, CNH) VALUES ('132.456.879-11', '12345678901');
INSERT INTO ENTREGADOR(CPF, CNH) VALUES ('132.456.809-11', '12345678902');
INSERT INTO ENTREGADOR(CPF, CNH) VALUES ('132.456.819-11', '12345678903');
INSERT INTO ENTREGADOR(CPF, CNH) VALUES ('132.456.829-11', '12345678904');


//INSERT LOJAS
INSERT INTO LOJA(cnpj, Nome, Endereco, Telefone, Hora_Abre, Hora_Fecha) VALUES (03245789, 'Bar do Maylo', 'Rua das Goiabeiras, Trindade-Pe', '84992316789', '17:00:00', '00:00:00');
INSERT INTO LOJA(cnpj, Nome, Endereco, Telefone, Hora_Abre, Hora_Fecha) VALUES (03245780, 'Bar da Mãe', 'Rua dos Estudantes, Natal-Rn', '84992315555', '10:00:00', '22:00:00');
INSERT INTO LOJA(cnpj, Nome, Endereco, Telefone, Hora_Abre, Hora_Fecha) VALUES (03245781, 'Bar do Filho da Mãe', 'Rua dos Estudantes, Natal-Rn', '84992314444', '10:00:00', '22:00:00');



INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Brahma Puro Malte 600ml', '8.00', 03245789);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Devassa Puro Malte 600ml', '6.50', 03245789);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Heineken 600ml', '12.00', 03245789);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Coca-Cola 1L', '6.00', 03245789);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Guaraná 1L', '6.00', 03245789);

INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Brahma Puro Malte 600ml', '7.50', 03245780);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Devassa Puro Malte 600ml', '7.00',03245780);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Heineken 600ml', '12.00', 03245780);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ('Coca-Cola 1L', '6.00', 03245780);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Guaraná 1L', '6.00', 03245780);

INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Brahma Puro Malte 600ml', '7.00', 03245781);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Devassa Puro Malte 600ml', '7.00',03245781);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Heineken 600ml', '13.00', 03245781);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Coca-Cola 1L', '5.50', 03245781);
INSERT INTO PRODUTOS(nome, preco, cnpj_loja) VALUES ( 'Guaraná 1L', '5.50', 03245781);



INSERT INTO PEDIDOS(id_pedido, status, valor, data, id_cliente, id_entregador) VALUES ('Entregue', '80.00', '2022-07-10 17:45:56', '123.456.789-10', '132.456.879-11');
INSERT INTO PEDIDOS(id_pedido, status, valor, data, id_cliente, id_entregador) VALUES ('Entregue', '120.00', '2022-07-10 18:45:56', '123.456.789-10', '132.456.809-11');
INSERT INTO PEDIDOS(id_pedido, status, valor, data, id_cliente, id_entregador) VALUES ('Entregue', '60.00', '2022-07-10 19:45:56', '123.456.719-10', '132.456.819-11');
INSERT INTO PEDIDOS(id_pedido, status, valor, data, id_cliente, id_entregador) VALUES ('Entregue', '70.00', '2022-07-11 19:30:56', '123.456.729-10', '132.456.829-11');
INSERT INTO PEDIDOS(id_pedido, status, valor, data, id_cliente, id_entregador) VALUES ('Entregue', '80.00', '2022-07-11 20:45:56', '123.456.739-10', '132.456.879-11');


INSERT INTO Pedidos_Produtos(id_produto, id_pedido) VALUES (1,1);
INSERT INTO Pedidos_Produtos(id_produto, id_pedido) VALUES (3,2);
INSERT INTO Pedidos_Produtos(id_produto, id_pedido) VALUES (7,3);
INSERT INTO Pedidos_Produtos(id_produto, id_pedido) VALUES (9,4);
INSERT INTO Pedidos_Produtos(id_produto, id_pedido) VALUES (5,5);


UPDATE USUÁRIO SET nome = 'Ermenegildo' WHERE cpf = '123.456.789-10';
UPDATE LOJA SET Hora_Abre = '15:00:00', Hora_Fecha = '22:00:00' WHERE cnpj = 03245789;


SELECT Loja.nome, Produtos.nome, Pedidos.id_cliente FROM Loja, Produtos, Pedidos;
SELECT Loja.nome, Produtos.nome, Pedidos.id_cliente FROM Loja, Produtos, Pedidos WHERE Produtos.nome='Brahma Puro Malte 600ml';
SELECT Loja.nome, Produtos.nome, Pedidos.id_cliente FROM Loja, Produtos, Pedidos WHERE Produtos.nome='Brahma Puro Malte 600ml' AND Pedidos.id_cliente='123.456.789-10';

