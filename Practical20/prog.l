/*
Design the lex code to design a DFA over input alphabet 0,1 which accepts the string containing even no of 1’s and even no of 0’s.
*/

%{
#include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN B;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; { printf("String accepted\n"); }

<A>0    BEGIN INITIAL;
<A>1    BEGIN C;
<A>[^01\n] BEGIN DEAD;
<A>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<B>0    BEGIN C;
<B>1    BEGIN INITIAL;
<B>[^01\n] BEGIN DEAD;
<B>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<C>0    BEGIN B;
<C>1    BEGIN A;
<C>[^01\n] BEGIN DEAD;
<C>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<DEAD>.      ;     // Consume any remaining characters
<DEAD>\n     { printf("String not accepted\n"); BEGIN INITIAL; }

%%

int main() {
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}