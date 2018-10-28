%{
#include<math.h>
#include<stdio.h>
extern int yylex();
extern int yyparse();
int flag=0;
extern int yyerror(char *e);
%}
%union
{
 double dval;
 //int dname;
}

%token<dval> NUM 
//%token<dname> name
%type<dval> exp
%token SINE
%token<dval> ID
%token COSINE
%token TAN
%token SQRT 
%token LOG
%left '+','-'
%left '*','/'
%right '^'
%%

s	:exp { if(flag==0){printf ("ans = %f\n",$1);}}
        ;
exp	:exp '+' exp {$$=$1 + $3;}
        |exp '-' exp {$$=$1 - $3;}
	|exp '*' exp {$$=$1 * $3;}
	|exp '/' exp {if($3==0){printf("Divide by Zero\n");flag=1;}else{$$=$1/$3;}}
        |exp '^' exp {$$=pow($1,$3);}
        |SINE'('exp')' {$$=sin(($3*(3.14/180)));}
        |COSINE'('exp')' {$$=cos(($3*(3.14/180)));}
        |TAN'('exp')' {$$=tan(($3*(3.14/180)));}
        |LOG'('exp')'  {$$=(log($3)/2.303);}
        |SQRT'('exp')' {$$=sqrt($3);}
        |NUM { $$=$1;}
        |'('exp')' {$$=$2;}
        ;
	
%%
int main()
{
yyparse();
}
extern int yyerror(char *e)
{}
