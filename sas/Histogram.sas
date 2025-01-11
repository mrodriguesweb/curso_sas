data vendas;
    input valor; 
    datalines;
    5.5
    5.7
    5
    10.4
    10.0
    10.8
    11.2
    13.4
    8.5
    8.0
    20.0
    23.0
    ;
proc print;
run;

proc univariate data = vendas;
    var valor;
    histogram / midpoints=(5 to 25 by 5) ;
run;