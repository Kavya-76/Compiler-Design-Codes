/*
Write a lex code to find whether string is a valid identifier or not using file handling.
*/


%{
#include <stdio.h>
%}

%%

[_a-zA-Z][_a-zA-Z0-9]*  { fprintf(yyout, "%s: is a Valid identifier\n", yytext); }
[^ \t\n]+   { fprintf(yyout, "%s: is an Invalid identifier\n", yytext); }
[ \t\n]     { /* Ignore whitespace */ }

%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
