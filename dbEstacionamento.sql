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
ano char(4),
data_entrada date,
hora_entrada time,
data_saida date,
hora_saida time,
primary key(codcarro)
);
-- Para os tipos de campos e tamanhos fica a seu critério verificar (Páginas 16 e 17 da apostila)

-- Inserir na tabela carros pelo menos 10 registros
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('BKZ-6542', 'Verde', 'Gol', '2007' , '2022/11/10', '10:05:10', '2022/11/12', '10:05:10');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('CZS-4761', 'Vermelho', 'Ferrari', '2016' , '2022/05/15' , '05:50:40', '2022/05/17', '05:21:01');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('FCP-8774', 'Amarelo', 'Siena', '2015' , '2022/02/16', '21:10:40', '2022/02/18', '20:40:02');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('GAR-9140', 'Prata', 'Lamborghini', '2016' , '2022/12/05', '05:56:10', '2022/12/07', '09:20:25');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('CHY-2130', 'Preto', 'Jeep', '2017' , '2022/06/25', '05:50:20', '2022/06/26', '22:52:25');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('EMX-7266', 'Branco', 'Fusca', '2018' , '2022/10/15', '24:02:40', '2022/10/16', '22:22:22');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('DDU-5844', 'Azul', 'Supra', '2019' , '2022/05/20', '20:45:54', '2022/05/25', '13:13:13');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('CNF-5884', 'Roxo', 'GTR', '2020' , '2022/08/30', '21:60:54', '2022/09/01', '12:12:12');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('FCX-1840', 'Dourado', 'RX7', '2021' , '2022/10/19', '20:52:52', '2022/10/22', '10:10:10');
insert into tbCarros(placa, cor, modelo, ano, data_entrada, hora_entrada, data_saida, hora_saida) values ('GFX-7199', 'Laranja', 'Mustang', '2022' , '2022/01/01', '00:00:00', '2022/01/02', '00:00:10');

select * from tbCarros;

-- Altera 5 registro
update tbCarros set cor = 'verde' where codcarro = 5;
update tbCarros set placa = 'FTK-7585' where codcarro = 2;
update tbCarros set ano = '1920' where codcarro = 1;
update tbCarros set modelo = 'Audi-R8' where codcarro = 8; 
update tbCarros set data_saida = '2001/05/01' where codcarro = 3;

select * from tbCarros;
-- Apagar 3 registro
delete from tbCarros where codcarro = 4;
delete from tbCarros where codcarro = 10;
delete from tbCarros where codcarro = 7;

select * from tbCarros;
-- Pesquisar os carros pelo nome
select * from tbCarros where modelo like '%l%';

-- Pesquisar os carros pelo código
select * from tbCarros where codcarro = 6;

-- Pesquisar os carros pela data de entrada
select * from tbCarros where data_entrada like '%2022/10/15%';

--- Pesquisar os carros pela pela cor
select * from tbCarros where cor like '%vermelho%';

-- Pesquisar os carros pela pelo Placa
select * from tbCarros where placa like '%5%';

-- Salvar o script do banco na pasta de atividades