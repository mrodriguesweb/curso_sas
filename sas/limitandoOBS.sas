data objetos_letra_A;
input objeto $;
cards;
ábaco
abajur
abre-latas
açucareiro
agogô
agulha
alaúde
alfinete
alforje
algema
alicate
almofada
almofariz
ampulheta
âncora
anel
antena
anzol
apagador
apito
apontador
aquecedor
arado
arco
armadura
aro
arpão
aspirador
astrolábio
azulejo 
ábaco
abajur
abre-latas
açucareiro
agogô
agulha
alaúde
alfinete
alforje
algema
alicate
almofada
almofariz
ampulheta
âncora
anel
antena
anzol
apagador
apito
apontador
aquecedor
arado
arco
armadura
aro
arpão
aspirador
astrolábio
azulejo 
;

data testa_lista;

	quantidade_1 = 0;

	set objetos_letra_A(OBS=5);
	
	if (index(objeto, "á") gt 0) then
		quantidade_1 = 1;
		
run;

proc sql outobs=5;
	create table testa_lista_sql as
	select objeto, 
	case when objeto like '%á%' then 1 else 0 end as quantidade
	from objetos_letra_A ;
quit;