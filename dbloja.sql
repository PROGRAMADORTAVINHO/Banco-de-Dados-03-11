-- apagar o banco de dados
drop database dbloja;

-- criando banco de dados
create database dbloja;

-- visualizando o banco de dados
show databases;

-- acessando o banco de dados
use dbloja;

-- criando as tabelas para o banco de dados
create table tbFuncionarios(
codfunc int auto_increment,
nome varchar(50),
email varchar(50),
cpf char(14),
tel char(10),
primary key(codfunc)
);

create table tbUsuarios(
codusu int auto_increment,
nome varchar(15),
senha varchar(14),
primary key(codusu)
);

create table tbProdutos(
codProd int auto_increment,
descricao varchar(50),
preco decimal(9,2),
validade date,
quantidade int,
tipo varchar(10),
primary key(codProd)
);

-- visualizando as tabelas no banco de dados
show tables;

-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbUsuarios;

-- inserindo valores nas tabelas
insert into tbFuncionarios(nome,email,cpf,tel)
values('José da Cunha','jose.cunha@hotmail.com','258.247.256-87','97854-8752');

insert into tbFuncionarios(nome,email,cpf,tel)
values('Maria da Silva','maria.silva@hotmail.com','254.258.963-77','98741-5824');

insert into tbUsuarios(nome,senha)values('maria.silva','123456');

insert into tbUsuarios(nome,senha)values('jose.cunha','654321');


insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Banana',20.50,'2022-11-07',12,'duzia');

insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Banana',25.50,'2022-11-10',15,'duzia');

insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Banana',10.50,'2022-11-11',08,'duzia');

insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Banana',12.50,'2022-11-09',05,'duzia');

insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Melancia',30.00,'2022-11-30',1,'unidade');

insert into tbProdutos(descricao,preco,validade,quantidade,tipo)values('Morango',10.50,'2022-11-08',1,'caixa');

-- visualizando os registros das tabelas
select * from tbFuncionarios;

select * from tbUsuarios;

select * from tbProdutos;

-- alterando os registros das tabelas
update tbUsuarios set senha = '789658452' where codusu = 1;

select * from tbUsuarios;

-- excluindo os registros das tabelas
delete from tbUsuarios where codusu=2;

select * from tbUsuarios;

-- Busca por código

select * from tbProdutos where codProd = 2;

-- Busca por nome

select * from tbProdutos where descricao like '%a%';

-- Tipos de like 
-- %nome 
-- nome%
-- %nome%

select * from tbProdutos where descricao like 'm%';

select * from tbProdutos where descricao like '%m';

select * from tbProdutos where descricao like '%m%';

update tbProdutos set preco = preco * 1.10 where preco > 11.00;

update tbProdutos set preco = preco * 0.90 where preco > 11.00;
