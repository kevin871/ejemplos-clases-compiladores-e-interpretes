import java.io.*;
import java.lang.*;
%%
%{
	static FileInputStream FInStr = null;
	static String fInName ; //nombre archivo entrada

	public static void main (String argv[])
	throws java.io.IOException {

		//Obtenci�n de par�metros pasados en l�nea de comandos
		if ( argv.length != 1) 
		{ 	//error: nr. Par�metros incorrecto
			System.out.println ("N�mero par�metros incorrecto!. Uso: ");
			System.out.println ( "\tjava contador archivo.EXT");
			return; 
		}
		else 
		{ 	
			fInName = argv[0];		
			primero yy = new primero(new FileInputStream(fInName));
			while (yy.yylex() != -1) ; }
		} //Final main
%}

%initthrow{ // Declaro el tipo de excepcion declarada en la clausula throw
	FileNotFoundException
%initthrow}


%integer
%class primero

%%
[A-Za-z0-9]+ { System.out.print(yytext()); }
^[ ]+		{ /*nada*/}
[ ]+$		{ /*nada*/}
[ ]+			{ System.out.print(" ");}
"\r\n"+		{ System.out.println();}







