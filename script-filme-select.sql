#-----------------------SELECT----------------------------

/*
Select -Especifica as colunas que serão vizualidas
From - especifica as tabels
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
Operadores lógicos
=
>
<
<> - diferente
like - semelhante ao igual 
('%palavra' - procura pelo término da string;
'palavra%' - procura pelo início da string;
'%palavra%' - procura em todo a string)
*/

