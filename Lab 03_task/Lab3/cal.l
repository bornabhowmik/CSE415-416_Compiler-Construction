%option noyywrap

%{
    #include "cal.tab.h"
%}

letter [a-zA-z]
digit [0-9]
delim [ \t]
undr [_]
num {digit}{digit}*
float_num {num}*[.]{num}

%%
{delim} {}

"int" {return(INT_TYPE);}
"float" {return(FLOAT_TYPE);}

"=" {return(ASSIGN);}
";" {return(SEMI);}

{num} {yylval = atoi(yytext); return(INT_NUM);}
{float_num} {yylval = atof(yytext); return(FLOAT_NUM);}

({under}|{letter})({under}|{letter}|{digit})* {return(ID);}

%%
