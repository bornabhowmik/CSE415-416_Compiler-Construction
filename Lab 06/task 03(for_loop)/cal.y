%{
#include <stdio.h>
#include <stdlib.h>
%}

%token FOR ID NUM ASSIGN SEMI LT GT EQ INC

%%

loop:
    FOR '(' ID ASSIGN NUM SEMI condition SEMI ID INC ')' '{' statement_list '}'
    {
        printf("FOR loop matched\n");
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
    printf("Enter a for loop:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}