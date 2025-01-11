data vendas_janeiro;
input nm_venda $ genero $ dt_venda $10.;
cards;
Fernando M  11/01
Josias	 M  02/01    
Claúdio  M  23/01   
Rogério  M  14/01  
Rodrigo  M  05/01    
Fernanda F  16/01    
Leonardo M  17/01    
Analice  F  08/01    
;

data texto_p_numero;

	set vendas_janeiro;
	
	dt_venda = catt(dt_venda, "/", "2022");
	dt_venda_num = input(dt_venda, ddmmyy10.);
	format dt_venda_num ddmmyy10.;
	
run;


data numero_p_texto;

	set texto_p_numero;
	
	dt_venda_txt = put(dt_venda_num, ddmmyy10.);
	
run;