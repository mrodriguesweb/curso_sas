libname lib '/home/u61542083/curso/lib/';

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

data lib.descontos_janeiro;
input nm_venda $ dt_venda $ desconto;
cards;
Fernando   11/01  200.00	
Josias	   02/01  100.50            
Leonardo   17/01  50.70       
Claúdio    23/01  400.00    	
Rodrigo    05/01  20.40    
;

proc sql;
	create table final_janeiro as
	select 
		a.nm_venda as nome_cliente
		,a.genero as genero
		,a.dt_venda as data_venda
		,a.total_venda as valor_venda
		,b.desconto as desconto
		,a.total_venda - b.desconto as valor_final format=commax16.2
	from work.vendas_janeiro as a
		left join lib.descontos_janeiro as b
		on a.nm_venda = b.nm_venda and a.dt_venda = b.dt_venda 
		
	order by 1;

quit;

proc sort data=vendas_janeiro;
	by nm_venda dt_venda;
run;

proc sort data=lib.descontos_janeiro;
	by nm_venda dt_venda;
run;

data final_janeiro_merge;
	merge work.vendas_janeiro(IN=A) lib.descontos_janeiro(IN=B);
	by nm_venda dt_venda;
	if A;
run;

data final_janeiro_merge;
	merge work.vendas_janeiro lib.descontos_janeiro;
	by nm_venda ;
run;
		