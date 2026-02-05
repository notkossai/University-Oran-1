%{
    #include "syntactic.tab.h"
    int nb_ligne = 1;
%}

year             [0-9]{4}
digit            [0-9]{2}

%%

{year}           { yylval.ival = atoi(yytext); return NUMBER; }
{digit}          { yylval.ival = atoi(yytext); return NUMBER; }
"/"              { return SEPR; }
[ \t]            { /* ignore whitespace */ }
\n               { nb_ligne++; return '\n'; }
[0-9]            { printf("Invalid format: use dd/mm/yyyy\n"); }
.                { printf("Lexical error on line %d : '%c'\n", nb_ligne, yytext[0]); }
 
%%

int yywrap() {
    return 1;
}