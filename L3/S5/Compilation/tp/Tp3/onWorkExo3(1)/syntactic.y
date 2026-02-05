%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    int yylex();
    void yyerror(const char *s);
    extern int nb_ligne;
%}

%union {
    char* str;
}

%token      <str> NUMBER 
%token      SEPR '\n'

%type       <str> day month year

%%

S: 
 | S line
 ;

line: format '\n'
    ; 

format: day SEPR month SEPR year {
      int d = atoi($1);
      int m = atoi($3);
      int y = atoi($5);
      
      /* Length check */
      if (strlen($1) != 2) {
          printf("Invalid format: day must be 2 digits\n");
      }
      else if (strlen($3) != 2) {
          printf("Invalid format: month must be 2 digits\n");
      }
      else if (strlen($5) != 4) {
          printf("Invalid format: year must be 4 digits\n");
      }
      else if (d < 1 || d > 31) { 
          printf("Error: Invalid day\n"); 
      }
      else if (m < 1 || m > 12) { 
          printf("Error: Invalid month\n"); 
      }
      else {
          switch(m) { /* Value check */
            case 2: 
                 if (d > 28) { printf("Error: Invalid day for February\n"); }
                 else { printf("Syntax correct: %02d/%02d/%04d\n", d, m, y); }
                 break;

            case 4: case 6: case 9: case 11:
                 if (d > 30) { printf("Error: Invalid day for this month\n"); }
                 else { printf("Syntax correct: %02d/%02d/%04d\n", d, m, y); }
                 break;

            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                 printf("Syntax correct: %02d/%02d/%04d\n", d, m, y);
                 break;

            default: printf("Error: Invalid month\n");              
          }
      }
      free($1);  /* Free allocated spaces */
      free($3);
      free($5);
    }
    ;

day: NUMBER    { $$ = strdup($1); free($1); } 
   ;

month: NUMBER  { $$ = strdup($1); free($1); } 
     ;

year: NUMBER   { $$ = strdup($1); free($1); }
    ;                  

%%

void yyerror(const char *s) {
    printf("Error: %s (line %d)\n", s, nb_ligne);
}

int main() {
    printf("Enter dates in format dd/mm/yyyy (CTRL + C to quit)\n");
    yyparse();
    printf("done!\n");
    return 0;
}
