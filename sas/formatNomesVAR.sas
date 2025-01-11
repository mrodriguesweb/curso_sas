data vendas_janeiro;
input nm_venda $ dt_venda $ total_venda;
cards;
Fernando 	11/01    1000.00
Josias	 	02/01    2000.30 
Claúdio  	23/01	 2400.20
Rogério  	14/01	 3000.10	
Rodrigo  	05/01	 4200.40
Fernanda 	16/01    1200.50
Leonardo 	17/01	 1500.70
Analice 	08/01    2200.80
;

proc print data=vendas_janeiro(rename=(nm_venda='Nome do cliente'n dt_venda='Data da Venda'n total_venda='Total da Venda'n)) 
	noobs;
run;
