import java.io.*;
import java.lang.*;
%%
%{
	static FileInputStream FInStr = null;
	static String fInName ; //nombre archivo entrada
     static boolean suma=false;

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
			tercero yy = new tercero(new FileInputStream(fInName));
			while (yy.yylex() != -1) ; }
		} //Final main
%}

%initthrow{ // Declaro el tipo de excepcion declarada en la clausula throw
	FileNotFoundException
%initthrow}


%integer
%class tercero

%%
^s {suma=true; }
^n {suma=false;}
\r\n {System.out.println();}
" " {System.out.print(" ");}
[0-9]+  {if(suma==false)   System.out.print(yytext());
		else System.out.print(Integer.parseInt(yytext())+1);
         }






