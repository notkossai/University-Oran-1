%{
   #include "exo3.tab.h"
%}

j_m           [0-9]{2}
annee         [0-9]{4}
delim         [ \t]+

%%
{delim}       {/* pas d action */};
{j_m}         {return j_m;}
{annee}       {return annee;}
"/"           return SEPARATEUR;
\n            return SL;
.             printf("erreur lexical !");
%%