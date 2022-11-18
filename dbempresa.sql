drop database dbEmpresa;

create database dbEmpresa;

use dbEmpresa;

create table tbFuncionarios(
codfunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) not null default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codfunc)
);


create table tbUsuarios(
codusu int not null auto_increment,
nome varchar(20) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu),
foreign key(codfunc)references tbFuncionarios(codfunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
cnpj char(18),
inscrEst char(15),
email varchar(100),
telefone char(10),
primary key(codForn)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int default 0 check(quantidade >= 0),
valor decimal(9,2) check(valor >= 0),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
telefone char(10),
primary key(codCli)
);

create table tbVendas(
codVend int not null auto_increment,
codProd int not null,
codCli int not null,
codusu int not null,
dataVenda date,
horaVenda time,
quantidade int,
primary key(codVend),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codCli)references tbClientes(codCli),
foreign key(codusu)references tbUsuarios(codusu)
);


desc tbProdutos;
desc tbUsuarios;
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbVendas;


insert into tbFuncionarios(nome,email,cpf,salario,sexo)
values('Paulo Miranda da Silva','paulo.msilva@hotmail.com','258.247.248-00','1500.00','M');

insert into tbUsuarios(nome,senha,codfunc) values ('paulo.msilva','123456',1);

insert into tbFornecedores(nome,cnpj,inscrEst,email,telefone)
values('Fabricantes S/A','25.147.235/0001-38','253.235.147-110','sac@empresa.com.br','97485-8574');

insert into tbProdutos(descricao,quantidade,valor,codForn) values ('Banana',12,10.35,1);
insert into tbProdutos(descricao,quantidade,valor,codForn) values ('Maca',20,5.00,1);
insert into tbProdutos(descricao,quantidade,valor,codForn) values ('Pera',50,15.25,1);
insert into tbProdutos(descricao,quantidade,valor,codForn) values ('Morango',35,10.25,1);

insert into tbClientes(nome,email,cpf,telefone) values ('Paulo Albuquerque da Vila','paulo.avila@hotmail.com','245.236.852-99','97852-1475');

insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (1,1,1,'2022/11/17','15:42:02',10);
insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (3,1,1,'2022/11/18','15:42:02',5);
insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (2,1,1,'2022/11/17','15:42:02',3);
insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (4,1,1,'2022/11/17','15:42:02',8);
insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (2,1,1,'2022/11/17','15:42:02',7);
insert into tbVendas(codProd,codCli,codusu,dataVenda,horaVenda,quantidade) values (3,1,1,'2022/11/17','15:42:02',2);

select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbFornecedores;
select * from tbProdutos;
select * from tbClientes;
select * from tbVendas;

-- utilizando inner join nas pesquisas

select prod.descricao, vend.quantidade 
from tbVendas as vend
inner join tbProdutos as prod
on vend.codProd = prod.codProd;

select prod.descricao,forn.nome from tbProdutos as prod
inner join tbFornecedores as forn
on prod.codForn = forn.codForn;

select prod.descricao, cli.nome, usu.nome from tbVendas as vend
inner join tbProdutos as prod on vend.codProd = prod.codProd
inner join tbClientes as cli on vend.codCli = cli.codCli
inner join tbUsuarios as usu on vend.codusu = usu.codusu;

select prod.descricao as 'Nome do Produto',
cli.nome as 'Nome do Cliente',
forn.nome as 'Nome do Fornecedor' 
from tbVendas as vend
inner join tbProdutos as prod on vend.codProd = prod.codProd 
inner join tbClientes as cli on cli.codCli = vend.codCli
inner join tbFornecedores as forn on prod.codForn = forn.codForn
where vend.codProd = 3;

-- Qual  nome do funcionário que 
-- vende o produto morango e quantidade da venda e qual
-- é o fornecedor desse produto
-- Pergunta realizada para tabela de vendas

select func.nome, prod.descricao, prod.quantidade, forn.nome from tbVendas as vend
inner join tbProdutos as prod on vend.codProd = prod.codProd
inner join tbFornecedores as forn on prod.codForn = forn.codForn
inner join tbUsuarios as usu on vend.codusu = usu.codusu
inner join tbFuncionarios as func on func.codfunc = usu.codfunc
where vend.codProd = 4;