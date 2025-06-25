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
char_lit        \'[a-zA-Z0-9]\'|‘[a-zA-Z0-9]’|“[^\"]”|\"[^\"]\"

%%

"int"           { printf("%s -> KEYWORD_INT\n", yytext); }
"float"         { printf("%s -> KEYWORD_FLOAT\n", yytext); }
"double"        { printf("%s -> KEYWORD_DOUBLE\n", yytext); }
"char"          { printf("%s -> KEYWORD_CHAR\n", yytext); }
"for"           { printf("%s -> KEYWORD_FOR\n", yytext); }
"return"        { printf("%s -> KEYWORD_RETURN\n", yytext); }

"scanf"         { printf("%s -> FUNC_SCANF\n", yytext); }
"printf"        { printf("%s -> FUNC_PRINTF\n", yytext); }
"main"          { printf("%s -> FUNC_MAIN\n", yytext); }


"="             { printf("%s -> ASSIGN\n", yytext); }
";"             { printf("%s -> SEMICOLON\n", yytext); }
","             { printf("%s -> COMMA\n", yytext); }
"("             { printf("%s -> LEFT_PAREN\n", yytext); }
")"             { printf("%s -> RIGHT_PAREN\n", yytext); }
"{"             { printf("%s -> LEFT_BRACE\n", yytext); }
"}"             { printf("%s -> RIGHT_BRACE\n", yytext); }
"&"             { printf("%s -> ADDRESS_OF\n", yytext); }
"++"            { printf("%s -> INCREMENT\n", yytext); }
"--"            { printf("%s -> DECREMENT\n", yytext); }
"+"             { printf("%s -> PLUS\n", yytext); }
"-"             { printf("%s -> MINUS\n", yytext); }
"*"             { printf("%s -> MULTIPLY\n", yytext); }
"/"             { printf("%s -> DIVIDE\n", yytext); }


{relop}         { printf("%s -> REL_OP\n", yytext); }
{exp_lit}       { printf("%s -> EXPONENTIAL_LITERAL\n", yytext); }
{float_lit}     { printf("%s -> FLOAT_LITERAL\n", yytext); }
{int_lit}       { printf("%s -> INT_LITERAL\n", yytext); }
{char_lit}      { printf("%s -> CHAR_LITERAL\n", yytext); }
{id}            { printf("%s -> IDENTIFIER\n", yytext); }


{delim}         { /* skip */ }

.               { printf("%s -> SPECIAL CHAR\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}