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
renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0)
sexo_cli char(1) not null default 'F' check(sexo_cli in('F','M')),
cod_cid int not null
primary key(cod_cli),
foreign key(cod_cid) references tbCidade(cod_cid)
);

create table tbConjuge(
cod_conj int not null auto_increment,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check(renda_cli >= 0),
sexo_conj char(1) not null default 'F' check(sexo_cli in('F','M')),
cod_cli int not null,
primary key(cod_conj)
foreign key(cod_cli) references tbCliente(cod_cli)
);

create table tbFuncionario(
cod_func int not null auto_increment,
nome_func varchar(50) not null,
end_func varchar(100) not null,
sal_func decimal(9,2) not null default 0 check(sal_func >=0 ),
sexo_func char(1) not null default 'F' check(sexo_cli in('F','M')),
primary key(cod_func)
);

create table tbDepedentes(
cod_dep int not null auto_increment,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check(sexo_cli in('F','M')),
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
data_ped datetime not null,
val_ped decimal(9,2) not null,
cod_cli int not null,
cod_func int not null,
primary key(num_ped),
foreign key(cod_cli) references tbCliente(cod_cli),
foreign key(cod_func) references tbFuncionario(cod_func)
);

-- Pg. 72