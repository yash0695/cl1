%{
#include<stdio.h>

int ind=0;
char temp='A';
void Quadruple();
void ThreeAddress();

char AddToTable(char,char,char);

struct incod
{
	char op1;
	char op2;
	char opr;
};

struct incod code[20];

%}

%union{
	char sym;
}
%token <sym> LETTER
%type <sym> expr
%left '+' '-'
%left '*' '/'

%%

stmt: LETTER '=' expr ';' 	{ AddToTable((char)$1,(char)$3,'=');}
     | expr ';'
;

expr: expr '+' expr		{ $$=AddToTable((char)$1,(char)$3,'+');}
    | expr '-' expr		{ $$=AddToTable((char)$1,(char)$3,'-');}
    | expr '*' expr		{ $$=AddToTable((char)$1,(char)$3,'*');}
    | expr '/' expr		{ $$=AddToTable((char)$1,(char)$3,'/');}
    | LETTER			{ $$=(char)$1;}
;

%%

char AddToTable(char op1,char op2,char opr)
{
	code[ind].op1=op1;
	code[ind].op2=op2;
	code[ind].opr=opr;
	ind++;
	temp++;
	return temp;
}

void Quadruple()
{
	printf("\n***********Quadruple*************\n");
	printf("\nnumber\topr\top1\top2\tresult\n");
	int cnt=0;

	while(cnt<ind)
	{
		temp++;
		printf("%d\t",cnt);
		printf("%c\t",code[cnt].opr);
		printf("%c\t",code[cnt].op1);
		printf("%c\t",code[cnt].op2);
		printf("%c\t\n",temp);
		cnt++;
	}
}

void ThreeAddress()
{
	printf("\n***********ThreeAddress*************\n");
	printf("\nresult\top1\topr\top2\n");
	int cnt=0;
	temp++;
	while(cnt<ind)
	{
		printf("%c:=\t",temp);
		
		printf("%c\t",code[cnt].op1);
		printf("%c\t",code[cnt].opr);
		printf("%c\t\n",code[cnt].op2);
		temp++;
		cnt++;
	}
}


int main()
{
	printf("enter an expression ");
	yyparse();

	temp='A';
	Quadruple();

	temp='A';
	ThreeAddress();
}
void yyerror()
{
	printf("error");
}
		
		

















