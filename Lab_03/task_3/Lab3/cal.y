%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

typedef struct var {
    char *name;
    int value;
    struct var *next;
} var;

var *var_list = NULL;

int get_var_value(char *name) {
    var *v = var_list;
    while (v) {
        if (strcmp(v->name, name) == 0) return v->value;
        v = v->next;
    }
    return 0;
}

void set_var_value(char *name, int val) {
    var *v = var_list;
    while (v) {
        if (strcmp(v->name, name) == 0) {
            v->value = val;
            return;
        }
        v = v->next;
    }
    var *newv = malloc(sizeof(var));
    newv->name = strdup(name);
    newv->value = val;
    newv->next = var_list;
    var_list = newv;
}
%}

%union {
    int ival;
    char *sval;
}

%token <ival> NUMBER
%token <sval> ID
%token WHILE ASSIGN

%type <ival> expr condition statement stmt_list

%%

program:
    statement
;

statement:
    WHILE '(' condition ')' '{' stmt_list '}'
        {
            /* For demo, just run one iteration to avoid infinite loops */
            if ($3) {
                /* loop body */
            }
        }
;

stmt_list:
    ID ASSIGN expr ';'
        { set_var_value($1, $3); free($1); }
;

condition:
    ID '<' NUMBER
        { $$ = (get_var_value($1) < $3); free($1); }
;

expr:
    ID '+' NUMBER
        { $$ = get_var_value($1) + $3; free($1); }
    | NUMBER
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter example 3 code:\n");
    yyparse();
    return 0;
}
