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

data vendas_janeiro_virtual;
input nm_venda $ genero $ dt_venda $ total_venda;
cards;
Fernando 	M  11/01  1000.00	    
Rogério  	M  14/01  3000.10    
Adriana 	F  08/01  400.80
Felipe 		M  10/01  1200.80  
Analice 	F  08/01  2200.80  
;

proc sql;
	create table vendas_janeiro_final as
		select * from vendas_janeiro
		union all select * from vendas_janeiro_virtual;
quit;
		