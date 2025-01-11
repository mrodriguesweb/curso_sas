data vendas_anual;
input mes $ total;
cards;
01/2021    1000
02/2021    2000 
03/2021	   2400
04/2021	   3000	
05/2021	   4200
06/2021    1200
07/2021	   1500
08/2021    1800
09/2021    2200
10/2021    2600
11/2021    3400
12/2021    4000
;

data media_vendas;

	set vendas_anual;
	
	total_1m = lag(total);
	total_2m = lag2(total);
	
	media = total + total_1m + total_2m / 3;
	
	format media commax8.2;
	
run;