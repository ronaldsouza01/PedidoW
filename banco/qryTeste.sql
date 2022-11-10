CREATE TABLE clientes (
    codcli bigserial NOT NULL,
	nmcliente varchar(100) NOT NULL,
	nmcidade varchar(100) NOT NULL,
	nmuf varchar(2) NOT NULL,
	CONSTRAINT clientes_pk PRIMARY KEY (codcli)
);

INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Maria Aparecida da Silva','Sao Paulo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Jose de Oliveira','Rio de Janeiro','RJ');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Carlos da Silva Ferreira','Curitiba','PR');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Andrea Peixoto Gomide','Salvador','BA');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Rita de Cassia Andrade','Manaus','AM');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Washington Olivetto','Porto Alegre','RS');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Ricardo da Costa Moreira','Fortaleza','CE');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Silvia de Oliveira Machado','Botucatu','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Andressa Cristina da Cruz','Campinas','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Maria Eduarda Correa','Petropolis','RJ');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Cristina Apolinario de Oliveira','Belo Horizonte','MG');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Miriam Rocha','Volta Redonda','RJ');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Cassio de Oliveira','Vinhedo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Jose Eduardo Marcolino','Porto Alegre','RS');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Carolina Marques da Silva','Rio de Janeiro','RJ');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Josue de Oliveira Santos','Sao Paulo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Camila de Oliveira Parizoto','Confins','MG');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Maria Paula dos Santos','Sao Paulo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Cintia Chagas','Sao Paulo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Claudia Inacio da Silva','Sao Bernardo do Campo','SP');
INSERT INTO clientes (nmcliente,nmcidade,nmuf) values ('Juliane de Castro Silva','Sao Paulo','SP');

CREATE TABLE produto (
    codproduto bigserial NOT NULL,
	nmproduto varchar(100) NOT NULL,
	vlpreco decimal(9,2) NOT NULl,
	CONSTRAINT produto_pk PRIMARY KEY (codproduto)
);

INSERT INTO produto (nmproduto,vlpreco) VALUES ('TV 43',237.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('TV 48',337.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('TV 55',437.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('TV 60',537.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Projetor 1744',127.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Soundbar 1425',207.25);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Soundbar 1435',307.25);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Soundbar 1445',407.25);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Soundbar 1455',507.25);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Monitor 10',237.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Monitor 14',247.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Monitor 19',257.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Monitor 20',267.85);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Ventilador 8',684.19);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Ventilador 10',784.19);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Ventilador 12',884.19);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Ventilador 14',984.19);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Ventilador 8',684.19);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Aspirador de po branco',483.21);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Aspirador de po azul',483.21);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Aspirador de po vermelho',483.21);
INSERT INTO produto (nmproduto,vlpreco) VALUES ('Aspirador de po laranja',483.21);


CREATE TABLE pedido (
       codpedido bigserial NOT NULL,
	   dtemissao date NOT NULL,
	   codcli bigint NOT NULL,
	   vlTotal decimal(9,2) NULL,
	   CONSTRAINT pedido_pk PRIMARY KEY (codpedido),
	   CONSTRAINT pedido_fk_cliente FOREIGN KEY (codcli) 
	   REFERENCES clientes(codcli)
);

CREATE TABLE itens (
       coditem bigserial NOT NULL,
       codpedido bigint NOT NULL,
	   codproduto bigint NOT NULL,
	   quantidade decimal(9,2) NOT NULL,
	   vlunitario decimal(9,2) NOT NULL,
	   vlTotal decimal(9,2) NULL,
	   CONSTRAINT itens_pk PRIMARY KEY (coditem),
	   CONSTRAINT itens_fk_pedido FOREIGN KEY (codpedido) 
	   REFERENCES pedido(codpedido),
	   CONSTRAINT itens_fk_produto FOREIGN KEY (codproduto)
	   REFERENCES produto(codproduto)
);
CREATE UNIQUE INDEX idxPedido ON itens (codpedido,coditem);