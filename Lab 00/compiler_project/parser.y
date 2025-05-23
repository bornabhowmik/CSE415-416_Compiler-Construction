%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%%
expr: NUMBER '+' NUMBER {
    printf("Result = %d\n", $1 + $3);
};
%%

int main() {
    return yyparse();
}

int yyerror(const char *msg) {
    fprintf(stderr, "Parse error: %s\n", msg);
    return 1;
}
