%option noyywrap

identifier              {identifier-nondigit}({identifier-nondigit}|{digit})*|12?3
identifier-nondigit     {nondigit}|{universal-character-name}
nondigit                [a-zA-Z_]
digit                   [0-9]

universal-character-name \\u{hex-quad}|\\U{hex-quad}{hex-quad}
hex-quad                {hexadecimal-digit}{4}
hexadecimal-digit       [0-9a-fA-F]

%%

{digit}                 { printf("digit: %s\n", yytext); }
{identifier}            { printf("ID: %s\n", yytext); }
.                       {}

%%

int main(){
    yylex();
    return 0;
}