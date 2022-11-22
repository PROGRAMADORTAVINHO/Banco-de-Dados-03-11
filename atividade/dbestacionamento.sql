-- Criar o banco de dados estacionamento.
drop database estacionamento;
create database estacionamento;
show databases;
use estacionamento;
-- Criar a tabela carros com os seguintes campos:
create table tbCarros(
codcarro int auto_increment,
placa varchar(10),
cor varchar(10),
modelo varchar(14),
ano date,
data entrada date,
hora entrada time,
data saída date,
hora saída time,
primary key(codcarro)
);
-- Para os tipos de campos e tamanhos fica a seu critério verificar (Páginas 16 e 17 da apostila)

-- Inserir na tabela carros pelo menos 10 registros
insert into tbCarros(placa, cor, modelo, ano, data entrada, hora entrada, data saída, hora saída) values ('BKZ-6542', 'Verde', 'Gol', 2007 , 2022/11/10, 10:05:10, 2022/11/12, 10:05:10);
-- Pesquisar os carros pelo nome
-- Pesquisar os carros pelo código
-- Pesquisar os carros pela data de entrada
--- Pesquisar os carros pela pela cor
-- Pesquisar os carros pela pelo modelo

-- Salvar o script do banco na pasta de atividades