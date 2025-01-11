data vendas_janeiro;
input nm_venda $ genero $ dt_venda $10.;
cards;
Fernando M  11/01
Josias	 M  02/01    
Claúdio  M  23/01   
Rogério  M  14/01  
Rodrigo  M  05/01    
Fernanda F  16/01    
Leonardo M  17/01    
Analice  F  08/01    
;

proc surveyselect 
    data= vendas_janeiro
    out= exemplo
    n = 3 method=SRS;
run;