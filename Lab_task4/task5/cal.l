%option noyywrap
%{
#include "cal.tab.h"
#include <stdlib.h>
%}

digit       [0-9]
num         {digit}+
float_num   {digit}+"."{digit}+
delim       [ \t\r\n]
letter      [A-Za-z]
under       [_]

%%

{delim}                { /* skip whitespace */ }

"int"                  { return INT_TYPE; }
"float"                { return FLOAT_TYPE; }
"if"                   { return IF; }
"else"                 { return ELSE; }
"for"                  { return FOR; }
"while"                { return WHILE; }

"("                    { return LPAREN; }
")"                    { return RPAREN; }
"{"                    { return LBRACE; }
"}"                    { return RBRACE; }
"="                    { return ASSIGN; }
"=="                   { return EQ; }
">"                    { return GT; }
"<"                    { return LT; }
">="                   { return GE; }
"<="                   { return LE; }
"!="                   { return NE; }
","                    { return COMMA; }
";"                    { return SEMI; }
"+"                    { return '+'; }
"-"                    { return '-'; }
"/"                    { return '/'; }
"%"                    { return '%'; }

{float_num}            { return FLOAT_NUM; }
{num}                  { return INT_NUM; }
({under}|{letter})({under}|{letter}|{digit})* { return ID; }

%%