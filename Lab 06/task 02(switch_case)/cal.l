%{
#include <stdio.h>
%}

%%

"switch"        { printf("SWITCH keyword\n"); }
"case"          { printf("CASE keyword\n"); }
"default"       { printf("DEFAULT keyword\n"); }
"break"         { printf("BREAK keyword\n"); }
":"             { printf("COLON\n"); }
[0-9]+          { printf("NUMBER: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext); }
"="             { printf("ASSIGNMENT\n"); }
"+"|"-"|"*"|"/" { printf("OPERATOR: %s\n", yytext); }
[ \t\n]+        { /* skip whitespace */ }

%%

int main() {
    yylex();
    return 0;
}