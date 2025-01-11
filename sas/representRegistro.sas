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

proc sql;
	create table percent_venda as
	select  nm_venda,
			genero,
			dt_venda,
			total_venda,
			total_venda/soma_total_venda as percent format=percent7.1
	from (select *, sum(total_venda) as soma_total_venda from vendas_janeiro)
	
	order by 5 desc;
	
quit;
	
