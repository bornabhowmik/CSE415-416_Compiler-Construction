%option noyywrap

%{
//Roll Number: 1703xxx
#include <stdio.h>
%}

digit       [0-9]
letter      [a-zA-Z]
id          {letter}({letter}|{digit})*
delim       [ \t\n]
relop       ">"|"<"|">="|"<="|"=="|"!="

%%

"if"            { printf("%s -> IF_KEYWORD\n", yytext); }
"else"          { printf("%s -> ELSE_KEYWORD\n", yytext); }
"while"         { printf("%s -> WHILE_KEYWORD\n", yytext); }
"for"           { printf("%s -> FOR_KEYWORD\n", yytext); }

"="             { printf("%s -> ASSIGN\n", yytext); }
"+"             { printf("%s -> PLUS\n", yytext); }
"-"             { printf("%s -> MINUS\n", yytext); }
"*"             { printf("%s -> MUL\n", yytext); }
"/"             { printf("%s -> DIV\n", yytext); }

"{"             { printf("%s -> LEFT_BRACE\n", yytext); }
"}"             { printf("%s -> RIGHT_BRACE\n", yytext); }
"("             { printf("%s -> LEFT_PAREN\n", yytext); }
")"             { printf("%s -> RIGHT_PAREN\n", yytext); }

{relop}         { printf("%s -> REL_OP\n", yytext); }
{id}            { printf("%s -> IDENTIFIER\n", yytext); }
{digit}+        { printf("%s -> NUMBER\n", yytext); }
{delim}         { /* ignore whitespace */ }
;               { printf("%s -> \n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
