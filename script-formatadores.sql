#retorna a data atual
select curdate() as dataAtual;
select current_date() as dataAtual;

#retorna a hora atual do servidor
select curtime() as horaAtual;
select current_time() as horaAtual;

select current_timestamp() as dataHoraAtual;

#FUNÇÕES DE FORMATAÇÃO DE DATA E HORA
select time_format(curtime(), '%H') as hora;
select time_format(curtime(), '%i') as minuto;
select time_format(curtime(), '%s') as segundo;
select time_format(curtime(), '%H:%i') as horaMinuto;
select time_format(curtime(), '%r') as horaAMPM;
select time_format(curtime(), '%T') as hora24H;

#hour(), minute, second()
select hour(curtime()) as hora;
select minute(curtime()) as minuto;
select second(curtime()) as segundos;

#timediff - calcula a diferença ente horas
select timediff(curtime(), '06:00:00') as diferençaHora;

#FUNÇÕES DE FORMATAÇÃO DE DATA

select date_format(curdate(), '%W') as diaSemana;
select date_format(curdate(), '%w') as numeroDiaSemana; #(domingo = 0)
select date_format(curdate(), '%a') as diaSemana;

select date_format(curdate(), '%m') as mes;
select date_format(curdate(), '%M') as mes;
select date_format(curdate(), '%b') as mes;

select date_format(curdate(), '%d') as dia;

select date_format(curdate(), '%y') as ano;
select date_format(curdate(), '%Y') as ano;

select date_format(curdate(), '%d/%m/%Y') as dataFormatada;

#day(), month(), year*)
select day(curdate()) as dia;
select month(curdate()) as mes;
select year(curdate()) as ano;

#datediff - calcula a diferença entre datas
select datediff(curdate(), '2021-11-23') as diferençaData;

select week(curdate()) as numerosDaSemana;
select weekday(curdate()) as diaDaSemana; #(segunda = 0 e domingo = 6)
select weekofyear(curdate()) as numeroDaSemana;
select yearweek('2021-01-04') as anoNumeroSemana; # retorna o ano e o número da semana do dia 
select dayofyear(curdate()) as numeroDiaAno;





