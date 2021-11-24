select * from tblsexo;
select * from tblnacionalidade;
select * from tblator;
select * from tbldiretor;
select * from tblatornacionalidade;

insert into tblsexo (nome) 
				values ('Masculino'),
				('Feminino');
                
insert into tblnacionalidade (nome)
				values ('Francesa'),
                ('Canadense'),
                ('Brasileira');
                
insert into tblator (nome, 
nomeArtistico,
dataNascimento,
biografia,
foto,
idSexo,
dataFalecimento) 
	values ('Morgan Freeman',
			null,
            '1937-06-01',
            'Possui uma estrela na Calçada da Fama, localizada em 7021 Hollywood Boulevard.',
			'foto05.jpg',
            1,
            null),
            ('Garcia Júnior',
            null,
            '1967-03-02',
            null,
            'foto06.png',
            1,
            null);
            
insert into tblDiretor (nome,
dataNascimento,
nomeArtistico,
biografia,
foto,
idSexo) 
	values ('Rob Minkoff',
			'1962-08-11',
			null,
            null,
            'foto03.jpg',
            1),
            ('Ferenc Árpád Darabont',
            '1959-01-28',
            'Frank Darabont',
            'É o autor dos roteiros de "A Hora do Pesadelo 3", "A Mosca 2" e "Frankenstein de Mary Shelley".- Trabalhou como roteirista na série de TV norte-americana "O Jovem Indiana Jones".',
			'foto02.png',
            1);
            
insert into tblatornacionalidade (idAtor, idNacionalidade)
				values(1,1),
					(2,1),
                    (3,1),
                    (4,1),
                    (5,1),
                    (6,3);
                    
                    