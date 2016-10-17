%{
#include<stdio.h>
#include "y.tab.h"
%}

%%

[0-9]+		{yylval.sym=(char)yytext[0];	return LETTER;}
[a-zA-Z]+	{yylval.sym=(char)yytext[0];	return LETTER;}

[\n]		{return 0;}

.		{return *yytext;}

%%

int yywrap()
{
	return 1;
}
