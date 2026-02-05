%{
#include "exo1.tab.h"
%}

chiffre                 [0-9]
NOMBRE                  {chiffre}+
esp                     [ \t]+
%%

{esp}                   {/* pas d action */};
{NOMBRE}                return NOMBRE;
"+"                     return PLUS;
"-"                     return MOINS;
"*"                     return MUL;
"/"                     return DIV;
"("                     return PAREN_OUVRANTE;
")"                     return PAREN_FERMANTE;
\n                      return SL;
.                       printf("Erreur Lexicale !");
%%