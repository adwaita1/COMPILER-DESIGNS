#include<stdio.h>
#include<string.h>

char input[20];
int err=0;
int pos=0;
void E();
void T();
void Ed();
void E();
void Td();
void F();
void advance();

int main()
{
	printf("Enter an arithmetic expression :  "); 
	scanf("%s",input);
	int n=strlen(input);
	E();
	if(pos==n && err==0)
	{
	    printf("\nString Accepted..!\n");	
	}    
	else
	{
	    printf("\nString Rejected..!\n");
	}                     
}

void advance()
{
   pos++;
}

void F()
{
if (input[pos]=='e')
{
  advance();
}
else if(input[pos]=='(')
{
  advance();
  E();
  if(input[pos]==')')   
  {
   advance();            
  }
  else 
    err=1;
}
else
 err=1;
}

void E()
{
  T();
  Ed();
}

void T()
{
  F();
  Td();
}

void Ed()
{
  if(input[pos]=='+')
  {
    advance();
    T();
    Ed();
  }
}

void Td()
{
  if(input[pos]=='*')
  {
    advance();
    F();
    Td();
  }
}


