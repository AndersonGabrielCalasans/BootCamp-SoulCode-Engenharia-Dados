CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes(
	id_cli INT AUTO_INCREMENT,
	rg VARCHAR(20),
	nome VARCHAR(200),
	telefone VARCHAR(20),
	rua VARCHAR(120),
	num INT,
	bairro VARCHAR(120),
	cep VARCHAR(120),
	CONSTRAINT PRIMARY KEY (id_cli)
);

CREATE TABLE compras (
id_compra INT AUTO_INCREMENT,
data DATE NOT NULL,
valor FLOAT NOT NULL,
id_cli INT,
CONSTRAINT pk_id_compra PRIMARY KEY(id_compra),
CONSTRAINT fk_idCli FOREIGN KEY(id_cli) REFERENCES clientes(id_cli)
ON UPDATE CASCADE
ON DELETE CASCADE
);

CREATE TABLE produtos (
id_prod INT AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
tipo VARCHAR(20),
preco float NOT NULL,
estoque INT NOT NULL,
CONSTRAINT PRIMARY KEY (id_prod)
);

CREATE TABLE compras_contem_produtos (
id INT AUTO_INCREMENT,
fk_id_compra INT,
fk_id_prod INT,
quantidade INT NOT NULL,
CONSTRAINT PRIMARY KEY (id),
CONSTRAINT fk_idComp FOREIGN KEY (fk_id_compra) 
REFERENCES compras(id_compra)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT fk_idProd FOREIGN KEY (fk_id_prod) 
REFERENCES produtos(id_prod)
ON UPDATE CASCADE
ON DELETE CASCADE	
);

/* alterar constraint */
ALTER TABLE tabela
ADD CONSTRAINT fk_nome_da_constraint
FOREIGN KEY(atributo_chave)
REFERENCES tabela(atributo_chave)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE clientes
ADD COLUMN (
cidade VARCHAR(20),
estado VARCHAR(20));

/* zerando tabela com fk */
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE compras;
SET FOREIGN_KEY_CHECKS = 1;

/* populando banco de dados */
/* clientes */
INSERT INTO clientes VALUES (NULL,	'42.515.012-4',	'Leonardo Diego das Neves', '(68)9.8106-8326', 'Avenida Santos Dumont',	160, 'Centro', '69934-970',	'Epitaciolândia', 'AC'),
(NULL,	'35.993.799-8',	'Vallentina Jenniffer Livia', '(64) 98941-7452', 'Avenida 11 de Novembro',	729, 'Setor Central', '75619-970', 'Aloândia', 'GO'),
(NULL,	'14.594.456-6',	'Benedito Henry Teixeira', '(88) 99690-4161', 'Rua Eduardo Mota', 640, 'Centro', '62420-970','Chaval', 'CE'),
(NULL,	'11.946.174-2',	'Mariah Jaqueline Aparício', '(88) 3753-8770', 'Rua Santa Isabel', 539,	'São Miguel', '63010-555', 'Juazeiro do Norte',	'CE'),
(NULL,	'27.722.583-8',	'Alice Pietra Ramos', '(31) 99404-8773', 'Rua Doutor Álvaro Lobo Leite', 521, 'Centro',	'36419-970', 'Lobo Leite', 'MG'),
(NULL,	'38.895.346-9',	'Mário Márcio Ruan Pinto', '(13) 98485-6954', 'Rua Rubião Júnior', 418, 'Centro', '11013-210', 'Santos', 'SP');

/* compras */
INSERT INTO compras VALUES (NULL, '2022-10-05', 58.8, 4),
(NULL, '2022-10-05', 110, 1),
(NULL, '2022-10-07', 81.7, 3),
(NULL, '2022-10-07', 51, 6);

