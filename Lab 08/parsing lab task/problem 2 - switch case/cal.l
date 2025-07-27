%{
#include "cal.tab.h"
%}

%%
"switch"         { return SWITCH; }
"case"           { return CASE; }
"default"        { return DEFAULT; }
"break"          { return BREAK; }
":"              { return COLON; }
";"              { return SEMICOLON; }
"="              { return ASSIGN; }
[0-9]+           { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n]+         { /* ignore whitespace */ }
.                { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
