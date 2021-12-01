#RELACIONAMENTO ENTRE TABELAS NO BD
## FORMA 01 DE FAZER RELACIONAMENTO - NO WHERE

select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, tblGenero.nome as nomeGenero
from tblFilme, tblGenero, tblFilmeGenero
where tblFilme.idFilme = tblFilmeGenero.idFilme and tblGenero.idGenero = tblFilmeGenero.idGenero order by nomeGenero;

select * from tblFilme;

select * from tblFilmeGenero;

## FORMA 02 DE FAZER RELACIONAMENTO - NO FROM
# Essa forma de relacionar cria uma performance (processamento) mais rápido na geração do resultado
 
#inner join - pega apenas o que está nas duas tabelas (tblInterm)
select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, 
	tblGenero.nome as nomeGenero 
from tblFilme inner join tblFilmeGenero 
		on tblFilme.idFilme = tblFilmeGenero.idFilme
    inner join tblGenero
		on tblGenero.idGenero = tblFilmeGenero.idGenero;

#left join - retorna dados que foram relacionados que foram relacionados entre a tabela esquerda-direita
#porém também retorna os dados da tabela da esquerda que não foram relacionados com a tabela da direita
select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, 
	tblGenero.nome as nomeGenero 
from tblFilme left join tblFilmeGenero 
		on tblFilme.idFilme = tblFilmeGenero.idFilme
    left join tblGenero
		on tblGenero.idGenero = tblFilmeGenero.idGenero;

#right join  retorna dados que foram relacionados que foram relacionados entre a tabela esquerda-direita
#porém também retorna os dados da tabela da direita que não foram relacionados com a tabela da esquerda
select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, 
	tblGenero.nome as nomeGenero 
from tblFilme right join tblFilmeGenero 
		on tblFilme.idFilme = tblFilmeGenero.idFilme
    right join tblGenero
		on tblGenero.idGenero = tblFilmeGenero.idGenero;
        
#aplicando full join no mysql - union all
#como o mysql não possui o comando full join, utiliza-se o comando union
#union - une dois ou mais scripts de select
#criamos um select left join e unimos com outtro select right join
select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, 
	tblGenero.nome as nomeGenero 
from tblFilme left join tblFilmeGenero 
		on tblFilme.idFilme = tblFilmeGenero.idFilme
    left join tblGenero
		on tblGenero.idGenero = tblFilmeGenero.idGenero
union all
select tblFilme.nome as nomeFilme, tblFilme.duracao, tblFilme.dataLancamento, 
	tblGenero.nome as nomeGenero 
from tblFilme right join tblFilmeGenero 
		on tblFilme.idFilme = tblFilmeGenero.idFilme
    right join tblGenero
		on tblGenero.idGenero = tblFilmeGenero.idGenero;
        
        
        
#SELECT ATIVIDADE

select * from tblAtor;

select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, 
		tblClassificacao.nome as nomeClassificacao, 
		tblGenero.nome as nomeGenero, 
		tblAtor.nome as nomeAtor
from tblFilme 
	inner join tblClassificacao 
		on tblClassificacao.idClassificacao = tblFilme.idClassificacao
	left join tblFilmeGenero 
			on tblFilme.idFilme = tblFilmeGenero.idFilme
	left join tblGenero
			on tblGenero.idGenero = tblFilmeGenero.idGenero
	inner join tblFilmeAtor
			on tblFilme.idFilme = tblFilmeAtor.idFilme
	inner join tblAtor 
			on tblAtor.idAtor = tblFilmeAtor.idAtor
	where year(tblAtor.dataNascimento) >= 1965
	order by nomeAtor asc;


