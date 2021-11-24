use dbfilmesturmab;

create table tblDiretor (
	idDiretor int not null auto_increment primary key,
    nome varchar(80) not null,
    dataNascimento date not null,
    nomeArtistico varchar(80),
    biografia text,
    foto varchar(80),
    idSexo int not null,
    constraint FK_Sexo_Diretor
    foreign key(idSexo)
    references tblSexo (idSexo),
    unique index (idDiretor)
);

create table tblFilmeDiretor (
	idFilmeDiretor int not null auto_increment primary key,
    idFilme int not null,
    idDiretor int not null,
    
    #relacionamento com filme
    constraint FK_Filme_FilmeDiretor
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    #relacionamento com diretor
    constraint FK_Diretor_FilmeDiretor
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    unique index (idFilmeDiretor)
);

create table tblAtor (
	idAtor int not null auto_increment primary key,
    nome varchar(8),
    nomeArtistico varchar(80),
    dataNasc date not null,
    biografia text,
    idSexo int not null,
    unique index (idAtor)
);

show tables;

#alterando a estrutura da tabela
	#altera propriedades de uma tabla
	alter table tblAtor
		modify column nome varchar(80) not null;
		
	#permite mudar a escrita e as propriedades
	alter table tblAtor
		change column dataNasc dataNascimento date not null;

	#permite adicionar novo atributo
	alter table tblAtor
		add column dataFalecimento date;

	#adicionar relacionamento em tabela já existente
	alter table tblAtor
		add constraint FK_Sexo_Ator
		foreign key (idSexo)
		references tblSexo (idSexo);

	#adicionando nova unique index (exemplo)
	alter table tblAtor
		add unique index(idAtor, foto);

	#drop foreign key - perite apagar um relacionamento
	alter table tblAtor
		drop foreign key FK_Sexo_Ator;
		
	#drop column - permite apagar um atributo
	alter table tblAtor
		drop column idSexo;

	desc tblAtor;

	alter table tblAtor
		add column idSexo int not null,
		add constraint FK_Sexo_Ator
			foreign key (idSexo)
			references tblSexo (idSexo);
            



#mostrar constraint (exemplo mySQL)
SELECT
	CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
	REFERENCED_TABLE_NAME = 'tblFilme';