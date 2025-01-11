data vendas_012021;
input dia total;
cards;
01    1600
06    2000 
;

data vendas_022021;
input dia total;
cards;
14    100
06    2000
22    5000 
;

data vendas_032021;
input dia total;
cards;
04    4100
08    200
11    500
29	  4500 
;
























































data captura_venda_01;

	set vendas_012021;
	
	if total > 4000;
	
run;

data captura_venda_02;

	set vendas_022021;
	
	if total > 4000;
	
run;

data captura_venda_03;

	set vendas_032021;
	
	if total > 4000;
	
run;

%let mes_ano = vendas_032021;
data captura;

	set &mes_ano;
	
	if total > 4000;
	
run;

%macro vendas_maior(input, output);
	data &output;
	
		set &input;
		
		if total > 4000;
		
	run;
%mend;
%vendas_maior(vendas_012021, captura_venda_01);
%vendas_maior(vendas_022021, captura_venda_02);
%vendas_maior(vendas_032021, captura_venda_03);