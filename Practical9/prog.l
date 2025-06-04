/*
Write a lex code to find whether phone number is valid or not. Phone number will be valid only if it have 10 digits and starts from 7 or 8 or 9. (using file handling)
*/

%{
#include <stdio.h>
%}

%%
[789][0-9]{9}   {fprintf(yyout, "%s is a valid phone number\n", yytext);}
[0-9]+          {fprintf(yyout, "%s is an invalid phone number\n", yytext);}
.               {fprintf(yyout, "%s is not a valid phone number character\n", yytext);}
%%

int yywrap() {
    return 1;
}

int main() {
    extern FILE *yyout, *yyin;
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    
    yylex();

    fclose(yyin);
    fclose(yyout);
}