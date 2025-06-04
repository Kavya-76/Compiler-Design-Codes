/*
Write a lex code to count number of no. of lines, spaces, chars, tabs, other characters in a sentence using file handling.
*/

%{
#include <stdio.h>
int lines = 0, spaces = 0, chars = 0, tabs = 0, others = 0;
%}

%%
[a-zA-Z0-9]     { chars++; }
\t              { tabs++; }
\n              { lines++; }
[ ]             { spaces++; }
.               { others++; }
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    yylex();

    fprintf(yyout, "No. of lines: %d\n", lines);
    fprintf(yyout, "No. of spaces: %d\n", spaces);
    fprintf(yyout, "No. of chars: %d\n", chars);
    fprintf(yyout, "No. of tabs: %d\n", tabs);
    fprintf(yyout, "No. of other characters: %d\n", others);

    fclose(yyin);
    fclose(yyout);

    return 0;
}
