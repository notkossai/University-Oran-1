%%
"a" printf("z");
"z" printf("a");
. printf("LEXICAL ERROR");

%%

int yywrap(){
    return 1;
}

int main() {
yylex();
return 0;
} 