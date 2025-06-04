/*
Write a Lex program to design a DFA which accepts the strings ending with b , over input alphabet a,b.
*/

%{
#include <stdio.h>
%}

%s A B DEAD

%%

<INITIAL>a  BEGIN INITIAL;
<INITIAL>b  BEGIN A;
<INITIAL>[^ab\n]    BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; { printf("String not accepted\n"); }

<A>a    BEGIN INITIAL;
<A>b    BEGIN A;
<A>[^ab\n]  BEGIN DEAD;
<A>\n BEGIN INITIAL; { printf("String accepted\n"); }

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