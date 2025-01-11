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
Fernando 	M  12/01  1000.00	
Josias	 	M  03/01  2000.30    
Claúdio  	M  24/01  2400.20    
Rogério  	M  15/01  3000.10	
Rodrigo  	M  06/01  4200.40    
Fernanda 	F  17/01  1200.50   
Leonardo 	M  17/01  1500.70    
Analice 	F  08/01  2200.80     
;

proc sort data=vendas_janeiro;
	by nm_venda;
run;

proc sort data=vendas_janeiro out=no_dups
	dupout=with_dups nodupkey;
	by nm_venda;
run;

proc sort data=vendas_janeiro(drop=dt_venda) out=no_dups_all nodupkey;
	by _all_;
run;

data tbl_unicos tbl_dups;
     set vendas_janeiro;
     by nm_venda;
     if first.nm_venda and last.nm_venda
          then output tbl_unicos;
     else output tbl_dups;
run;
