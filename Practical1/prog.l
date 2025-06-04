/*
Write a lex code to count number of words in a sentence. 
*/

%{
#include <stdio.h>
int word_count = 0; // Counter for words
%}

%%
[a-zA-Z]+   { word_count++; }  // Match words (sequences of letters)
.           ;  // Ignore any other characters
%%

int yywrap()
{
    return 1;
}

int main() {
    printf("Enter a sentence: ");
    yylex(); // Start the lexical analysis process
    printf("Number of words: %d\n", word_count); // Print the word count
    return 0;
}