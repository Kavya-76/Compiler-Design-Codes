/*
Write a lex code to count number of comments
*/

%{
#include <stdio.h>
int single_line_comments = 0;
int multi_line_comments = 0;
%}

%%

"//"[^\n]*           { single_line_comments++; }    /* Single-line comment */
"/*"([^*]|\*+[^*/])*\*+"/"  { multi_line_comments++; }  /* Multi-line comment */
[ \t\n]              { /* Ignore whitespace */ }
.                    { /* Ignore other characters */ }

%%

int main() {
    printf("Enter your input (press Ctrl+D or Ctrl+Z to end):\n");
    yylex();
    printf("\nNumber of single-line comments: %d\n", single_line_comments);
    printf("Number of multi-line comments: %d\n", multi_line_comments);
    printf("Total comments: %d\n", single_line_comments + multi_line_comments);
    return 0;
}

int yywrap() {
    return 1;
}