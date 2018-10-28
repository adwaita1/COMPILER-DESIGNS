%{
#include<stdio.h>
#include<math.h>
#include<ctype.h>
#include<stdlib.h>
extern int yylex();
extern int yyparse();

typedef union type{
	int intval;
	char charval;
}type;

typedef struct node{
	type data;
	struct node *lptr,*rptr;
}node;
node* mknode(char dt,node* ln,node* rn);
node* mkleaf(char dt,node* ln,node* rn);
int op;
%}
%union{
	int intval;
	char charval;
	struct node *nptr;
	}
%token <intval>NUM
%token <charval>ID
%type <nptr>exp
%left '*' '/'
%left '+' '-'
%right '^' 
%%
stmt	:exp 	{	printf("\nPreorder Display :: ");
				display($1);
				printf("\n");
			
		}
	;
exp	:ID	       {
			$$=mkleaf($1,NULL,NULL);
			}
	|exp'='exp	{
			$$=mknode('=',$1,$3);
			}
	|exp'+'exp	{
			$$=mknode('+',$1,$3);
			}
	|exp'-'exp	{

			$$=mknode('-',$1,$3);
			}
	|exp'*'exp	{
			$$=mknode('*',$1,$3);
			}
	|exp'/'exp	{
			$$=mknode('/',$1,$3);
			}
	;
%%
void yyerror(char *error){
	printf("\n%s",error);
}
node* mkleaf(char dt,node* ln,node* rn) 
{
	node* temp=(node *)malloc(sizeof(node));
	temp->data.charval=dt;
	temp->lptr=ln;
	temp->rptr=rn;
	return temp;
}
node* mknode(char dt,node* ln,node* rn) 
{
	node* temp=(node *)malloc(sizeof(node));
	temp->data.charval=dt;
	temp->lptr=ln;
	temp->rptr=rn;
	return temp;
}
void display(node* root){

	if(root!=NULL){

		if(root->lptr==NULL && root->rptr==NULL){

			printf(" %c",root->data.charval);
		}
		else{
			printf(" %c",root->data.charval);
		}
		display(root->lptr);
		display(root->rptr);
	}
}

int main()
{
	yyparse();
}


