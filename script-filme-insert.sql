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
idClassificacao)
				values ('UM SONHO DE LIBERDADE',
                '02:20:00',
                '1995-01-25',
                null,
                'Em 1946, Andy Dufresne (Tim Robbins), um jovem e bem sucedido banqueiro, tem a sua vida radicalmente modificada.
                ao ser condenado por um crime que nunca cometeu, o homicídio de sua esposa e do amante dela. Ele é mandado para uma 
                prisão que é o pesadelo de qualquer detento, a Penitenciária Estadual de Shawshank, no Maine. Lá ele irá cumprir a 
                pena perpétua. Andy logo será apresentado a Warden Norton (Bob Gunton), o corrupto e cruel agente penitenciário, 
                que usa a Bíblia como arma de controle e ao Capitão Byron Hadley (Clancy Brown) que trata os internos como animais. 
                Andy faz amizade com Ellis Boyd Redding (Morgan Freeman), um prisioneiro que cumpre pena há 20 anos e controla 
                o mercado negro da instituição.',
                'The Shawshank Redemption',
                'filme01.jpg',
                4),
                ('O REI LEÃO',
                '01:29:00',
                '1994-07-08',
                '2011-08-26',
                'Clássico da Disney, a animação acompanha Mufasa (voz de James Earl Jones), o Rei Leão, e a 
                rainha Sarabi (voz de Madge Sinclair), apresentando ao reino o herdeiro do trono, Simba (voz de 
                Matthew Broderick). O recém-nascido recebe a bênção do sábio babuíno Rafiki (voz de Robert Guillaume), 
                mas ao crescer é envolvido nas artimanhas de seu tio Scar (voz de Jeremy Irons), o invejoso e 
                maquiavélico irmão de Mufasa, que planeja livrar-se do sobrinho e herdar o trono.',
                'The Lion King',
                'foto02.png',
                6);
                
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

