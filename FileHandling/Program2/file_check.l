%{
#include <stdio.h>
#include <ctype.h>
int line_count = 0;
int space_count = 0;
int tab_count = 0;
int char_count = 0;
int word_count = 0;
int in_word = 0;

void count_word() {
    if (in_word == 0) {
        in_word = 1;
        word_count++;
    }
}
%}

%%
\n { line_count++; char_count++; in_word = 0; }
[ \t]+ { space_count += yyleng; tab_count += (yytext[0] == '\t') ? yyleng : 0; char_count += yyleng; in_word = 0; }
. { char_count += yyleng; if (!isspace(yytext[0])) count_word(); }
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyin, *yyout;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if (yyin == NULL) {
        printf("Error: Could not open input file.\n");
        return 1;
    }

    yylex();
    
    fprintf(yyout, "Number of lines = %d\n", line_count);
    fprintf(yyout, "Number of characters = %d\n", char_count);
    fprintf(yyout, "Number of spaces = %d\n", space_count);
    fprintf(yyout, "Number of tabs = %d\n", tab_count);
    fprintf(yyout, "Number of words = %d\n", word_count);

    printf("Number of lines = %d\n", line_count);
    printf("Number of characters = %d\n", char_count);
    printf("Number of spaces = %d\n", space_count);
    printf("Number of tabs = %d\n", tab_count);
    printf("Number of words = %d\n", word_count);
    
    fclose(yyin);
    fclose(yyout);
    
    return 0;
}
