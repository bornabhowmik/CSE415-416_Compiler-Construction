%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
id              {letter}({letter}|{digit})*
delim           [ \t\n]
relop           "<="|">="|"=="|"!="|"<"|">"
int_lit         {digit}+
exp_lit         [-]?{digit}+(\.{digit}+)?[eE][-+]?{digit}+
float_lit       {digit}+"."{digit}+
char_lit        \'[a-zA-Z0-9]\'|‘[a-zA-Z0-9]’|“[^\"]*”|\"[^\"]*\"

%%
"int"           { printf("%s -> KEYWORD_INT\n", yytext); }
"return"        { printf("%s -> KEYWORD_RETURN\n", yytext); }
"while"         { printf("%s -> KEYWORD_WHILE\n", yytext); }

"="             { printf("%s -> ASSIGN\n", yytext); }
"%"             { printf("%s -> MODULUS\n", yytext); }
"&&"            { printf("%s -> LOGICAL_AND\n", yytext); }
";"             { printf("%s -> SEMICOLON\n", yytext); }
","             { printf("%s -> COMMA\n", yytext); }
"("             { printf("%s -> LEFT_PAREN\n", yytext); }
")"             { printf("%s -> RIGHT_PAREN\n", yytext); }
"{"             { printf("%s -> LEFT_BRACE\n", yytext); }
"}"             { printf("%s -> RIGHT_BRACE\n", yytext); }
">"             { printf("%s -> GREATER_THAN\n", yytext); }
"+"             { printf("%s -> PLUS\n", yytext); }

{relop}         { printf("%s -> REL_OP\n", yytext); }
{int_lit}       { printf("%s -> INT_LITERAL\n", yytext); }
{id}            { printf("%s -> IDENTIFIER\n", yytext); }
{delim}         { }
.               { printf("%s -> SPECIAL CHAR\n", yytext); }
%%
int main() {
    yylex();
    return 0;
}