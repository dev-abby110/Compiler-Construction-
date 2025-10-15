%{
#include <stdio.h>
%}

%%
[A-Z]    { /* Uppercase to lowercase */
            putchar(yytext[0] + 'a' - 'A');
          }

[a-z]    { /* Lowercase to uppercase */
            putchar(yytext[0] - 'a' + 'A');
          }

.|\n     { /* Print all other characters as they are */
            putchar(yytext[0]);
          }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

