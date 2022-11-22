-- apagar o banco de dados
drop database dbCDS;

-- criando banco de dados
create database dbCDS;

-- visualizando o banco de dados
show databases;

-- acessando o banco de dados
use dbCDS;

create table tbArtista(
cod_art int not null auto_increment,
nome_art varchar(100) not null unique,
primary key(cod_art)
);

create table tbGravadoras(
cod_grav int not null auto_increment,
nome_grav varchar(50) not null unique,
primary key(cod_grav)
);

create table tbCategorias(
cod_cat int not null auto_increment,
nome_cat varchar(50) not null unique,
primary key(cod_cat)
);

create table tbEstados(
siglas_est char(2) not null,
nome_est varchar(50) not null unique,
primary key(siglas_est)
);

create table tbCidade(
cod_cid int not null auto_increment,
nome_cid varchar(50) not null,
siglas_est char(2) not null,
primary key(cod_cid),
foreign key(siglas_est) references tbEstados(siglas_est)
);

create table tbCliente(
cod_cli int not null auto_increment,
nome_cli varchar(50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_cli char(1) not null default 'F' check(sexo_cli in('F','M')),
cod_cid int not null,
primary key(cod_cli),
foreign key(cod_cid) references tbCidade(cod_cid)
);

create table tbConjuge(
cod_conj int not null auto_increment,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
sexo_conj char(1) not null default 'F' check(sexo_conj in('F','M')),
cod_cli int not null,
primary key(cod_conj),
foreign key(cod_cli) references tbCliente(cod_cli)
);

create table tbFuncionario(
cod_func int not null auto_increment,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >=0 ),
sexo_func char(1) not null default 'F' check(sexo_func in('F','M')),
primary key(cod_func)
);

create table tbDepedentes(
cod_dep int not null auto_increment,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_dep in('F','M')),
cod_func int not null,
primary key(cod_dep),
foreign key(cod_func) references tbFuncionario(cod_func)
);

create table tbTitulo(
cod_tit int not null auto_increment,
nome_CD varchar(50) not null unique,
val_CD 	decimal(9,2) not null default 0 check(val_CD > 0),
qtd_estq int not null default 0 check(qtd_estq >= 0),
cod_cat int not null,
cod_grav int not null,
primary key(cod_tit),
foreign key(cod_cat) references tbCategorias(cod_cat),
foreign key(cod_grav) references tbGravadoras(cod_grav)
);

create table tbPedidos(
num_ped int not null auto_increment,
data_ped date not null,
val_ped decimal(9,2) not null,
cod_cli int not null,
cod_func int not null,
primary key(num_ped),
foreign key(cod_cli) references tbCliente(cod_cli),
foreign key(cod_func) references tbFuncionario(cod_func)
);

create table tbTitulo_Pedido(
qtd_CD int not null default 0 check(qtd_CD >= 1),
val_CD decimal(9,2) not null default 0 check(val_CD > 0),
num_ped int not null,
cod_tit int not null,
foreign key(num_ped) references tbPedidos(num_ped),
foreign key(cod_tit) references tbTitulo(cod_tit)
);

create table tbTitulo_Artista(
cod_tit int not null,
cod_art int not null,
foreign key(cod_tit) references tbTitulo(cod_tit),
foreign key(cod_art) references tbArtista(cod_art)
);

show tables;

desc tbArtista;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidade;
desc tbCliente;
desc tbConjuge;
desc tbFuncionario;
desc tbDepedentes;
desc tbTitulo;
desc tbPedidos;
desc tbTitulo_Pedido;
desc tbTitulo_Artista;

-- Artistas
insert into tbArtista(nome_art)values('Marisa Monte');
insert into tbArtista(nome_art)values('Gilberto Gil');
insert into tbArtista(nome_art)values('Caetano Veloso');
insert into tbArtista(nome_art)values('Milton Nascimento');
insert into tbArtista(nome_art)values('Legião Urbana');
insert into tbArtista(nome_art)values('The Beatles');
insert into tbArtista(nome_art)values('Rita Lee');
-- Gravadoras
insert into tbGravadoras(nome_grav)values('Polygram');
insert into tbGravadoras(nome_grav)values('EMI');
insert into tbGravadoras(nome_grav)values('Som Livre');
insert into tbGravadoras(nome_grav)values('Som Music');
-- Categoria
insert into tbCategorias(nome_cat)values('MPB');
insert into tbCategorias(nome_cat)values('Trilha Sonora');
insert into tbCategorias(nome_cat)values('Rock Internacional');
insert into tbCategorias(nome_cat)values('Rock Nacional');
-- Estados
insert into tbEstados(siglas_est,nome_est)values('SP','São Paulo');
insert into tbEstados(siglas_est,nome_est)values('MG','Minas Gerais');
insert into tbEstados(siglas_est,nome_est)values('RJ','Rio de Janeiro');
insert into tbEstados(siglas_est,nome_est)values('ES','Espirito Santo');
-- Cidade
insert into tbCidade(siglas_est,nome_cid)values('SP','São Paulo');
insert into tbCidade(siglas_est,nome_cid)values('SP','Sorocaba');
insert into tbCidade(siglas_est,nome_cid)values('SP','Jundiai');
insert into tbCidade(siglas_est,nome_cid)values('SP','Americana');
insert into tbCidade(siglas_est,nome_cid)values('SP','Araraquara');
insert into tbCidade(siglas_est,nome_cid)values('MG','Ouro Preto');
insert into tbCidade(siglas_est,nome_cid)values('ES','Cachoeira do Itapemirim');
-- Cliente
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,'José Nogueira','Rua A',1500.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,'Ângelo Pereira','Rua B',2000.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,'Catarina Souza','Rua D',892.00,'F');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(1,'Vagner Costa','Rua E',950.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(2,'Antenor da Costa','Rua F',1582.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(2,'Maria Amélia de Souza','Rua G',1152.00,'F');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(3,'Fátima Souza','Rua I',1632.00,'F');
insert into tbCliente(cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)values(3,'Joel da Rocha','Rua J',2000.00,'M');
-- Conjuge
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj)values(1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj)values(2,'Emilia Pereira',5500.00,'F');
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj)values(6,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(cod_cli,nome_conj,renda_conj,sexo_conj)values(7,'Carlos de Souza',3250.00,'M');
-- Funcionarios
insert into tbFuncionario(nome_func,end_func,sal_func,sexo_func)values('Vânia Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionario(nome_func,end_func,sal_func,sexo_func)values('Norberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionario(nome_func,end_func,sal_func,sexo_func)values('Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionario(nome_func,end_func,sal_func,sexo_func)values('Paula da Silva','Rua D',3000.00,'F');
insert into tbFuncionario(nome_func,end_func,sal_func,sexo_func)values('Rolando Rocha','Rua E',2000.00,'M');
-- Dependentes
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(1,'Ana Pereira','F');
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(1,'Roberto Pereira','M');
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(1,'Celso Pereira','M');
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(3,'Brisa Linhares','F');
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(3,'Mari Sol Linhares','F');
insert into tbDepedentes(cod_func,nome_dep,sexo_dep)values(4,'Sonia da Silva','F');
-- Titulos
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,1,'Tribalistas',30.00,1500);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,2,'Tropicália',50.00,500);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,1,'Aquele Abraço',50.00,600);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,2,'Refazenda',60.00,1000);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,3,'Travessia',55.00,500);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(1,2,'Courage',30.00,200);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(4,3,'Legião Urbana',20.00,100);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(3,2,'The Beatles',30.00,300);
insert into tbTitulo(cod_cat,cod_grav,nome_CD,val_CD,qtd_estq)values(4,1,'Rita Lee',30.00,500);
-- Pedidos
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(1,2,'02/05/02',1500.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(3,4,'02/05/02',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(4,3,'02/06/02',100.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(1,4,'02/02/03',200.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(7,5,'02/03/03',300.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(4,4,'02/03/03',100.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(5,5,'02/03/03',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(8,2,'02/03/03',50.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(2,2,'02/03/03',2000.00);
insert into tbPedidos(cod_cli,cod_func,data_ped,val_ped)values(7,1,'02/03/03',3000.00);
-- Titulos Pedidos
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(1,1,2,30.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(1,2,3,20.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(2,1,1,50.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(2,2,3,30.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(3,1,2,40.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(4,2,3,20.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(5,1,2,25.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(6,2,3,30.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(7,4,2,55.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(8,1,4,60.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(9,2,3,15.00);
insert into tbTitulo_Pedido(num_ped,cod_tit,qtd_CD,val_CD)values(10,7,2,15.00);
-- Titulos Artista
insert into tbTitulo_Artista(cod_tit,cod_art)values(1,1);
insert into tbTitulo_Artista(cod_tit,cod_art)values(2,2);
insert into tbTitulo_Artista(cod_tit,cod_art)values(3,2);
insert into tbTitulo_Artista(cod_tit,cod_art)values(4,2);
insert into tbTitulo_Artista(cod_tit,cod_art)values(5,3);
insert into tbTitulo_Artista(cod_tit,cod_art)values(6,4);
insert into tbTitulo_Artista(cod_tit,cod_art)values(7,4);
insert into tbTitulo_Artista(cod_tit,cod_art)values(8,5);
insert into tbTitulo_Artista(cod_tit,cod_art)values(9,6);
insert into tbTitulo_Artista(cod_tit,cod_art)values(10,7);
-- Vizualizador
select * from tbArtista;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidade;
select * from tbCliente;
select * from tbConjuge;
select * from tbFuncionario;
select * from tbDepedentes;
select * from tbTitulo;
select * from tbPedidos;
select * from tbTitulo_Pedido;
select * from tbTitulo_Artista;