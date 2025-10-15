%{
#include "y.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%option noyywrap

%%
"for"           { return FOR; }
"("             { return LPAREN; }
")"             { return RPAREN; }
";"             { return SEMI; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"="             { return ASSIGN; }
"++"            { return INC; }
"--"            { return DEC; }
"<="            { return LE; }
">="            { return GE; }
"=="            { return EQ; }
"!="            { return NE; }
"<"             { return LT; }
">"             { return GT; }

[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*   { yylval.id = strdup(yytext); return ID; }

[ \t\n]         { /* skip whitespace */ }
.               { return *yytext; }
%%

