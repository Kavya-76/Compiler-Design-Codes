/*
Write a lex code to find number entered is integer or float type using file handling.
*/

%{
#include <stdio.h>
%}

DIGIT    [0-9]
INTEGER  {DIGIT}+
FLOAT    {DIGIT}*\.{DIGIT}+

%%

{INTEGER}    { fprintf(yyout, "%s is an Integer\n", yytext); }
{FLOAT}      { fprintf(yyout, "%s is a Float\n", yytext); }
[^0-9.\n]+   { fprintf(yyout, "%s is Invalid (contains non-numeric characters)\n", yytext); }
.            { fprintf(yyout, "%s is Invalid\n", yytext); }

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