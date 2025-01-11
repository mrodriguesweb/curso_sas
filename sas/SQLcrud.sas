data vendas_janeiro;
input nm_venda $ genero $ dt_venda $ total_venda;
cards;
Fernando 	M  11/01  1000.00	
Josias	 	M  02/01  2000.30    
Claúdio  	M  23/01  2400.20    
Rogério  	M  14/01  3000.10	
Rodrigo  	M  05/01  4200.40    
Fernanda 	F  16/01  1200.50    
Leonardo 	M  17/01  1500.70    
Analice 	F  08/01  2200.80    
;

proc sql;
	insert into work.vendas_janeiro(nm_venda, genero, dt_venda, total_venda)
	values ("Pedro", "M", "30/01", 890.20);
quit;

proc sql;
	select * from vendas_janeiro where nm_venda = "Pedro";
quit;

proc sql;
	update vendas_janeiro set dt_venda = "31/01" where nm_venda = "Pedro" and total_venda = 890.20;
quit;

proc sql;
	delete from vendas_janeiro where nm_venda = "Pedro" and dt_venda = "31/01";
quit;

proc print data=vendas_janeiro;
