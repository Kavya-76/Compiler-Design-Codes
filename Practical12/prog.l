/*
Write a lex code to design a DFA which accepts the strings over input alphabet a,b which accepts the strings ending with b.
*/

%{
#include <stdio.h>
%}

%s A DEAD

%%
<INITIAL>a     BEGIN INITIAL;       
<INITIAL>b     BEGIN A;       
<INITIAL>[^ab\n] BEGIN DEAD;  
<INITIAL>\n BEGIN INITIAL; {printf("Invalid: does not ends with 'b'\n");}

<A>a     BEGIN INITIAL;     
<A>b     BEGIN A;     
<A>[^ab\n] BEGIN DEAD; {printf("Invalid character\n");}
<A>\n BEGIN INITIAL; {printf("Valid:ends with 'b'\n");}
%%

int main() {
    printf("Enter a string over {a, b}: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
