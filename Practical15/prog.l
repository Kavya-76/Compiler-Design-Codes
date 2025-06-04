/*
Write a lex program to design a DFA which accepts the strings with even number of zeroes and even number of one over input (0,1).
*/

%{
#include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>0     BEGIN A;       
<INITIAL>1     BEGIN C;
<INITIAL>[^01\n] BEGIN DEAD;  
<INITIAL>\n BEGIN INITIAL; {printf("Valid\n");}

<A>0     BEGIN INITIAL;     
<A>1     BEGIN B;     
<A>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<A>\n BEGIN A; {printf("Invalid\n");}

<B>0     BEGIN C;     
<B>1     BEGIN A;     
<B>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<B>\n BEGIN INITIAL; {printf("Invalid\n");}

<C>0     BEGIN B;     
<C>1     BEGIN INITIAL;     
<C>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<C>\n BEGIN INITIAL; {printf("Invalid\n");}

%%

int main() {
    printf("Enter a string over {0, 1}: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
