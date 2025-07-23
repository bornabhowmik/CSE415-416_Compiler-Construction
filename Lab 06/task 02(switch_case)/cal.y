%{
#include <stdio.h>
#include <stdlib.h>
%}

%token SWITCH CASE DEFAULT COLON BREAK NUM ID

%%

statement:
      SWITCH '(' ID ')' '{' cases '}'
    ;

cases:
      cases case
    | case
    ;

case:
      CASE NUM COLON statement_list BREAK ';'
    | DEFAULT COLON statement_list
    ;

statement_list:
      statement_list ID ';'
    | ID ';'
    ;

%%

int main() {
    printf("Enter a switch-case structure:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}