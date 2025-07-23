%{
#include "cal.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
"if"            { return IF; }
"else"          { return ELSE; }
"=="            { return EQ; }
"+"             { return '+'; }
[0-9]+{ yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-9_]* { yylval = strdup(yytext); return ID; }

[ \t\n]+        ; 

"="             { return ASSIGN; }
";"             { return ';'; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }

.               { printf("Unknown character: %s\n", yytext); }
%%
