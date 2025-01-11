data tbl_cadastro;
     input nome $ uf $ dt_cadastro yyyymmdd. idade;
     cards;
José 	SP 20200103 23
João 	GO 20190203 30
Leandro PR 20180129 25
Mario 	PR 20150724 27
Leandro SP 20130708 22
;
run;

data tbl_data;

	set tbl_cadastro;
	
run;

proc sql;

	create table tbl_sql as
		select * from tbl_cadastro;
		
quit;























/*  */
/* data tbl_data; */
/*  */
/* 	Le um arquivo SAS que já exista em alguma bibioteca */
/* 	set tbl_cadastro; */
/* 	 */
/* 	if nome = "Leandro" then */
/* 		idade = idade + 2; */
/* 	else */
/* 		idade = idade - 1; */
/* 	 */
/* run; */
/*  */
/* proc sql; */
/* 	 */
/* 	create table tbl_sql as */
/* 		select * from tbl_cadastro */
/* 		where nome = "Leandro"; */
/* 	 */
/* quit; */
/*  */
/* proc print data=tbl_data(drop= idade) noobs blankline=1; */
/* 	var nome idade; */
/* 	title "Cadastro"; */
/* 	footnote "Obs: fase de testes."; */
/* 	sum idade; */
/* run; */
