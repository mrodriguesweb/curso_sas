data exemplo;
input salario;
cards;
1100.70
2000.00
900.60
1200.50
2300.60
1300.70
1900.00
1020.80
500.00
4000.50
1050.00
5000.20
1400.54
1340.53
820.70
;

proc print;
    var salario;
run;

proc summary data=exemplo print alpha=0.05 clm;
    var salario;
run;