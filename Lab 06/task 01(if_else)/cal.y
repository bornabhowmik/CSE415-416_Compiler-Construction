%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int ival;
    char *sval;
}

%token <ival> NUMBER
%token <sval> ID
%token IF ASSIGN

%type <ival> expr condition

%%

program:
    statement                 { printf("Parsing Finished\n"); }
;

statement:
    IF '(' condition ')' '{' stmt_list '}'
;

stmt_list:
    ID ASSIGN expr ';'       { free($1); }
;

condition:
    ID '>' NUMBER            { $$ = 1; free($1); }
;

expr:
    ID '-' NUMBER            { $$ = 0; free($1); }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter code:\n");
    yyparse();
    return 0;
}
