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
	where year(tblAtor.dataNascimento) >= '1965'
	order by nomeAtor asc;
    

#select atividade 2    

select tblFilme.nome as nomeFilme, date_format(tblFilme.dataLancamento, '%d/%m/%Y') as dataLancamento, tblFilme.sinopse,
		tblClassificacao.nome as classificacao,
        tblGenero.nome as nomeGenero,
        tblAtor.nome as nomeAtor, date_format(tblAtor.dataNascimento, '%d/%m/%Y') as dataNascimentoAtor, tblNacionalidade.nome as nacionalidadeAtor,
        tblDiretor.nome as nomeDiretor,
		tblRoteirista.nome as nomeRoteirista

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
            
	inner join tblAtorNacionalidade
			on tblAtorNacionalidade.idAtor = tblator.idAtor
	inner join tblNacionalidade
			on tblNacionalidade.idNacionalidade = tblAtorNacionalidade.idNacionalidade
            
	inner join tblFilmeDiretor
			on tblFilme.idFilme = tblFilmeDiretor.idFilme
	inner join tblDiretor
			on tblDiretor.idDiretor = tblFilmeDiretor.idDiretor
            
	inner join tblFilmeRoteirista
			on tblFilme.idFilme = tblFilmeRoteirista.idFilme
	inner join tblRoteirista
			on tblRoteirista.idRoteirista = tblFilmeRoteirista.idRoteirista
	
    #Permite agrupar o resultado do select po colunas específicas
    #Ele elimina as repetições e manipula o resultado para mostrar somente uma vez a ocorrência dos valores.->
    #obs: é muito utilizado quando fazemos relaçoes comm diversas tabelas 
    
	group by tblFilme.nome, tblGenero.nome
	order by nomeFilme asc, nomeAtor desc;
    
    #criando uma VIEW no BD
    #View é uma tabela virtual criada com base em select, que já é pré-processada pelo BD e permite dar
    #uma resposta muito mais ágil do que executar manualmente o script
    
    create view vwListarFilmes as 
    select tblFilme.nome as nomeFilme, date_format(tblFilme.dataLancamento, '%d/%m/%Y') as dataLancamento, tblFilme.sinopse,
		tblClassificacao.nome as classificacao,
        tblGenero.nome as nomeGenero,
        tblAtor.nome as nomeAtor, date_format(tblAtor.dataNascimento, '%d/%m/%Y') as dataNascimentoAtor, tblNacionalidade.nome as nacionalidadeAtor,
        tblDiretor.nome as nomeDiretor,
		tblRoteirista.nome as nomeRoteirista

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
            
	inner join tblAtorNacionalidade
			on tblAtorNacionalidade.idAtor = tblator.idAtor
	inner join tblNacionalidade
			on tblNacionalidade.idNacionalidade = tblAtorNacionalidade.idNacionalidade
            
	inner join tblFilmeDiretor
			on tblFilme.idFilme = tblFilmeDiretor.idFilme
	inner join tblDiretor
			on tblDiretor.idDiretor = tblFilmeDiretor.idDiretor
            
	inner join tblFilmeRoteirista
			on tblFilme.idFilme = tblFilmeRoteirista.idFilme
	inner join tblRoteirista
			on tblRoteirista.idRoteirista = tblFilmeRoteirista.idRoteirista
    
	group by tblFilme.nome, tblGenero.nome
	order by nomeFilme asc, nomeAtor desc;
    
#permite rodar uma view
select * from vwListarFilmes;
    
#Permite visualizar views e tabelas
show tables;

#permite visualizar as colunas virtuais de uma view
desc vwListarFilmes;

#alterar view
alter view vwListarFilmes as 
 select tblFilme.nome as nomeFilme, date_format(tblFilme.dataLancamento, '%d/%m/%Y') as dataLancamento, tblFilme.sinopse,
		tblClassificacao.nome as classificacao,
        tblGenero.nome as nomeGenero,
        tblAtor.nome as nomeAtor, date_format(tblAtor.dataNascimento, '%d/%m/%Y') as dataNascimentoAtor, tblNacionalidade.nome as nacionalidadeAtor,
        tblDiretor.nome as nomeDiretor,
		tblRoteirista.nome as nomeRoteirista

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
            
	inner join tblAtorNacionalidade
			on tblAtorNacionalidade.idAtor = tblator.idAtor
	inner join tblNacionalidade
			on tblNacionalidade.idNacionalidade = tblAtorNacionalidade.idNacionalidade
            
	inner join tblFilmeDiretor
			on tblFilme.idFilme = tblFilmeDiretor.idFilme
	inner join tblDiretor
			on tblDiretor.idDiretor = tblFilmeDiretor.idDiretor
            
	inner join tblFilmeRoteirista
			on tblFilme.idFilme = tblFilmeRoteirista.idFilme
	inner join tblRoteirista
			on tblRoteirista.idRoteirista = tblFilmeRoteirista.idRoteirista
    
	order by nomeFilme asc, nomeAtor desc;

select * from tblFilmeDiretor;
select * from tblRoteiristanacionalidade;
select * from tblRoteirista;
select * from tblnacionalidade;
select * from tblestudio;

create table tblFilmeRoteirista (
 idFilmeRoteirista int not null auto_increment primary key,
 idFilme int not null,
 idRoteirista int not null,
 
 constraint FK_Filme_FilmeRoteirista
 foreign key(idFilme)
 references tblFilme(idFilme),
 
 constraint FK_Roteirista_FilmeRoteirista
 foreign key(idRoteirista)
 references tblRoteirista(idRoteirista)
 );
 

insert into tblEstudio (nome)
values ("Disney"),
		("Paramount"),
        ("Castle Rock Enterteinment"),
        ("Warner Bros.");
        
insert into tblRoteirista (nome, idSexo) 
values ("Stephen King", 1),
		("Linda Woolverton", 2),
        ("Eric Roth", 1);

insert into tblRoteiristaNacionalidade (idRoteirista, idNacionalidade)
values (1,1),
		(2,1),
        (3,1);
        
select * from tblFilme;
select * from tblDiretor;


insert into tblFilmeDiretor (idFilme, idDiretor)
values (1,2),
		(2,3),
        (3,1),
        (4,2)
        ;
        

 insert into tblFilmeRoteirista (idFilme, idRoteirista)
values (1,1),
		(2,2),
        (3,3),
        (4,1);

 
 select * from tblFilmeRoteirista;

