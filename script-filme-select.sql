#-----------------------SELECT----------------------------

/*
Select - especifica as colunas que serão vizualidas
From - especifica as tabelas
Where - especifica o filtro 
*/

#permite visualizar todas as colunas/registros de uma tabela
select * from tblfilme;
#ou
select tblfilme.* from tblfilme;
#para quando for selecionar de mais de uma tabela

#Permite visualizar colunas específicas
select tblfilme.nome, tblfilme.sinopse from tblfilme as filme;
#Obs: Ao selecionar de 2 tabelas com atributos de mesmo nome, usar: nomedatabela.atributo

# as - alias (permite criar um apelido para o nome de uma coluna ou tabela)
#Apelidos para atributos repetidos (evita problemas no back)

select nome as nomefilme, duracao, sinopse from tblfilme;

select nome, sinopse from tblFilme where nome like '%leão%';

/*
Operadores de comparação
=
>
>=
<
<=
<> - diferente
like - semelhante ao igual 
('%palavra' - procura pelo término da string;
'palavra%' - procura pelo início da string;
'%palavra%' - procura em toda a string)
'%palavra%' - procura em toda a string)

Operadores lógicos
and
or
not
*/

alter table tblFilme
	add column qtde int;
    
update tblFilme set qtde = 8 where idFilme = 1;

select * from tblFilme where qtde <= 8;

#Exemplo de utilização do operador lógico
select * from tblFilme where qtde >=6 and qtde <= 10;

select * from tblFilme 
where not (qtde >=6 and qtde <=10);

select * from tblFilme where qtde between 6 and 10;
#between - retorna os dados em range (intervalo) de valores

select * from tblFilme where qtde = 2 or qtde = 5 or qtde = 8 or qtde = 10;
#ou
select * from tblFilme where qtde not in (2,5,8,10);

#in - permite buscar no mesmo atributo por vários valores, não precisando escrever o atributo várias vezes.
#OBS: só funciona com o operador lógico OR e com igualdades

/*Ordenação de dados*/
#order by tem que ser o último atributo

select * from tblFilme order by nome asc;
select * from tblFilme order by nome desc;
#order by asc - ordena de forma crescente
#order by desc - ordena de forma decrescente

select * from tblFilme order by mome asc, duracao desc;

select * from tblFilme limit 1;
#limit - limita os resultados trazidos pelo banco

#trazer o primeiro e o último registro
select * from tblFilme order by idFilme asc limit 1;
select * from tblFilme order by idFilme desc limit 1;

#count- retorna a quantidade de itens no select
select count(*) as qtdeFilmes from tblFilme;
select count(nome) as qtdeNomeFilmes, count(dataRelancamento) as qtdeFilmesDataRelançamento from tblFilme;
select count(*) as qtdeClassificacao from tblFilme where idClassificacao = 4;

#min - retorna o menor valor do select
select min(qtde) as qtdeMinima from tblFilme;
#max - retorna o maior valor do select
select max(qtde) as qtdeMaxima from tblFilme;

#sum - realiza a soma de valores de uma coluna
select sum(qtde) somaQtdeFilmes from tblFilme;

#avg - calcula a média de valores de uma coluna
#round - permite especificar a qtde de casas decimais
select round(avg(qtde), 1) as mediaQtdeFilmes from tblFilme;

