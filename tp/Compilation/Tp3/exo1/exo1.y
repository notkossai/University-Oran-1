%token NOMBRE PLUS MOINS MUL DIV PAREN_OUVRANTE PAREN_FERMANTE SL

%{
    #include <stdio.h>
    int yylex();    
    void yyerror(const char *s);  
%}  

%%
 S:              expression SL {printf("Syntax correct\n");  return 0;}
 ;
 expression :    expression PLUS terme 
            |    expression MOINS terme 
            |    terme 
            ;
 terme :         terme MUL facteur
       |         terme DIV facteur
       |         facteur
       ;
 facteur :       PAREN_OUVRANTE expression PAREN_FERMANTE
         |       MOINS facteur
         |       NOMBRE 
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