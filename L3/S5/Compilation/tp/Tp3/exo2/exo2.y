%token  ident  cste  PROGRAM BEG END VAR  DP PVG POINT AFF ADD TYPE

%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;
extern int yylineno;

int yylex();    
void yyerror(const char *s); 
%}  
%left ADD; 
%%
P : PROGRAM ident Dec BEG Inst END POINT{ 
              printf("Syntaxe correct ");
          return 0; 
          }
Dec : VAR ident DP TYPE PVG D 
|
; 
D : ident DP TYPE PVG D |
; 
Inst : ident AFF Exp PVG Inst |
; 
Exp : Exp ADD Exp | ident | cste 
;       
%%
void yyerror(const char *s) {
        printf("Erreur syntaxique a la ligne %d\n", yylineno);
}
 int main(int argc, char *argv[]){
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
    return 0;
}
 int yywrap() {return 1;}