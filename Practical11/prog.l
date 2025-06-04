/*
Write a lex program to replace the whitespaces of input file by a single blank character and store in the output file.
*/

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[ \t\n]+    { fprintf(yyout, " "); }
.           { fprintf(yyout, "%s", yytext); }
%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt","r");
    yyout = fopen("output.txt", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap()
{
    return 1;
}
