/*
Write a lex code to count number of no. of lines, spaces, tabs, other characters in a sentence. 
*/


%{ 
#include <stdio.h>
int countline = 0, countspace = 0, counttab = 0, countother = 0; 
%} 

%% 
\n      { countline++; }           
[ ]     { countspace++; }         
\t    { counttab++; }           
.       { countother++; }   
%% 

int yywrap() {
    return 1;
} 

int main() {
    printf("Enter text: "); 
    yylex(); 
    printf("Number of lines: %d\n", countline);     
    printf("Number of spaces: %d\n", countspace);     
    printf("Number of tabs: %d\n", counttab);     
    printf("Number of other characters: %d\n", countother);     
    return 0;
} 
