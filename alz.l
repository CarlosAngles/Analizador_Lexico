%{
#include <stdio.h>
#include<string.h>
%}

digito     [0-9]
letra      [a-zA-z]
select [S|s][E|e][L|l][E|e][Cc][T|t]
from [F|f][R|r][O|o][M|m]
where [W|w][H|h][E|e][R|r][E|e]
numero {digito}*
id  {letra}({letra}|{digito}|_)*


igual [=]
menor [<]

%%
[ \t\n]+
{select}   { printf("PC: %s\n", yytext); }
{from}     { printf("PC: %s\n", yytext); }
{where}    { printf("PC: %s\n", yytext); }

{numero} { printf("NUMERO: %s\n", yytext); }
{igual} { printf("OPREL: %s\n", yytext); }
{menor} { printf("OPREL: %s\n", yytext); }
,  { printf("SIGNO: %s\n", yytext); }
{id} { printf("ID: %s\n", yytext); }

. {{ printf("Caracter no definido: %s\n", yytext); }}

%%


int main() {
    yylex();
    return 0;
}
