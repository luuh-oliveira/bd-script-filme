use dbfilmesturmab;

show tables;

#criar tabelas 

create table tblFilmeGenero (
	idFilmeGenero int not null auto_increment primary key,
    idFilme int not null,
    idGenero int not null,
    
    #relacionamento com filme
    constraint FK_Filme_FilmeGenero
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    #relacionamento com genero
    constraint FK_Genero_FilmeGenero
    foreign key (idGenero)
    references tblGenero (idGenero),
    
    unique index (idFilmeGenero)
);

create table tblFilmeEstudio (
	idFilmeEstudio int not null auto_increment primary key,
    idFilme int not null,
    idEstudio int not null,
    
    constraint FK_Filme_FilmeEstudio
    foreign key (idFilme)
    references tblFilme (idFilme),
    #relacionamento com genero
    constraint FK_Estudio_FilmeEstudio
    foreign key (idEstudio)
    references tblEstudio (idEstudio),
    
    unique index (idFilmeEstudio)
);

create table tblFilmeAtor (
	idFilmeAtor int not null auto_increment primary key,
    idFilme int not null,
    idAtor int not null,
    
    constraint FK_Filme_FilmeAtor
    foreign key (idFilme)
    references tblFilme (idFilme),
    
    constraint FK_Ator_FilmeAtor
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    unique index (idFilmeAtor)
);

create table tblAtorNacionalidade (
	idAtorNacionalidade int not null auto_increment primary key,
    idAtor int not null,
    idNacionalidade int not null,
    
    constraint FK_Ator_AtorNacionalidade
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    constraint FK_Nacionalidade_AtorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idAtorNacionalidade)
);

create table tblDiretorNacionalidade (
	idDiretorNacionalidade int not null auto_increment primary key,
    idDiretor int not null,
    idNacionalidade int not null,
    
    constraint FK_Diretor_DiretorNacionalidade
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    constraint FK_Nacionalidade_DiretorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idDiretorNacionalidade)
);

create table tblRoteirista (
	idRoteirista int not null auto_increment primary key,
	nome varchar(80) not null,
    idSexo int not null,
    constraint FK_Sexo_Roteirista
    foreign key(idSexo)
    references tblSexo (idSexo),
    unique index (idRoteirista)
);
        
create table tblRoteiristaNacionalidade (
	idRoteiristaNacionalidade int not null auto_increment primary key,
    idRoteirista int not null,
    idNacionalidade int not null,
    
    constraint FK_Roteirista_RoteiristaNacionalidade
    foreign key (idRoteirista)
    references tblRoteirista (idRoteirista),
    
    constraint FK_Nacionalidade_RoteiristaNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idRoteiristaNacionalidade)
);


