%{
#include "y.tab.h"
#include<stdio.h>
%}

%%

[0-9]+		{yylval.intval=atoi(yytext);	return NUMBER;}

[+-/*;]		{return *yytext;}

.		{ yyerror();}

%%

int yywrap()
{
	return 1;
}
