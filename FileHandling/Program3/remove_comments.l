/* Write a lex program to remove the comments from the input using file handling. */

%{
#include <stdio.h>
%}

%%
"//"[^\n]*                              { /* Skip single-line comments */ }
"/*"([^*]|\*+[^*/])*\*+"/"             { /* Skip multi-line comments */ }
\n                                      { fprintf(yyout, "%s", yytext); }  /* Preserve newlines */
.                                       { fprintf(yyout, "%s", yytext); }  /* Output non-comment characters */

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

    if (yyout == NULL) {
        printf("Error: Could not open output file.\n");
        fclose(yyin);  // Close yyin if yyout fails
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);
    
    printf("Comments removed. Check 'output.txt'.\n");
    return 0;
}