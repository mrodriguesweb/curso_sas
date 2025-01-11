data vendas_janeiro;
input nm_venda $ genero $ dt_venda $10. total_venda;
cards;
Fernando M  11/01       1000.10
Josias	 M  02/01    	2300.00
Claúdio  M  23/01       650.20
Rogério  M  14/01       450.00
Rodrigo  M  05/01       2500.00
Fernanda F  16/01       120.00
Leonardo M  17/01       380.00
Analice  F  08/01       150.50
;

data teste_loop;

	set vendas_janeiro;
	
	dt_venda = catt(dt_venda, "/", "2022");
	dt_venda_num = input(dt_venda, ddmmyy10.);
	format dt_venda_num ddmmyy10.;
	
	if dt_venda_num < '11jan2022'd then do i = 1 to 2;
		total_parcela = total_venda / 2;
		format total_parcela commax16.2;
		output;
	end;
	else delete;
	
	drop i;
	
run;