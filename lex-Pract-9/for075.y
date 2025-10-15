%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}

%union { int num; char *id; }

%token FOR LPAREN RPAREN SEMI LBRACE RBRACE
%token ASSIGN INC DEC
%token LT GT LE GE EQ NE
%token <num> NUMBER
%token <id> ID

%left '+' '-'
%left '*' '/'
%left LT GT LE GE EQ NE

%%

program:
    for_stmt
    ;

for_stmt:
    FOR LPAREN init_stmt SEMI opt_condition SEMI opt_inc RPAREN block
    {
        printf("Valid FOR loop parsed successfully!\n");
    }
    ;

init_stmt:
    /* empty */
    | ID ASSIGN expr
    ;

opt_condition:
    /* empty */
    | expr relop expr
    ;

opt_inc:
    /* empty */
    | ID INC
    | ID DEC
    | ID ASSIGN expr
    ;

block:
    LBRACE stmt_list RBRACE
    ;

stmt_list:
    stmt_list statement
    | /* empty */
    ;

statement:
    ID ASSIGN expr SEMI
    ;

expr:
    ID
    | NUMBER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    ;

relop:
    LT | GT | LE | GE | EQ | NE
    ;

%%

int main() {
    printf("Enter a FOR loop:\n");
    return yyparse();
}
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }

