%{
#include <stdio.h>
#include <stdlib.h>

int result;
int day;
int yylex(void);
int yyerror(char *s);
%}

%token NUMBER ID SWITCH CASE DEFAULT BREAK COLON SEMICOLON ASSIGN

%%
program:
      SWITCH '(' ID ')' '{' case_list default_case '}'
    ;

case_list:
      case_list case_stmt
    | /* empty */
    ;

case_stmt:
      CASE NUMBER COLON stmt BREAK SEMICOLON
    ;

default_case:
      DEFAULT COLON stmt
    ;

stmt:
      ID ASSIGN NUMBER SEMICOLON {
          if ($1 == result) {}  // Dummy usage
      }
    ;
%%

int main() {
    yyparse();
    printf("Parsing completed.\n");
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
