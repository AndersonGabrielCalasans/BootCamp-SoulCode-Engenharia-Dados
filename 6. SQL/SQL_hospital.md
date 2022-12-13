CREATE DATABASE hospital;

USE hospital;

CREATE TABLE maes (
    id_mae INT AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    dt_nasc DATE NOT NULL,
    CONSTRAINT pk_idMae PRIMARY KEY (id_mae)
);

CREATE TABLE medicos (
    id_medico INT AUTO_INCREMENT,
    crm VARCHAR(20),
    nome VARCHAR(200) NOT NULL,
    especialidade VARCHAR(20),
    CONSTRAINT pk_idMedico PRIMARY KEY (id_medico)
);

CREATE TABLE medicos_celular (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL,
    fk_id_medico INT,
    CONSTRAINT fk_idMedico_num FOREIGN KEY (fk_id_medico) 
    REFERENCES medicos(id_medico)
);

CREATE TABLE bebes (
    id_bebe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    dt_nasc DATE NOT NULL,
    peso_nasc FLOAT,
    alt_nasc FLOAT,
    fk_id_mae INT,
    fk_id_medico INT,
    CONSTRAINT fk_idMae_bebe FOREIGN KEY (fk_id_mae) 
    REFERENCES maes(id_mae),
    CONSTRAINT fk_idMedico_bebe FOREIGN KEY (fk_id_medico) 
    REFERENCES medicos(id_medico)
);

INSERT INTO medicos VALUES (NULL, '65973624', 'Marcos Santana de Araujo', 'Obstetra');

INSERT INTO medicos VALUES (NULL, '35998745', 'Eliana Martins de Lima', 'Obstetra');

insert INTO maes VALUES (NULL, 'Juliana Santos', 'Rua Apolonio de Souza, 33', '(11)33339999', '1996-01-12'),
    (NULL, 'Priscila Sales', 'Avenida Paulista 1910', '(88)9.99990000', '1999-04-15'),
    (NULL, 'Tereza Cristina', 'Rua Zeca Teles de Meneses, 33', '(31)31111111', '1997-07-14');

INSERT INTO medicos_celular VALUES (NULL, '(11)9.00000000', 1),
 (NULL, '(11)9.11111111', 2),
 (NULL, '(11)9.22222222', 1),
 (NULL, '(11)9.22222223', 1);

INSERT INTO bebes VALUES (NULL, 'Joaquim da Silva', '2020-05-01', 3.250, 49, 2, 1),
 (NULL, 'Mariana Sales', '2021-07-26', 3.600, 51, 1, 2);

/* Adcionando coluna */
ALTER TABLE medicos
ADD especialidade VARCHAR(100);

/* alterar para UNIQUE */
ALTER TABLE medicos ADD UNIQUE(crm);

/* dropar coluna */
ALTER TABLE medicos
DROP COLUMN especialidade;

/* drop de tabela com fk */
SET FOREIGN_KEY_CHECKS = 0;
DROP medicos;
SET FOREIGN_KEY_CHECKS = 1;

/* MODIFICAR TIPO DA COLUNA */
ALTER TABLE bebes
MODIFY COLUMN alt_nasc FLOAT;

/* ALTERAR NOME DA COLUNA */
ALTER TABLE bebes
CHANGE altura_nasc alt_nasc;

/* adicionar um coluna e tornar fk */
ALTER TABLE medicos
ADD COLUMN email_medicos;

ALTER TABLE medicos
ADD FOREIGN KEY(email_medicos) REFERENCES email_medicos(id_email);

/* Zera a tabela medicos */
TRUNCATE TABLE medicos;




/* CONSULTAS */

/* CONSULTAS SIMPLES*/
SELECT * FROM bebes;

/* CONSULTAS COM ALIAS E RETORNO DE ALGUNS ATRIBUTOS*/
SELECT nome, dt_nasc AS data_nascimento FROM bebes;

/* CONSULTAS */
/* 1) Mostrar todos os bebês que nasceram com mais de 50 cm */
SELECT * FROM bebes 
WHERE alt_nasc > 50;

/* 2) Mostrar nome e telefone de todas as mães */
SELECT nome, telefone FROM maes;

/* 3) Mostrar todos os médicos em que a especialidade é Obstetra */
SELECT * FROM medicos 
WHERE especialidade = 'Obstetra';

/* 4) Mostrar todas as mães que nasceram nos anos de 1996 e 1997 */
SELECT * FROM maes 
WHERE YEAR(dt_nasc) BETWEEN 1996 AND 1997;

SELECT * FROM maes 
WHERE dt_nasc BETWEEN '1996-01-01' AND '1997-12-31';

/* 5) Mostrar todos os bebês que possuam menos de 3,300kg */
SELECT * FROM bebes
WHERE peso_nasc < 3.3;

/* 6) Mostrar o nome, crm e número de celular da Médica Eliana Martins de Lima */
SELECT medicos.nome, medicos.crm, medicos_celular.telefone 
FROM medicos INNER JOIN medicos_celular
ON medicos.id_medico = medicos_celular.fk_id_medico
WHERE medicos.nome = 'Eliana Martins de Lima';

SELECT medicos.nome, medicos.crm, medicos_celular.telefone 
FROM medicos INNER JOIN medicos_celular
ON medicos.id_medico = medicos_celular.fk_id_medico
WHERE medicos.id_medico = 2;

/* 7) Mostrar o nome do bebê, nome da mãe do bebê e o nome do médico que fez o parto. */
SELECT b.nome AS nome_bebe, ma.nome AS nome_mae, m.nome AS nome_medico
FROM bebes as b
INNER JOIN maes as ma
ON b.fk_id_mae = ma.id_mae
INNER JOIN medicos as m
ON b.fk_id_medico = m.id_medico;