 -- Apagar o banco de dados
drop database dbLoja;

 -- criando banco de dados
 create database dbLoja;

-- Acessar o banco de dados
use dbLoja;

-- Visualizar o banco de dados
show database;

-- Visualizar a tabela
show tables;

-- Criando tabela para o banco de dados
create table tbFuncionario(
codfunc int auto_increment,
nome varchar (50),
email varchar (14),
cpf char(14),
tel char(10),
primary key(codfunc)
);

create table tbUsuario(
codusu int auto_increment,
nome varchar(15),
senha varchar(14),
primary key (codusu)
);

-- visualizar a tabelas bd
show tables;

--visualizando a estruturas das tabelas
desc tbFuncionario;
desc tbUsuario;

-- incerindo valores na tabelas
insert into tbFuncionario(nome,email,cpf,tel)
values('João Otavio','joao@gmail.com','28542968473','955287168');
insert into tbFuncionario(nome,email,cpf,tel)
values('Lucas Calvo','lucas@gmail.com','63846209348','993482588');
insert into tbUsuario(nome,senha)
values('João Otavio','aaaaaaaa');
insert into tbUsuario(nome,senha)
values('Lucas Calvo','aaaaaaaa');

-- visualizando o registro da tabela 
select * from tbFuncionario;
select * from tbUsuario;

-- alterando os registro da tabelas
update tbUsuario set senha = '123456789' where codusu = 1;

-- visualizando o registro da tabela 
select * from tbFuncionario;
select * from tbUsuario;

-- excluindo o registro das tabelas
delete from tbUsuario where codusu = 2;

-- visualizando o registro da tabela 
select * from tbUsuario;