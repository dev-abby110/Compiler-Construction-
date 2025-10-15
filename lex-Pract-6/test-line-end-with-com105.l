%{
#include <stdio.h>
%}

%%
.*com$   { printf("Matched: %s", yytext); }
.*       { /* ignore other lines */ }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

