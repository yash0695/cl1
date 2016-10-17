%{
#include<stdio.h>
extern FILE* yyin;
%}

%token MAIN DATATYPE IDENTIFIER PRINTF IF INC LITERAL NUMBER RETURN LOGOP CONJOP EQUALS FOR


%%

main:	MAIN '(' ')' '{' body '}' {printf("main terminated\n");}
;
body:  dec stmt1
;
dec:  DATATYPE variable ';' 
     | DATATYPE IDENTIFIER EQUALS NUMBER ';'    {printf("valid initialization\n");}
     |
;
variable: IDENTIFIER ',' variable | IDENTIFIER    {printf("valid declaration w/o initialization\n");}
;
stmt1: stmt stmt1 |
;

stmt: printf | if | inc | return |for
;
for: FOR  '(' forloopcondition ')' '{' body '}'   {printf("valid for loop\n");}
;

forloopcondition: DATATYPE IDENTIFIER EQUALS NUMBER ';'IDENTIFIER LOGOP var ';' IDENTIFIER INC     {printf("valid for loop condition\n");}
;
printf: PRINTF '(' LITERAL ')' ';'  {printf("valid print statement\n");}
;

if: IF '(' condition ')' '{' body '}' {printf("valid if condition \n");}
;

condition: IDENTIFIER LOGOP var CONJOP condition | IDENTIFIER LOGOP var	{printf("valid condition statement\n");}
;

var: NUMBER|IDENTIFIER
;

return: RETURN NUMBER ';'		{printf("valid return statement\n");}
;
inc: IDENTIFIER INC ';'		{printf("valid inc operation\n");}
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
	printf("error\n");
}

