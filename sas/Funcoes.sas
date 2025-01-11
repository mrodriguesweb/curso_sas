data tbl_cadastro;
     input nome $ 1-8 uf $ 9-11 dt_cadastro 12-20 idade 20-22 altura 25-28 .2;
     cards;
Jose    SP 20200103 23  1.70
Joao    GO 20190203 30  1.68
Leandro PR 20180129 25  1.81
Mario   PR 20150724 27  1.64
Leandro SP 20130708 22  1.87
;
run;

data tbl_trata_numerico(drop= uf dt_cadastro);

	set tbl_cadastro;
	
	altura_inteira = int(altura);
	altura_arredondada = round(altura, 0.1);

run;


data tbl_trata_caractere(drop = idade uf altura);

	set tbl_cadastro;
	
	nome_maiusculo = upcase(nome);
	nome_minusculo = lowcase(nome);
	nome_padrao = propcase(nome);
	nome_sem_espaco = compress(propcase(nome));
	
	nome_sobrenome = catt(nome, " Silva");
	
	ano = substr(put(dt_cadastro, 8.), 1, 4);
	
	if find(nome, "Jose") then	
		nome = tranwrd(nome, "e", "é");
	
run;