libname import '/home/u61542083/import/';

%let arquivo = txtAlunos;

%let fullpath = '/home/u61542083/import/&arquivo..txt';

options obs=max;

DATA work.fechamento_notas;
	infile "&fullpath" truncover dsd lrecl=70;

	input @01 linha $char100.;
	
	attrib
		nome 			length=$11. format=$11. informat=$11.
		dt_nascimento 	length=$10. format=$10. informat=$10.
		registro 		length=$9.  format=$9.	informat=$9.
		nota1			length=3.1	format=3.1	informat=3.1
		nota2			length=3.1	format=3.1	informat=3.1
		materia 		length=$11. format=$11. informat=$11.
		media			length=3.1	format=3.1  informat=3.1
		control			length=$10. format=$10. informat=$10.
		data_arquivo	length=8.	format=ddmmyy10. informat=ddmmyy10.
		anomes 			length=8.	format=mmyyn6. informat=mmyyn6.;
		
	%put &=fullpath.;
	
	if index(substr(linha, 30,10), "/") gt 1 then do;
		data_arquivo	= input(substr(linha, 30, 10), ddmmyy10.);
		anomes = input(data_arquivo, mmyyn6.);
	end;
	
	if index(substr(linha, 10, 6), "/") lt 1 then do;
		materia	= substr(linha, 1, 11);
	end;
	else do;
		nome = tranwrd(compress(substr(linha, 1, 9), "012345689"),"é","e");
		dt_nascimento = substr(linha, 11,10);
		registro = substr(linha, 31, 9);
		nota1 = input(substr(linha,42,3), 3.1);
		nota2 = input(substr(linha,57,3), 3.1);
		media = (nota1 + nota2)/ 2;
		
		if media >= 5 then
			control = "Aprovado";
		else
			control = "Reprovado";
	end;
		
	drop linha;
	
	retain materia data_arquivo anomes;
	
	if nome eq "" then delete;

run;
