%{
#include <stdio.h>
%}

LETTER   [a-zA-Z]
DIGIT    [0-9]
ID       [_a-zA-Z][_a-zA-Z0-9]*

%%

{ID}        { printf("%s: Valid identifier\n", yytext); }
[^ \t\n]+   { printf("%s: Invalid identifier\n", yytext); }
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