%{
#include<stdio.h>

typedef union type
{
	int intval;
	char charval;
}type;

typedef struct node
{
	type data;
	struct node *lptr,*rptr;
}node;

node* mkleaf(int,node*,node*);
node* mknode(char,node*,node*);
void display(node*);
int eval(node*);

%}

%union{
	int intval;
	char charval;
	struct node* nptr;
}
%token <intval> NUMBER
%type <nptr> expr
%left '+' '-'
%left '/' '*'

%%

stmt: expr ';'			{ printf("preorder display is....:");
					display($1);
				  printf("\nevaluation is....%d\n",eval($1));}
    ; 

expr:	NUMBER			{ $$=mkleaf($1,NULL,NULL);} 
    |	expr '+' expr		{ $$=mknode('+',$1,$3);}
    |	expr '-' expr		{ $$=mknode('-',$1,$3);}
    |	expr '*' expr		{ $$=mknode('*',$1,$3);}
    |	expr '/' expr		{ $$=mknode('/',$1,$3);}
;

%%

node* mkleaf(int data,node* lptr,node* rptr)
{
	node* temp=(node*)malloc(sizeof(node));
	temp->data.intval=data;
	temp->lptr=lptr;
	temp->rptr=rptr;
	return temp;
}
node* mknode(char data,node* lptr,node* rptr)
{
	node* temp=(node*)malloc(sizeof(node));
	temp->data.charval=data;
	temp->lptr=lptr;
	temp->rptr=rptr;
	return temp;
}

void display(node* root)
{

	if(root!=NULL)
	{

		if(root->lptr==NULL && root->rptr==NULL)
			printf("%d ",root->data.intval);
		else
			printf("%c ",root->data.charval);
		display(root->lptr);
		display(root->rptr);
	}
}

int eval(node* root)
{
	if(root!=NULL)
	{
		int op1=eval(root->lptr);
		int op2=eval(root->rptr);
		if(root->lptr==NULL && root->rptr==NULL)
			return root->data.intval;
		else
			switch(root->data.charval)
			{
				case '+': return op1+op2;
				case '-': return op1-op2;
				case '*': return op1*op2;
				case '/': return op1/op2;
			}
	}
}

int main()
{
	yyparse();
}

void yyerror()
{
	printf("error");
}

