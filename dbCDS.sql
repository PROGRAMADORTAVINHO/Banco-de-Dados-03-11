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

-- Pg. 69