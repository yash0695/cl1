%{
#include<stdio.h>
#include "y.tab.h"
%}

%%

[ \t\n] 	;
	
main	{return MAIN;}
printf	{return PRINTF;}
if	{return IF;}
for	{return FOR;}
return 	{return RETURN;}
"="	{return EQUALS;}

int |
float |
char  |
double	{return DATATYPE;}

"++" |
"--" 	{return INC;}

"+" |
"-" |
"*" |
"/" 	{return OP;}

"<" |
">" |
"<=" |
">=" |
"==" |
"!=" 	{return LOGICALOP;}

"&&" |
"||" 	{return CONJOP;}

"(" |
")" |
"{" |
"}" |
"," |
";"	{return *yytext;}

[0-9]+	{return NUMBER;}

[a-zA-Z_][a-zA-Z0-9]* 	{return IDENTIFIER;}

\"(.)*\"	{return LITERAL;}

%%

int yywrap()
{
	return 1;
}




