/*
Write a lex code to find weather string is valid identifier or not. 
*/

%{
#include <stdio.h>
%}

%%

[_a-zA-Z][_a-zA-Z0-9]*  { printf("%s: is a Valid identifier\n", yytext); }
[^ \t\n]+   { printf("%s: is an Invalid identifier\n", yytext); }
[ \t\n]     { /* Ignore whitespace */ }

%%

int main() {
    printf("Enter strings to check (one per line, press Ctrl+D or Ctrl+Z to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
