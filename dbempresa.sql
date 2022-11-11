-- apagar o banco de dados
drop database dbempresa;

-- criando banco de dados
create database dbempresa;

-- visualizando o banco de dados
show databases;

-- acessando o banco de dados
use dbempresa;

create table tbFuncionario(
codfunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) not null default 0 check(salario >=0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codfunc)
);

create table tbUsuario(
codusu int not null auto_increment,
nome varchar(20) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu),
foreign key(codfunc) references tbFuncionario(codfunc)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int default 0 check(quantidade >= 0),
valor decimal(9,2) check(valor >= 0),
codusu int not null,
primary key(codProd),
foreign key(codusu) references tbUsuario(codusu)
);

desc tbFuncionario;
desc tbUsuario;
desc tbProdutos;

insert into tbFuncionario(nome,email,cpf,salario,sexo) values ('João Otavio Duarte de Souza','joaootavio@gmail.com','111111111-11', '1200,00', 'M');


insert into tbUsuario(nome,senha,codfunc) values ('João .DSouza','123456',1);


insert into tbProdutos(descricao,quantidade,valor,codusu) values ('Banana','12','20.00',1);
insert into tbProdutos(descricao,quantidade,valor,codusu) values ('Tomate','65','1000.00',1);
insert into tbProdutos(descricao,quantidade,valor,codusu) values ('Laranja','30','50.00',1);
insert into tbProdutos(descricao,quantidade,valor,codusu) values ('Maça','50','100.00',1);


select * from tbProdutos;
select * from tbUsuario;
select * from tbFuncionario;
