%{
#include<stdio.h>
int line=1;
%}


%%

"/*"(.|\n)*"*/"		{ printf(" multiline comment detected \n"); fprintf(yyout,"%d\t%s\tmultiline comment\n",line,yytext);}
"//"(.)*		{ printf(" singleline comment detected \n"); fprintf(yyout,"%d\t%s\tsingleline comment\n",line,yytext);}

"#include"		{ printf(" preprocessor directive \n"); fprintf(yyout,"%d\t%s\tpreprocessor directive\n",line,yytext);}

[\n]			{line++;}

" "			;

"<"((.)*.h)">"		{ printf(" header file \n"); fprintf(yyout,"%d\t%s\theader file\n",line,yytext);}

int |
float |
char |
double 			{ printf(" datatype detected \n"); fprintf(yyout,"%d\t%s\tdatatype detected\n",line,yytext);}

"(" |
")" |
"[" |
"{" |
"}" |
"]" |
";" 			{ printf(" symbol \n"); fprintf(yyout,"%d\t%s\tsymbol\n",line,yytext);}

main |
for |
if |
return 			{ printf(" keyword \n"); fprintf(yyout,"%d\t%s\tkeyword\n",line,yytext);}

printf			{ printf(" printing library function \n"); fprintf(yyout,"%d\t%s\tprinting libraray function\n",line,yytext);}

scanf			{ printf(" scanning library function \n"); fprintf(yyout,"%d\t%s\tscanning function\n",line,yytext);}

"+" |
"-" |
"*" |
"/" |
"="			{ printf(" binary operator \n"); fprintf(yyout,"%d\t%s\t binary operator\n",line,yytext);}

\"(.)*\"		{ printf(" string literal \n"); fprintf(yyout,"%d\t%s\tstring literal\n",line,yytext);}

[0-9]+			{ printf(" numeric value \n"); fprintf(yyout,"%d\t%s\tnumeric value\n",line,yytext);}

[a-zA-Z_][a-zA-Z0-9]*   { printf(" identifier \n"); fprintf(yyout,"%d\t%s\tidentifier\n",line,yytext);}

.			{ printf(" unhandled token \n"); fprintf(yyout,"%d\t%s\tunhandled token\n",line,yytext);}

%%

int main()
{
	yyin=fopen("myfile.c","r");
	yyout=fopen("result.txt","w");
	yylex();
	fclose(yyin);
	return 0;
}

int yywrap()
{
	return 1;
}
