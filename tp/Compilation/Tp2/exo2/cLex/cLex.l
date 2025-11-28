
/*For the line number*/
%option yylineno

%{
    #include <stdio.h>
    extern FILE *yyin, *yyout;

  /* Helper function to print */
    void printTok(const char *type){
    fprintf(yyout, "LINE: %d => %s: %s\n", yylineno, type, yytext);
    }
%}

/* STRINGS */
lettre          [a-zA-Z]
number          [0-9]+

/* CHAR & STRING LETERAL */
charlit         \'([^\\\n']|\\.)\'  
strlit          \"([^\\\n\"\\]|\\.)*\"  

/* HEX & FLOAT */
hex             [0-9A-Fa-f]
float           ({number}+\.{number}*|{number}*\.{number}+)([eE][+-]?{number}+)?

/* PREPROCESSOR DIRECTIVES */
preproc         ^\#(include|define|undef|if|ifdef|ifndef|elif|else|endif|error|warning|pragma|line)*

/* KEYWORDS(32 Keyword) */
dataKw          char|int|float|double|void|short|long|unsigned|signed
oprUtyKw        sizeof|return|goto|typedef
ctrlFlowKw      if|else|switch|case|default|for|while|do|break|continue
strgClasKw      auto|register|static|extern
typQualKw       const|volatile
usrDefndTypKw   struct|union|enum

/* OPERATORS */
arthOpr         "+"|"-"|"*"|"/"|"%"|"++"|"--"
reltOpr         "=="|"!="|">"|"<"|">="|"<="
logcOpr         "&&"|"||"|"!"
bitwiseOpr      "&"|"|"|"^"|"~"|"<<"|">>"
asgOpr          "="|"+="|"-="|"*="|"/="|"%="|"<<="|">>="|"&="|"^="|"|="
/*miscOpr  TO DO*/

/* SEPARATORS */
genSepr         ","|";"|"("|")"|"["|"]"|"{"|"}"
miscSepr        "."|":"


/* PATTERNS */
keyword         {dataKw}|{oprUtyKw}|{ctrlFlowKw}|{strgClasKw}|{typQualKw}|{usrDefndTypKw}
ident           {lettre}({lettre}|{number})*
cste            {number}|{hex}|{float}
opr             {arthOpr}|{reltOpr}|{logcOpr}|{bitwiseOpr}|{asgOpr}
sepr            {genSepr}|{miscSepr}

%%

{preproc}       printTok("PREPROCESSOR");
{charlit}       printTok("CHAR_LITERAL");
{strlit}        printTok("STRING_LITERAL");
{keyword}       printTok("KEYWORD");
{ident}         printTok("IDENTIFIER");
{cste}          printTok("CONSTANT");
{opr}           printTok("OPERATOR");
{sepr}          printTok("SEPARATOR");

[ \t]           ; //ignore tabs and spaces
\n              ; //ignore newlines

     
.               fprintf(yyout,"LINE: %d => LEXICAL ERROR: %s\n", yylineno, yytext);  //error
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