%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ALPHA NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    expr '\n'   { printf("Valid Expression\n"); exit(0); }
  | error '\n'  { printf("Invalid Expression\n"); exit(1); }
  ;

expr:
    expr '+' expr
  | expr '-' expr
  | expr '*' expr
  | expr '/' expr
  | '-' expr %prec UMINUS
  | '(' expr ')'
  | NUMBER
  ;

%%

int main() {
    printf("Enter arithematic expression: ");
    yyparse();
    return 0;
}

int yyerror() {
    return 0;
}