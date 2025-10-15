%{
#include "y.tab.h"
%}

%%

[0-9]+     { yylval = atoi(yytext); return NUMBER; }
[\n]       { return '\n'; }
[ \t]      ; // Ignore whitespace
[\+\-\*/]  { return yytext[0]; }

%%
