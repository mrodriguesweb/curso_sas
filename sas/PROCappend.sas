data vendas_janeiro_final;
input nm_venda $10. genero $ dt_venda $10. total_venda 8.2;
cards;
Fernando   M  11/01       1000.00
Fernanda   F  02/01    	  2300.00
Francisco  M  23/01       650.20
Rogério    M  14/01       450.00
Rodrigo    M  05/01       2500.00
;

data vendas_janeiro_RJ;
input nm_venda $10. genero $ dt_venda $10. total_venda 8.2;
cards;
Fernanda   F  12/01    	  2500.00
Francisca  F  19/01       950.70
Isabela    F  15/01       2500.00
Rodrigo    M  08/01       700.60
;

data vendas_janeiro_BA;
input nm_venda $10. genero $ dt_venda $10. total_venda 8.2;
cards;
Fernando   M  13/01       900.00
Fernanda   F  09/01    	  2500.00
Stephane   F  02/01       600.00
;

%macro fecha_vendas(SIGLA_ESTADO, mes);

	proc append base=vendas_&mes._final data=vendas_janeiro_&SIGLA_ESTADO.;
	
%mend;

%fecha_vendas(RJ, janeiro);
%fecha_vendas(BA, janeiro);
	