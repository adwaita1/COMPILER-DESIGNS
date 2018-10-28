%{                                 //Declarations
struct symtab
{
char name[20];
char type[20];
}symtab[10];

int count=0;
char temp[20];
void insert();
void display();
%}

fun "main()"|"getch()"
op "+"|"-"|"/"|"*"|"="|"++"|"--"|"<"|">"|"<="|">="
com {i1}({L}|{D}|{spc})*
dt "int"|"float"|"char"
k "void"|"return"|"while"|"if"|"do"|"for"
s "\t"|"\n"|";"|","
fs "%s"|"%d"|"%f"|"%c"
sym "{"|"}"|"("|")"|"["|"]"
spc " "
i1 "//"|"/*"|"*/"
L [a-zA-Z]
D [0-9]
id {L}({L}|{D})*
AOP [+|-|*|/]
ROP [<|>|<=|>=]
arr {L}("["&{D}&"]")*

%%
"#include" {printf("\n%s is a pre processor directory ",yytext);}
{L}+".h"   {printf("\n%s is a header file ",yytext);}
{fun} { printf("\n %s is built in functions",yytext);}
{dt} { printf("\n %s is Datatype",yytext); }
{k} { printf("\n %s is Keyword",yytext); }
{D} { printf("\n %s is Digit",yytext); }
"printf(\""{L}({L}|{D})*"\")" {printf("\n%s is a print function",yytext);}
"scanf(\""{L}({L}|{D})*"\")" {printf("\n%s is a scan function",yytext);}
{fs} { printf("\n %s is Format Specifier",yytext); }
{id} { printf("\n %s is identifier",yytext); strcpy(temp,"identifier");insert();}
{s} { printf("\n %s is Separator",yytext); }
{sym} { printf("\n %s is Symbol",yytext); }
{com} { printf("\n %s is comment",yytext); }
{AOP} {printf("\n%s is an arithmetic operator ",yytext);}
{ROP} {printf("\n%s is a relational operator ",yytext);}
{L}+"["{D}+"]" {printf("\n%s is an array ",yytext);strcpy(temp,"array");insert();}
{op} { printf("\n %s is Operator",yytext); }

%%

int main()
{
  yyin=fopen("s.c","r");
  yylex();
  display();
}
extern int yywrap()
{
  return 1;
}

void insert()
{
	int flag=0;
	for(int i=0;i<10;i++)
	{
		if(strcmp((symtab[i].name),yytext)==0)
		{
			flag=1;
			break;
		}
	}
		if(flag!=1)
		{
			strcpy(symtab[count].name,yytext);
			strcpy(symtab[count].type,temp);
			count++;
		}
	
		
}
void display()
{
	printf("\nSymbol \t\t Type\n");
	for(int i=0;i<count;i++)
	{
	printf("%s \t\t %s\n",symtab[i].name,symtab[i].type);
	}
}
