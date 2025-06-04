/*
Write the lex code to design a DFA over input alphabet 0,1 which accepts the strings end with "01".
*/

%{
#include <stdio.h>
%}

%s A B DEAD

%%
<INITIAL>0     BEGIN A;       
<INITIAL>1     BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;  
<INITIAL>\n BEGIN INITIAL; {printf("Invalid: does not ends with '01'\n");}

<A>0     BEGIN A;     
<A>1     BEGIN B;     
<A>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<A>\n BEGIN A; {printf("Invalid :does not ends with '01'\n");}

<B>0     BEGIN A;     
<B>1     BEGIN INITIAL;     
<B>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<B>\n BEGIN INITIAL; {printf("Valid: ends with '01'\n");}

<DEAD>.      ;     // Consume any remaining characters
<DEAD>\n     { printf("String not accepted\n"); BEGIN INITIAL; }

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
