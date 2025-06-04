/*
Write a lex code to find whether phone number is valid or not. Phone number will be valid only if it have 10 digits and starts from 7 or 8 or 9. 
*/

%{
#include <stdio.h>
int valid = 0;
%}

%%

[789][0-9]{9}    { printf("Valid phone number: %s\n", yytext); valid = 1; }
[0-9]+           { printf("Invalid phone number: %s (must be 10 digits and start with 7 or 8)\n", yytext); }
[^0-9\n]+        { printf("Invalid input: %s (contains non-numeric characters)\n", yytext); }
\n               { return 0; }
.;                { printf("Invalid character: %s\n", yytext); }
%%

int main() {
    printf("Enter a phone number: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}