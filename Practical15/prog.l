/*
Write a lex program to check for Prime number in input using ATOI.
*/

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Function to check if a number is prime
int is_prime(int n) {
    if (n <= 1) return 0;
    if (n == 2) return 1;
    if (n % 2 == 0) return 0;
    for (int i = 3; i <= sqrt(n); i += 2) {
        if (n % i == 0) return 0;
    }
    return 1;
}
%}

%%

[0-9]+    {
             int num = atoi(yytext);
             if (is_prime(num))
                 printf("Number %d is Prime\n", num);
             else
                 printf("Number %d is Not Prime\n", num);
          }

.|\n      ;  // ignore all other characters

%%

int main() {
    printf("Enter numbers (Ctrl+D to stop):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
