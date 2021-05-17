
   
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
letra = [A-Za-z]
id = [A-Za-z] + [A-Za-z_0-9]*
string = \"[a-zA-Z_@0-9.!?\,:*+-_ ]*\"


%%  
   /* YYINITIAL is the state */
   
<YYINITIAL> {
   
   ";"                 { return symbol(sym.SEMI); }
    "("                { return symbol(sym.LPAREN); }
    ")"                { return symbol(sym.RPAREN); }
    ","				   { return symbol(sym.UNION); }
    "if"				{ return symbol(sym.IF); }
    "else"				{ return symbol(sym.ELSE); }
    "for"				{ return symbol(sym.FOR); }
    "in"				{ return symbol(sym.IN); }
    "const"				{ return symbol(sym.CONST); }
    "conversation"		{ return symbol(sym.CONVERSATION); }
    "chat"				{ return symbol(sym.CHAT); }
    "message"			{ return symbol(sym.MESSAGE); }
    "{"					{ return symbol(sym.LKEY); }
    "}"					{ return symbol(sym.RKEY); }
    "create"			{ return symbol(sym.CREATE); }
    "invite"			{ return symbol(sym.INVITE); }
    "purpose"			{ return symbol(sym.PURPOSE); }
    "archive"			{ return symbol(sym.ARCHIVE); }
    "kick"				{ return symbol(sym.KICK); }
    "rename"			{ return symbol(sym.RENAME); }
    "members"			{ return symbol(sym.MEMBERS); }
    "true"			    { return symbol(sym.TRUE); }
    "false"				{ return symbol(sym.FALSE); }
    "let"				{ return symbol(sym.LET); }
     "&&"				{ return symbol(sym.AND); }
     "||"				{ return symbol(sym.OR); }
     "=="				{ return symbol(sym.EQUAL); }
     "!="				{ return symbol(sym.DIFFERENT); }
     ">="				{ return symbol(sym.EQUALBIGGER); }
     "<="				{ return symbol(sym.EQUALLESSER); }
     ">"				{ return symbol(sym.BIGGER); }
     "<"				{ return symbol(sym.LESS); }
     "=" 				{ return symbol(sym.ASSIGN); }
     "["				{ return symbol(sym.LBRACKET); }
     "]"				{ return symbol(sym.RBRACKET); }
     "\""				{}
    
    
   	{string} 	  { return symbol(sym.STRING, yytext()); }	
    {id}      { return symbol(sym.ID, yytext()); }

   
    {WhiteSpace}       { /* do nothing */ }   
}

<YYINITIAL>[^]          { 
							String m = "Error: line " + (yyline+1)+", columna "+(yycolumn+1) + ": lexical error";
							System.err.println(m);
						}














