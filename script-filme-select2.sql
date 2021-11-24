#concat() - permite realizar a concatenação de dados
select concat('Filme: ', nome) as nomeFilme, nome,
concat('O filme ', nome, ' tem duração de ') as resultado from tblFilme;

#concat_ws() - permite realizar a concatenaçção de dados, utilizando um caractere
select concat_ws(' | ', nome, duracao, dataLancamento) as resultado from tblFilme;

#locate() - retorna posição da palavra ou caractere desejado
select locate(',', sinopse) as resultado, sinopse from tblFilme;

#reverse - permite inverter o conteúdo de uma coluna
select reverse(nome) as resultado from tblfilme;

#lenght ou char_lenght - retona a qtde de carcteres de uma coluna
select length(nome) as qtde, char_length(nome) as qtde2 from tblfilme; 

#insert() - permite inserir um novo conteúdo dentro do texto de uma coluna
#insert(coluna, posição de início , novo conteúdo a ser inserido)
select insert(sinopse, 5, 0, 'videolocadora') as resultado from tblfilme;

select insert(sinopse, locate('prisão', sinopse), length('prisão'), '<b>prisão</b> ') as resultado from tblfilme;

#substr() - permite retirar um pedaço de um conteúdo
select concat( substr(sinopse, 1, locate('.', sinopse)), ' Saiba mais...')  as recorte from tblfilme;

#replace() - permite localizar um conteúdo e substituir por outra coisa
select replace(sinopse, 'prisão', '<b>prisão</b>') as resultado from tblfilme;

alter table tblfilme
	add column valor float;

update tblfilme set valor = '9.75' where idFilme = 4;

select nome, qtde, valor, round((qtde * valor), 2) as valorTotal
 from tblfilme; 
 
 select nome, sinopse, 
	concat('R$', round(valor, 2)) as valor, 
	concat('R$', round((valor - (valor * (10/100))), 2)) as desconto 
    from tblfilme;