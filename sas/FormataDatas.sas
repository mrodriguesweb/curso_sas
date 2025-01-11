libname teste '/home/u61542083/curso/lib/';

data teste.tbl_cadastro;
     input nome $ uf $ dt_cadastro yyyymmdd. idade;
     cards;
José 	SP 20220902 23
João 	GO 20190203 30
Leandro PR 20180129 25
Mario 	PR 20150724 27
Leandro SP 20130708 22
;
run;

data tbl_data;

	set teste.tbl_cadastro;
	
	cadastro = input(put(dt_cadastro, 8.), yymmdd10.);
	format cadastro yymmdd10.;
	
	if cadastro > '01jan2019'd;
	
run;

proc sql;
	select min(cadastro) as dt_max format=date9.
		from tbl_data;
quit;

data funcoes_datas;

	set tbl_data;
	
	dia = day(cadastro);
	mes = month(cadastro);
	ano = year(cadastro);
	diaSemana = weekDay(cadastro);

run;

data tbl_datadif;

	set tbl_data;
	
    dif_meses=intck('month',cadastro,today());
    dif_anos=intck('year',cadastro,today());
    dif_dias=intck('day',cadastro,today());
    dif_semestres=intck('semiyear',cadastro,today());
    dif_trimestres=intck('qtr',cadastro,today());
    
run;