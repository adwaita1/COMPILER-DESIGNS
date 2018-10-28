%{
	#include<stdio.h>
	#include "y.tab.h"
%}
LETTER [a-zA-Z]+
%%
(([0-9]+)|([0-9]*\.[0-9]+)) {yylval.a=(char)yytext[0]; return NUM;}
{LETTER} {yylval.a=(char)yytext[0];return ID;}
[ \t];
\n return 0;
. {return yytext[0];}
%%
 int yywrap()
{
	return 1;
}
