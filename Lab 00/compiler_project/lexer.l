%{
#include "parser.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[\n\t ]+    ;
.           { return yytext[0]; }
%%
