%{
#include "header1.hpp"
#include "y.tab.h"
extern int yyerror(char *e);

%}
%%

if {return IF;}
[()] {return yytext[0];}
[a-zA-Z]+ {strcpy(yylval.attr.place,yytext);
		yylval.attr.truelist=NULL;
		yylval.attr.falselist=NULL;

		return NAME;}
[ \t]+ 

\n return 0;
. return yytext[0];
%%
int yywrap()
{
	return 1;
}