/* produtos */
INSERT INTO produtos VALUES (NULL, 'Energético TNT 269ML', 'Bebidas', 5.5, 35),
(NULL, 'Arroz Juliano Parboilizado', 'Arroz', 4.5, 150),
(NULL, 'Arroz Juliano Branco', 'Arroz', 4.2, 122),
(NULL, 'Coca Cola 1 litro',	'Bebidas', 8.5,	36),
(NULL, 'Biscoito Recheado Bolão Morango', 'Doces', 2.7, 45),
(NULL, 'Água Mineral sem Gás', 'Bebidas', 2, 266),
(NULL, 'Chocolate Gutti Gutti 50g',	'Doces', 1.9, 61),
(NULL, 'Suco de Laranja Laranjinha', 'Bebidas', 3, 16);

/* compras_contem_produtos */
INSERT INTO compras_contem_produtos VALUES (NULL, 1, 3, 10),
(NULL,	1, 5, 4),
(NULL,	1, 8, 2),
(NULL,	2, 2, 20),
(NULL,	2, 6, 10),
(NULL,	3, 1, 4),
(NULL,	3, 3, 10),
(NULL,	3, 7, 3),
(NULL,	3, 8, 4),
(NULL, 4,	4, 6);


/* 1) Mostrar todos os dados de Clientes */
SELECT * FROM clientes;

/* 2) Mostrar nome, rg e telefone dos Clientes */					
SELECT nome, rg e telefone FROM clientes;

/* 3) Mostrar nome e preço de Todos os Produtos */
SELECT nome, preco FROM produtos;

/* 4) Mostrar Nome, preço e estoque das Bebidas	*/
SELECT nome, preco, estoque FROM produtos
WHERE tipo = 'Bebidas';

/* 5) Mostrar todos os produtos com preço acima de 5 reais */
SELECT * produtos
WHERE preco > 5;

/* 6) Mostrar a quantidade total de produtos em estoque. */				
SELECT SUM(estoque) AS estoque_total FROM produtos;

/* 7) Mostrar a soma de todas as compras. */
SELECT SUM(valor) FROM compras;

/* 8) Mostrar todos os produtos ordenados pelo nome (A-Z) */
SELECT * FROM produtos
ORDER BY nome;

/* 9) Mostrar o nome e o valor total da compra realizada pela cliente Mariah Jaqueline Aparício	*/
SELECT cli.nome, SUM(comp.valor) AS total
FROM clientes AS cli
INNER JOIN compras AS comp
ON cli.id_cli = comp.id_cli
WHERE cli.id_cli = 4;

/* 10) Mostrar todos os cliente que são do estado de SP ou do  CE. */
SELECT * FROM clientes
WHERE estado = 'SP' OR estado = 'CE';

/* 11) Mostrar todos os cliente que são do estado do CE e do bairro Centro.	*/
SELECT * FROM clientes
WHERE estado = 'CE' AND bairro = 'Centro';

/* 12)Mostrar a lista de produtos ordenado pelo preço do menor para o maior. */
SELECT * FROM produtos
ORDER BY preco DESC;

/* 13) Mostrar uma lista dos produtos que foram comprados pelo cliente Benedito Henry Teixeira, bem como seu nome e endereço completo. */
SELECT prod.nome, cli.nome, cli.rua, cli.num, cli.bairro, cli.cidade, cli.estado, cli.cep
FROM clientes AS cli
INNER JOIN compras AS comp
ON cli.id_cli = comp.id_cli
INNER JOIN compras_contem_produtos AS cp
ON cp.fk_id_compra = comp.id_compra
INNER JOIN produtos AS prod
ON cp.fk_id_prod = prod.id_prod
WHERE cli.id_cli = 3;

/* 14) Mostrar a quantidade de clientes que são do estado do CE. */
SELECT COUNT(*) AS num_clientes FROM clientes
WHERE estado = 'CE';

/* 15) Mostrar a soma dos estoques de todas as bebidas do estabelecimento. */
SELECT SUM(estoque) AS qnt_bebidas FROM produtos
WHERE tipo = 'bebidas';

