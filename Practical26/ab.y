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

    A string
    | B
    ;
%%

int main() 
{
    printf("Enter a string: ");
    yyparse();
    return 0;
}

int yyerror() {
    return 0;
}