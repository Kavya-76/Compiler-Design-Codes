/*
 Write a Lex program that accepts a string with 3 consecutive zeros (000), over the input symbol 0,1 .
*/

%{
#include <stdio.h>
%}

%s A B C DEAD

%%
<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; { printf("String not accepted\n"); }

<A>0    BEGIN B;
<A>1    BEGIN INITIAL;
<A>[^01\n] BEGIN DEAD;
<A>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<B>0    BEGIN C;
<B>1    BEGIN INITIAL;
<B>[^01\n] BEGIN DEAD;
<B>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<C>0    BEGIN C;
<C>1    BEGIN C;
<C>[^01\n] BEGIN DEAD;
<C>\n   BEGIN INITIAL; { printf("String accepted\n"); }

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