%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
%}

%%

[ \t\n] 	;

main		{return MAIN;}

printf		{return PRINTF;}

if		{return IF;}

for 		{return FOR;}

return 		{return RETURN;}

int |
char |
float |
double 		{return DATATYPE;}

"="		{return EQUALS;}

"++" |
"--"		{return INC;}

"<=" |
">=" |
"<"  |
">"  |
"=="  		{return LOGOP;}


"&&" |
"||"		{return CONJOP;}

[0-9]+		{ yylval=atoi(yytext);
		 return NUMBER;}

[a-zA-Z0-9]+	{return IDENTIFIER;}

\"[a-zA-Z0-9]*\"  {return LITERAL;}

"(" |
")" |
";" |
"," |
"{" |
"}"		{return yytext[0];}



%%

int yywrap()
{
	return 1;
}
