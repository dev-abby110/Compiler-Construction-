%{
#include <stdio.h>
int a_words = 0;
%}

%%

[aA][a-zA-Z0-9_]*     { a_words++; }     // Match words starting with 'A' or 'a'
.|\n                   { /* Ignore other characters */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter your input (press Ctrl+D to finish):\n");
    yylex();
    printf("\nNumber of words starting with 'A': %d\n", a_words);
    return 0;
}

