proc import datafile="/home/u61542083/import/Alunos.csv"
	out=import dbms=dlm replace;
	delimiter=';';
	getnames=yes;
run;

data work.alunos;

	attrib	
		media length=3.1 format=3.1 informat=3.1
		control length=$10. format=$10. informat=$10.;

	set work.import(rename=('Nota 1° Semestre'n=Nota1 'Nota 2° Semestre'n=Nota2));
	
	media = (Nota1 + Nota2) / 2;
	
	if media >= 5 then
		control = "Aprovado";
	else
		control = "Reprovado";
		
run;

proc print data=work.alunos noobs;
	var nome Nota1 Nota2 media control;
run;