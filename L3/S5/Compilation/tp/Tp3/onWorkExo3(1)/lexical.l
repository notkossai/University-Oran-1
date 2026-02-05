%{
    #include "syntactic.tab.h"
    #include <string.h>
    int nb_ligne = 1;
%}

%%

[0-9]+     { 
    yylval.str = strdup(yytext);  /* allocate memory for token value */
    return NUMBER; 
}
"/"        { return SEPR; }
[ \t]      { /* ignore tabs*/ }
\n         { nb_ligne++; return '\n'; }
.          { printf("Invalid format: use dd/mm/yyyy\n"); }

%%

int yywrap() { return 1; }
