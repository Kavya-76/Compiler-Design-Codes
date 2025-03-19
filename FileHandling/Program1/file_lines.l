%{
#include <stdio.h>
int line_count = 0;
%}

%%
[\n] { line_count++;}
.;
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    fprintf(yyout,"Number of lines = %d\n",line_count);
    return 0;
}


