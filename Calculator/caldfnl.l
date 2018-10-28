%{
	#include<stdio.h>
	#include "y.tab.h"
%}
%%
(([0-9]+)|([0-9]*\.[0-9]+)) {yylval.dval=atof(yytext); return NUM;}
"sin" {return SINE;}
"cos" {return COSINE;}
"tan" {return TAN;}
"log" {return LOG;}
"sqrt" {return SQRT;}
[a-zA-Z]+ {return ID;}
[ \t];
\n return 0;
. {return yytext[0];}
%%
 int yywrap()
{
	return 1;
}
