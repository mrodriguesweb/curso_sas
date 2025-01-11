data vendas_janeiro;
input nm_venda $10. genero $ dt_venda $10. total_venda 8.2;
cards;
Fernando   M  11/01       1000.00
Fernanda   F  02/01    	  2300.00
Francisco  M  23/01       650.20
Rogério    M  14/01       450.00
Rodrigo    M  05/01       2500.00
;

data teste_loop;

	attrib
		dt_venda2 format=$10. format=ddmmyy10. informat=ddmmyy10.;

	set vendas_janeiro;
	
	dt_venda = catt(dt_venda, "/", "2022");
	dt_venda2 = input(dt_venda, ddmmyy10.);
	
	if dt_venda2 < '11jan2022'd then do i = 1 to 2;
		total_parcela = total_venda / 2;
		format total_parcela commax16.2;
		output;
	end;
	else delete;
	
	drop i dt_venda;

run;