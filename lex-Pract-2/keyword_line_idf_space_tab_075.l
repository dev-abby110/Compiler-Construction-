%{
#include <stdio.h>
#include <string.h>

int lc = 0, sc = 0, wc = 0, ch = 0;
int kw = 0, idf = 0, cm = 0;

char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if",
    "int", "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
};

int isKeyword(char *text) {
    for (int i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) {
        if (strcmp(text, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"//".*                     { cm++; ch += yyleng; }
"/*"([^*]*|\*+[^*/])*"*""/" { cm++; ch += yyleng; }
[\n]                       { lc++; ch++; }
[ \t]                      { sc++; ch++; }
[a-zA-Z_][a-zA-Z0-9_]* {
    wc++;
    ch += yyleng;
    if (isKeyword(yytext)) kw++;
    else idf++;
}
.    { ch++; }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter your input (press Ctrl+D to finish):\n");
    yylex();
    printf("\n--- Token Analysis ---\n");
    printf("Lines       : %d\n", lc);
    printf("Spaces/Tabs : %d\n", sc);
    printf("Words       : %d\n", wc);
    printf("Characters  : %d\n", ch);
    printf("Keywords    : %d\n", kw);
    printf("Identifiers : %d\n", idf);
    printf("Comments    : %d\n", cm);
    return 0;
}

