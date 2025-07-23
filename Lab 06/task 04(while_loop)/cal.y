%{
#include <stdio.h>
#include <stdlib.h>
%}

%token WHILE ID NUM ASSIGN SEMI LT GT EQ INC

%%

loop:
    WHILE '(' condition ')' '{' statement_list '}'
    {
        printf("WHILE loop matched\n");
    }
    ;

condition:
    ID LT NUM
  | ID GT NUM
  | ID EQ NUM
  ;

statement_list:
    statement_list ID ';'
  | ID ';'
  ;

%%

int main() {
    printf("Enter a while loop:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}