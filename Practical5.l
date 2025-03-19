/*
Write a lex code to find input number is integer or float . 
*/

%{
#include <stdio.h>
%}

DIGIT    [0-9]
INTEGER  {DIGIT}+
FLOAT    {DIGIT}*\.{DIGIT}+

%%

{INTEGER}    { printf("%s is an Integer\n", yytext); }
{FLOAT}      { printf("%s is a Float\n", yytext); }
[^0-9.\n]+   { printf("%s is Invalid (contains non-numeric characters)\n", yytext); }
.            { printf("%s is Invalid\n", yytext); }

%%

int main() {
    printf("Enter a number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}