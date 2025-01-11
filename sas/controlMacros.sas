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

data vendas_janeiro_final_BA;
	input nm_venda $10. genero $ dt_venda $10. total_venda 8.2;
	cards;
Fernando   M  13/01       900.00
Fernanda   F  09/01    	  2500.00
Stephane   F  02/01       600.00
;

proc sql;
	delete * from work.vendas_janeiro_final;
quit;

%macro fecha_vendas(data, estado);

	proc sql noprint;
  		select count(*) into :contador from vendas_janeiro_final;
	quit;

	%if &contador = 0 %then %do;
    	%put >>> "Dataset Vazio";
    %end;
    %else %do;
    	proc append base=&data. data=&data.&estado.;
    %end;
    
%mend;

%fecha_vendas(vendas_janeiro_final, _BA);