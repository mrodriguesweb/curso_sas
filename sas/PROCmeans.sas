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

proc means data=vendas_janeiro;
    var total_venda;
run;

proc means data=vendas_janeiro;
	class genero;
    var total_venda;
run;

proc means n mean std p25 p50 p75 data=vendas_janeiro maxdec=2;
	class genero;
    var total_venda;
run;