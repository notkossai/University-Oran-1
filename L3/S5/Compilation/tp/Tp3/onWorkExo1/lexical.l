%{
   #include "syntactic.tab.h"
   int nb_ligne = 1;
%}

%%

[0-9]+         { yylval.ival = atoi(yytext); return NUMBER; }
"+"            { return PLUS; }
"-"            { return MOINS; }
"*"            { return MULT; }
"/"            { return DIV; }
"("            { return LPAREN; }
")"            { return RPAREN; }
[ \t]          { /* ignore whitespace */ }
\n             { return '\n'; }
.              { printf("Lexical error on line %d : '%c'\n", nb_ligne, yytext[0]); }

%%

int yywrap() {
    return 1;
}
