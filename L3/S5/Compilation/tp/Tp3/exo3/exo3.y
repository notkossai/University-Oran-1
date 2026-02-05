%token  j_m  annee SEPARATEUR SL

%{
   #include <stdio.h>
   int yylex();    
   void yyerror(const char *s); 
%}  
  
%%
 date :  j_m  SEPARATEUR  j_m  SEPARATEUR  annee  SL {printf("Syntaxe correct "); return 0;  }
      ;
%%

void yyerror(const char *s) {
    printf("Erreur syntaxique : %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

int yywrap() {return 1;}