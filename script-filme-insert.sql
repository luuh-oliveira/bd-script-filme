#INSERT, UPDATE E DELETE

#-----------------------INSERT----------------------------
#gravar todos os values com aspas simples, exceto int
insert into tblGenero (nome) 
				values ('Aventura');
                
insert into tblGenero (nome) 
				values ('Romance');

#insert de multiplos valores 
#Genero
insert into tblGenero (nome) 
				values ('Animação'),
                ('Musical'),
                ('Policial'),
                ('Fantasia'),
                ('Drama');
                
#Classificação
insert into tblClassificacao (nome)
				values ('+10'),
                ('+12'),
                ('+14'),
                ('+16'),
                ('+18'),
                ('Livre');
                
#Filme
insert into tblFilme (nome, 
duracao, 
dataLancamento, 
dataRelancamento, 
sinopse, 
nomeOriginal, 
fotoCapa, 
idClassificacao,
qtde)
				values ('FORREST GUMP - O CONTADOR DE HISTÓRIAS',
                '02:20:00',
                '1994-12-07',
                null,
                'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.',
                'Forrest Gump',
                'filme03.jpg',
                4,
                3),
                ('À ESPERA DE UM MILAGRE',
                '03:09:00',
                '2000-03-10',
                null,
                '1935, no corredor da morte de uma prisão sulista. Paul Edgecomb (Tom Hanks) é o chefe de guarda da prisão, que temJohn Coffey (Michael Clarke Duncan) como um de seus prisioneiros. Aos poucos, desenvolve-se entre eles uma relação incomum, baseada na descoberta de que o prisioneiro possui um dom mágico que é, ao mesmo tempo, misterioso e milagroso.',
                'The Green Mile',
                'foto04.png',
                4,
                4);
                
#obs insert: datas - yyyy-MM-dd / hora - 00:00:00 / null qdo n tiver valor

#filme genero - tbl intermediaria
insert into tblFilmeGenero (idFilme, idGenero)
					values (1,1),
							(2,2),
                            (2,3),
                            (2,4);


#-----------------------UPDATE----------------------------

update tblfilme set duracao = '03:00:00' where idFilme = 1;

#-----------------------DELETE----------------------------

delete from tblgenero where idGenero = 7;


select * from tblgenero;


