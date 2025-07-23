%option noyywrap

%{
    #include "cal.tab.h"
%}

letter [a-zA-z]
digit [0-9]
delim[ \t]
under [_]
float_num {num}*[.]{num}

%%
{delim} {}

"int" {return(Int_TYPE);}
"float" {return(FLOAT_TYPE);}

"=" {return(ASSIGN);}
";" {return(SEMI);}

{num} {yylval = atoi(yytext); return(int_NUM);}
{float_num} {yylval = atof(yytext); return(FLOAT_NUM);}

({digit} | {letter}) ({digit} | {letter} | {digit}) * {return(FLOAT_TYPE);}


%%
