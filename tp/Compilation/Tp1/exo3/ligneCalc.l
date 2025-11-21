%{
int nb_lignes = 0;
%}

%%
\n nb_lignes++;
%%

int yywrap(){
    return 1;
} 

int main() {
yylex();
printf("number of lignes : %d", nb_lignes);
return 0;
}