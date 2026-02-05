%option yylineno

%{
   #include "exo2.tab.h"
%}

lettre                      [a-z]
chiffre                     [0-9]
type                        "integer"|"real"|"boolean"
ident                       ({lettre})({lettre}|{chiffre})*
cste                        {chiffre}({chiffre})*
esp                         [ \t\n]+

%%
"program"                   return PROGRAM;
"begin"                     return BEG;
"end"                       return END; 
"var"                       return VAR; 
{type}                      return TYPE;
":"                         return DP;
";"                         return PVG;
"."                         return POINT;
":="                        return AFF;
"+"                         return ADD;
{ident}                     {return ident;}
{cste}                      {return cste;}
{esp}                       ;
.                           printf("erreur lexical !");
%%