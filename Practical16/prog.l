/*
Write a lex code to accept a string ending with "0011" over the input symbol {0,1}.
*/

%{
#include <stdio.h>
%}

%s A B C D DEAD

%%
<INITIAL>0     BEGIN A;       
<INITIAL>1     BEGIN INITIAL;
<INITIAL>[^01\n] BEGIN DEAD;  
<INITIAL>\n BEGIN INITIAL; {printf("Invalid\n");}

<A>0     BEGIN B;     
<A>1     BEGIN INITIAL;     
<A>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<A>\n BEGIN A; {printf("Invalid\n");}

<B>0     BEGIN B;     
<B>1     BEGIN C;     
<B>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<B>\n BEGIN B; {printf("Invalid\n");}

<C>0     BEGIN A;     
<C>1     BEGIN D;     
<C>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<C>\n BEGIN C; {printf("Invalid\n");}

<D>0     BEGIN A;     
<D>1     BEGIN INITIAL;     
<D>[^01\n] BEGIN DEAD; {printf("Invalid character\n");}
<D>\n BEGIN D; {printf("Valid\n");}

%%

int main() {
    printf("Enter a string over {0, 1}: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
