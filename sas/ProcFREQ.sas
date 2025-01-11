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
Fernando 	M  11/01  1000.00	
Josias	 	M  02/01  2000.30    
Claúdio  	M  23/01  2400.20    
Rogério  	M  14/01  3000.10	
Rodrigo  	M  05/01  4200.40    
Fernanda 	F  16/01  1200.50    
Leonardo 	M  17/01  1500.70    
Analice 	F  08/01  2200.80     
;

data vendas_janeiro_faixas;

	attrib
		faixa length=$9.;

	set vendas_janeiro;
	
	if total_venda <= 1500 then 
		faixa = "0-1500";
	else if total_venda <= 3000 then 
		faixa = "1501-3000";
	else
		faixa = "3001-";
		
run;

proc freq data=vendas_janeiro_faixas;
	table faixa*genero;
run;