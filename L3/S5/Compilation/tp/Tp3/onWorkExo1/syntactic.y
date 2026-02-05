%{
   #include <stdio.h>
   #include <stdlib.h>

   int yylex();
   void yyerror(const char *s);

%}

%union {
    int ival;
}

%token    <ival> NUMBER
%token    PLUS MOINS MULT DIV LPAREN RPAREN
%token    '\n'

%type     <ival> S exp terme facteur

%left     PLUS MOINS
%left     MULT DIV
%right    UMINUS

%%

S: 
 | S line                         
 ;

line: exp '\n'                        { printf("Syntaxe correcte: result = %d\n", $1); }
    ;

exp: exp PLUS terme                   { $$ = $1 + $3; }
   | exp MOINS terme                  { $$ = $1 - $3; }
   | terme                            { $$ = $1; }
   ;

terme: terme MULT facteur             { $$ = $1 * $3; }
     | terme DIV facteur              { $$ = $1 / $3; }
     ;

facteur: NUMBER                       { $$ = $1; }
       | LPAREN exp RPAREN            { $$ = $2; }
       | MOINS facteur %prec UMINUS   { $$ = -$2; }
       ;

%%

void yyerror(const char *s) {
    printf("Erreur syntaxique : %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
