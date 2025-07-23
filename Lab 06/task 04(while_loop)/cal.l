%{
#include <stdio.h>
%}

%%

"while"         { printf("WHILE keyword\n"); }
"int"           { printf("INT keyword\n"); }
"="             { printf("ASSIGNMENT\n"); }
[0-9]+          { printf("NUMBER: %s\n", yytext); }
"<="|">="|"=="  { printf("COMPARISON OPERATOR: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext); }
"++"|"--"       { printf("INCREMENT/DECREMENT\n"); }
[ \t\n]+        { /* skip whitespace */ }

%%

int main() {
    yylex();
    return 0;
}