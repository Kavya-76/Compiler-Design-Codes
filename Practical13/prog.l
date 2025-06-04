/*
Write a lex code to design a DFA which accepts the strings over input alphabet a,b which accepts the strings ending with b.
*/

%{
#include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>a     BEGIN A;       
<INITIAL>b     BEGIN C;
<INITIAL>[^ab\n] BEGIN DEAD;  
<INITIAL>\n BEGIN INITIAL; {printf("Invalid: does not ends with 'b'\n");}

<A>a     BEGIN A;     
<A>b     BEGIN C;     
<A>[^ab\n] BEGIN DEAD; {printf("Invalid character\n");}
<A>\n BEGIN A; {printf("Invalid :does not ends with 'b'\n");}

<B>a     BEGIN A;     
<B>b     BEGIN B;     
<B>[^ab\n] BEGIN DEAD; {printf("Invalid character\n");}
<B>\n BEGIN INITIAL; {printf("Valid:starts with 'a' and ends with 'b'\n");}

<C>a    BEGIN C;
<C>b    BEGIN C;
<C>[^ab\n]    BEGIN C;
<C>\n BEGIN C; {printf("Invalid:  does not starts with 'a'\n");}

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
