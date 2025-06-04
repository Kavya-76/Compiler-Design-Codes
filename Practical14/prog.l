/*
Write a lex program to check for even or odd number in input using ATOI.
*/

%{
#include <stdio.h>
#include <stdlib.h>  // for atoi()
%}

%%

[0-9]+    {
             int num = atoi(yytext);
             if (num % 2 == 0)
                 printf("Number %d is Even\n", num);
             else
                 printf("Number %d is Odd\n", num);
          }

.|\n      ; // ignore any other characters

%%

int main() {
    printf("Enter numbers (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
