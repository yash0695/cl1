%{
#include<stdio.h>
extern FILE* yyin;
%}

%token MAIN FOR IF RETURN EQUALS LITERAL INC NUMBER IDENTIFIER OP LOGICALOP CONJOP DATATYPE PRINTF


%%

main: MAIN '(' ')' '{' body '}' 	{ printf("main terminated\n");}
;

body: dec stmt1
;

dec: DATATYPE variable ';'
    |DATATYPE IDENTIFIER EQUALS NUMBER ';'     {printf("valid declaration with initialization\n");}
    |
;

variable: IDENTIFIER ',' variable | IDENTIFIER  {printf("valid declaration w/o initialization\n");}
;

stmt1: stmt stmt1 |
;

stmt: printf | if | inc 
;

printf: PRINTF '(' LITERAL ')' ';'	{printf("valid printf\n");}
;

if: IF '(' condition ')' '{' body '}'    {printf("valid if statement\n");}
;

condition: IDENTIFIER LOGICALOP var CONJOP condition |  IDENTIFIER LOGICALOP var
;

var: NUMBER|IDENTIFIER
;
inc: IDENTIFIER INC ';' {printf("valid increment\n ");}
;

%%
int main()
{
	yyin=fopen("myfile.c","r");
	yyparse();
	fclose(yyin);
}

void yyerror()
{
	printf("errror");
}

