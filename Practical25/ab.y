/* Write a YACC program to recognize strings in given grammar: {anbn ,n>=0} */

%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NEWLINE

%%
input:
    string NEWLINE { printf("Accepted\n"); exit(0); }
  | error NEWLINE { printf("Rejected\n"); exit(1); }
  ;

string:
    /* empty */         // ε (n=0) is valid
  | A string B          // recursive match: a^n b^n
  ;
%%

int main() {
    printf("Enter a string (end with ENTER): ");
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    return 0;
}
