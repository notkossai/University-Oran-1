%{
%}
binary (0|1)+
decimal [0-9]+
%%
{binary} printf("%s: is a binary number\n", yytext);
{decimal} printf ("%s: is NOT a binary number\n", yytext);
. printf("%s: LEXICAL ERROR\n", yytext);
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
