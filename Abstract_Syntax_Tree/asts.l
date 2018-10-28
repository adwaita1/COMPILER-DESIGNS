%{
#include"y.tab.h"
extern char yyval;
void yyerror(char *error);
%}

L [a-zA-Z]
%%

{L} {yylval.charval=(char)yytext[0];return ID;}
.	{
		return *yytext;
	}
[\t];
[\n] return 0;

%%
extern int yywrap()
{
	return 1;
}
