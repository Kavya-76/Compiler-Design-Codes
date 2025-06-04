%{
#include "temp.tab.h"
%}

%%
[+\-*/()]   { return yytext[0]; }
[a-zA-Z] { return ALPHA; }
[0-9]+ { return NUMBER; }
\n { return '\n'; }
%%

int yywrap() {
    return 1;
}
