%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylex();
    void yyerror(const char *s);
    extern int nb_ligne;
%}

%union {
    int ival;
}

%token <ival> NUMBER 
%token SEPR 

%type <ival> day month year

%%

S: 
 | S line
 ;

line: format '\n'
    ; 

format: day SEPR month SEPR year {
      int d = $1;
      int m = $3;
      int y = $5;

      if (d < 1 || d > 31) yyerror ("Invalid day\n");
      else if (m < 1 || m > 12) yyerror ("Invalid month");
      else if (y < 1 || y > 9999) yyerror ("Invalid year");
      else{
      switch(m) {
        case 2: 
             if (d > 28) yyerror("Invalid day for February");
             else printf("Syntax correct!: %02d/%02d/%04d\n", d, m, y);
             break;

        case 4: case 6: case 8: case 10: case 12:
             if (d > 30) yyerror("Invalid day for this month");
             else printf("Syntax correct!: %02d/%02d/%04d\n", d, m, y);
             break;

        case 1: case 3: case 5: case 7: case 9: case 11:
             if (d > 31) yyerror("Invalid day for this month");
             else printf("Syntax correct! %02d/%02d/%04d\n", d, m, y);
             break;

        default: yyerror("Invalid month");              
      }
     }
    }
    ;

day: NUMBER    { $$ = $1; } 
   ;

month: NUMBER  { $$ = $1; } 
     ;

year: NUMBER   { $$ = $1; }
    ;                  

%%

void yyerror (const char *s) {
    printf("Error: %s (line %d)\n", s, nb_ligne);
}

int main () {
    printf("Enter dates in format dd/mm/yyyy\n");
    yyparse();
    printf("done!\n");
    return 0;
}