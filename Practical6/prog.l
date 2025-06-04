/*
Write a lex code for tokenizing ( identify and print operator,  separator,  keyword, identifiers ) in an input.
*/

%{
#include <stdio.h>
#include <string.h>

// List of common C keywords (you can add more as needed)
char *keywords[] = {"if", "else", "while", "for", "int", "float", "return", "void", NULL};
int isKeyword(char *str) {
    for(int i = 0; keywords[i] != NULL; i++) {
        if(strcmp(keywords[i], str) == 0) {
            return 1;
        }
    }
    return 0;
}
%}

DIGIT    [0-9]
LETTER   [a-zA-Z]
ID       {LETTER}({LETTER}|{DIGIT})*
OPERATOR [+\-*/=<>!&|]
SEPARATOR [;,.()[\]{}]

%%

{OPERATOR}        { printf("Operator: %s\n", yytext); }
{SEPARATOR}       { printf("Separator: %s\n", yytext); }
{ID}              { 
                    if(isKeyword(yytext))
                        printf("Keyword: %s\n", yytext);
                    else
                        printf("Identifier: %s\n", yytext);
                  }
[ \t\n]+          { /* Ignore whitespace */ }
.                 { printf("Invalid character: %s\n", yytext); }

%%

int main() {
    printf("Enter your input (press Ctrl+D or Ctrl+Z to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}