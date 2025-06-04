/*
Write a Lex program that accepts a string ending with 0011, over the input symbol 0,1 .
*/

%{
#include <stdio.h>
%}

%s A B C D DEAD

%%
<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; { printf("String not accepted\n"); }

<A>0    BEGIN B;
<A>1    BEGIN INITIAL;
<A>[^01\n] BEGIN DEAD;
<A>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<B>0    BEGIN B;
<B>1    BEGIN C;
<B>[^01\n] BEGIN DEAD;
<B>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<C>0    BEGIN A;
<C>1    BEGIN D;
<C>[^01\n] BEGIN DEAD;
<C>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<D>0    BEGIN A;
<D>1    BEGIN INITIAL;
<D>[^01\n] BEGIN DEAD;
<D>\n   BEGIN INITIAL; { printf("String accepted\n"); }

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