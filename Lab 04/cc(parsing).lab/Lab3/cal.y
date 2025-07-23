%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token IF ID NUMBER RELOP ASSIGN PLUS LBRACE RBRACE SEMICOLON

%%
stmt : IF '(' cond ')' block
     ;

cond : ID RELOP ID
     ;

block : LBRACE stmts RBRACE
      ;

stmts : stmt
      | stmt stmts
      | assign_stmt
      ;

assign_stmt : ID ASSIGN expr SEMICOLON
            ;

expr : ID
     | ID PLUS NUMBER
     ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}
