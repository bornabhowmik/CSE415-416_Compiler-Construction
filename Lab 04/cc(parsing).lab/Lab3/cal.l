%option noyywrap

%{
    #include "cal.tab.h"
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
undr [_]

%%
"if"            { return IF; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"("             { return '('; }
")"             { return ')'; }
">"             { return RELOP; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
";"             { return SEMICOLON; }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+        { /* skip whitespace */ }
.               { printf(" %s\n", yytext); }
%%