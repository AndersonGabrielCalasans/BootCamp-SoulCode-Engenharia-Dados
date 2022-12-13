CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes(
	id_cli INT AUTO_INCREMENT,
	nome_cli VARCHAR(200),
	cpf_cli VARCHAR(20) UNIQUE NOT NULL,
	CONSTRAINT PRIMARY KEY (id_cli)
);

CREATE TABLE carros(
	id_carro INT AUTO_INCREMENT,
	placa VARCHAR(10) NOT NULL,
	marca VARCHAR(20),
	modelo VARCHAR(20),
	cor VARCHAR(10),
	id_cli INT,
	CONSTRAINT PRIMARY KEY (id_carro),
	CONSTRAINT fk_idCli FOREIGN KEY id_cli 
    REFERENCES clientes(id_cli)	
);

CREATE TABLE acidentes(
	id_acidente INT AUTO_INCREMENT,
	data DATE,
	local VARCHAR(200),
	obs VARCHAR(200),
	id_carro INT,
	CONSTRAINT PRIMARY KEY (id_acidente),
	CONSTRAINT fk_idCar FOREIGN KEY id_carro 
    REFERENCES carros(id_carro)	
);

CREATE TABLE clientes_telefone(
	id INT AUTO_INCREMENT,
	telefone VARCHAR(20) NOT NULL,
	id_cli INT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT fk_idCli_tel FOREIGN KEY id_cli 
    REFERENCES clientes(id_cli)	
);

CREATE TABLE carros_sofrem_acidentes(
	id INT AUTO_INCREMENT,
	id_carro INT,
	id_acidente INT,
	CONSTRAINT PRIMARY KEY (id),
	CONSTRAINT fk_idCar_aci FOREIGN KEY id_carro 
    REFERENCES carros(id_carro),
    CONSTRAINT fk_idAcid_car FOREIGN KEY id_acidente 
    REFERENCES acidentes(id_acidente)
);
