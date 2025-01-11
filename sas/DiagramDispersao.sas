data vendas_trimestre;
    input valor trimestre; 
    datalines;
    5.5  1
    5.7	 1
    5.2	 3
    10.4 4
    10.0 1
    10.8 2
    11.2 1
    13.4 2
    8.5	 3
    8.0	 1
    20.0 2
    23.0 2
    ;
proc print;
run;

SYMBOL1 V=circle C=blue I=none;
TITLE 'Vendas x Trimestre';
PROC GPLOT DATA=vendas_trimestre;
 PLOT valor*trimestre;
RUN;