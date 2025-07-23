%{
#include "cal1.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
"if"            { return IF; }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval = strdup(yytext); return ID; }

[ \t\n]+        ; 

">"             { return '>'; }
"="             { return ASSIGN; }
"-"             { return '-'; }
";"             { return ';'; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }

.               { printf("Unknown character: %s\n", yytext); }
%%
