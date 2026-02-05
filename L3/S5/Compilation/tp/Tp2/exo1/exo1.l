
ch1 ^[A-Z][a-zA-Z]* 
ch2 ^a[a-zA-Z]*e$
ch3 [01]*011[01]*
ch4 .*[.?]
%%
{ch1} printf("[%s]: starts with a capital letter\n", yytext);
{ch2} printf("[%s]: starts with letter a and ends with e\n", yytext);
{ch3} printf("[%s]: contains 011\n", yytext);
{ch4} printf("[%s]: char ends with . or ?\n", yytext);
.* printf("[%s]: not defined in the grammar\n", yytext);
%%
int yywrap(){
    return 1;
}
int main(){
    yylex();
    return 0;
}