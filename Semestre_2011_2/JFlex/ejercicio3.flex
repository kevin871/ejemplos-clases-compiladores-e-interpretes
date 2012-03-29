import java.io.*;
import java.lang.*;

%%

%{
	static FileInputStream FInStr = null;
	static String fInName ; //nombre archivo entrada
	static int valorASumar;

	public static void main (String argv[])
	throws java.io.IOException {

		int numparams = argv.length; //n�mero argumentos pasados
		
		//Obtenci�n de par�metros pasados en l�nea de comandos
		if ( numparams != 1) 
		{ 	//error: nr. Par�metros incorrecto
			System.out.println ("N�mero par�metros incorrecto!. Uso: ");
			System.out.println ( "\tjava contador archivo.EXT");
			return; 
		}
		else 
		{ 	
			fInName = argv[0];		
			pongo yy = new pongo(new FileInputStream(fInName));
			while (yy.yylex() != -1) ; }
		} //Final main
%}


%initthrow{ // Declaro el tipo de excepcion declarada en la clausula throw
	FileNotFoundException
%initthrow}


%integer
%class pongo

%%
[Nn]		{ valorASumar=0; 
		  System.out.print("N");
		}
[Ss]		{ valorASumar=1; 
		  System.out.print("S");
		}
[ ]		{System.out.print(" ");}
[0-9]+	{	int tmp = Integer.parseInt(yytext());
			tmp = tmp + valorASumar;
			System.out.print(tmp);
		}
"\r\n"   {System.out.println();}





