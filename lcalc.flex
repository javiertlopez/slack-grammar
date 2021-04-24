
   
import java_cup.runtime.*;
      
%%
%class Lexer

%line
%column
%cup
   

%{   
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {	  
    	return new Symbol(type, yyline, yycolumn, value);
    }
    
%}
   
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [\ \t\f]
entero = 0 | [1-9][0-9]*
decimal = 0 | [1-9][0-9]*("."[1-9][0-9]*)?
letra = [A-Za-z]
digito= [0-9]
 
%%  
   /* YYINITIAL is the state */
   
<YYINITIAL> {
   
   ";"                { return symbol(sym.SEMI); }
    "*"                { return symbol(sym.TIMES); }
    "("                { return symbol(sym.LPAREN); }
    ")"                { return symbol(sym.RPAREN); }
    "_"				   { return symbol(sym.ESPACIO); }
    "&"				   { return symbol(sym.COMODIN); }
    ","				   { return symbol(sym.UNION) }
    "$"				   { return symbol(sym.EPSILON) }
    
   	{letra} 	  { return symbol(sym.LETRA, yytext()); }	
    {digito}      { return symbol(sym.NUMBER, yytext()); }

   
    {WhiteSpace}       { /* do nothing */ }   
}

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
