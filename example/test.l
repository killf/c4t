%option noyywrap

/*标识符*/
identifier              {identifier-nondigit}({identifier-nondigit}|{digit})*
identifier-nondigit     {nondigit}|{universal-character-name}
nondigit                [a-zA-Z_]
digit                   [0-9]

/*通用字符名*/
universal-character-name \\u{hex-quad}|\\U{hex-quad}{hex-quad}
hex-quad                {hexadecimal-digit}{4}

/*常数*/
constant                {integer-constant}|{floating-constant}|{enumeration-constant}|{character-constant}
integer-constant        {decimal-constant}{integer-suffix}?|{octal-constant}{integer-suffix}?|{hexadecimal-constant}{integer-suffix}?
decimal-constant        {nonzero-digit}{digit}*
octal-constant          0{octal-digit}*
hexadecimal-constant    {hexadecimal-prefix}{hexadecimal-digit}+
hexadecimal-prefix      0x|0X
nonzero-digit           [1-9]
octal-digit             [0-7]
hexadecimal-digit       [0-9a-fA-F]
integer-suffix          {unsigned-suffix}{long-suffix}?|{unsigned-suffix}{long-long-suffix}|{long-suffix}{unsigned-suffix}?|{long-long-suffix}{unsigned-suffix}?
unsigned-suffix         u|U
long-suffix             l|L
long-long-suffix        ll|LL
floating-constant       {decimal-floating-constant}|{hexadecimal-floating-constant}
decimal-floating-constant       {fractional-constant}{exponent-part}?{floating-suffix}?|{digit-sequence}{exponent-part}{floating-suffix}?
hexadecimal-floating-constant   {hexadecimal-prefix}{hexadecimal-fractional-constant}{binary-exponent-part}{floating-suffix}?|{hexadecimal-prefix}{hexadecimal-digit-sequence}{binary-exponent-part}{floating-suffix}?
fractional-constant     {digit-sequence}?.{digit-sequence}|{digit-sequence}.
exponent-part           (e|E){sign}?{digit-sequence}
sign                    +|-
digit-sequence          {digit}+
hexadecimal-fractional-constant {hexadecimal-digit-sequence}?.{hexadecimal-digit-sequence}|{hexadecimal-digit-sequence}.
binary-exponent-part    (p|P){sign}?{digit-sequence}
hexadecimal-digit-sequence  {hexadecimal-digit}+
floating-suffix         f|l|F|L
enumeration-constant    {identifier}
character-constant      [LuU]?'{c-char-sequence}'
c-char-sequence         {c-char}+
c-char                  [^'\\]|{simple-escape-sequence}
escape-sequence         {simple-escape-sequence}|{octal-escape-sequence}|{hexadecimal-escape-sequence}|{universal-character-name}
simple-escape-sequence  \\['"?\\abfnrtv]
octal-escape-sequence   \\{octal-digit}{1,3}
hexadecimal-escape-sequence     \\x{hexadecimal-digit}+

%%

{digit}                 { printf("digit: %s\n", yytext); }
{identifier}            { printf("ID: %s\n", yytext); }
{character-constant}    { printf("Const: %s\n", yytext); }
.                       {}

%%

int main(){
    yylex();
    return 0;
}