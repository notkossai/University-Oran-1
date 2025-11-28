%option yylineno

lettre [a-z]+
number [0-9]+
keyword program|begin|end|var|integer|boolean|real
ident {lettre}({lettre}|{number})*
cste {number}{number}*
opr ":="|"+"
sepr [:;]
pgEnd "."

%%
{keyword} fprintf(yyout, "LINE: %d => KEYWORD: %s\n", yylineno, yytext);
{ident} fprintf(yyout,"LINE: %d => IDENTIFIER: %s\n", yylineno, yytext);
{cste} fprintf (yyout,"LINE: %d => CONSTANTE: %s\n", yylineno, yytext);
{opr} fprintf(yyout,"LINE: %d => OPERATOR: %s\n", yylineno, yytext);
{sepr} fprintf(yyout,"LINE: %d => SEPERATOR: %s\n", yylineno, yytext);
{pgEnd} fprintf(yyout,"LINE: %d => PROGRAM END: %s\n", yylineno, yytext);

[ \t] ; //ignore tabs
\n ; //ignore spaces

. fprintf(yyout,"LINE: %d => LEXICAL ERROR: %s\n", yylineno, yytext);  //error
%%

int yywrap(){
    return 1;
}

int main(int argc, char *argv[]){
    yyin= fopen(argv[1], "r");
    yyout= fopen(argv[2], "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
    return 0;
}