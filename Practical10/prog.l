/*
Design a lex code to extract all html tags from the given file at runtime and store into text file at the runtime.
*/

%{
#include <stdio.h>
int tag_count = 0;
%}

%%
"<"[^<>]+">" {fprintf(yyout,"\n %s",yytext); tag_count++;}
.|\n        { /* Ignore everything else */ }
%%

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {
    return 1;
}