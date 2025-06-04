/*
 Design the lex code to design a DFA over input alphabet 0,1 that accepts the string containing last third symbol as 0.
*/

%{
#include <stdio.h>
%}

%s A B C D E F G DEAD

%%

<INITIAL>0  BEGIN A;
<INITIAL>1  BEGIN INITIAL;
<INITIAL>[^01\n]    BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; { printf("String not accepted\n"); }

<A>0    BEGIN C;
<A>1    BEGIN B;
<A>[^01\n]  BEGIN DEAD;
<A>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<B>0    BEGIN E;
<B>1    BEGIN D;
<B>[^01\n]  BEGIN DEAD;
<B>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<C>0    BEGIN G;
<C>1    BEGIN F;
<C>[^01\n]  BEGIN DEAD;
<C>\n   BEGIN INITIAL; { printf("String not accepted\n"); }

<D>0    BEGIN A;
<D>1    BEGIN INITIAL;
<D>[^01\n]  BEGIN DEAD;
<D>\n   BEGIN INITIAL; { printf("String accepted\n"); }

<E>0    BEGIN C;
<E>1    BEGIN B;
<E>[^01\n]  BEGIN DEAD;
<E>\n   BEGIN INITIAL; { printf("String accepted\n"); }

<F>0    BEGIN E;
<F>1    BEGIN D;
<F>[^01\n]  BEGIN DEAD;
<F>\n   BEGIN INITIAL; { printf("String accepted\n"); }

<G>0    BEGIN G;
<G>1    BEGIN F;
<G>[^01\n]  BEGIN DEAD;
<G>\n   BEGIN INITIAL; { printf("String accepted\n"); }

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