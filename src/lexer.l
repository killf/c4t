/*参考C11标准文档第458页*/

/*标识符*/
identifier                      {identifier-nondigit}({identifier-nondigit}|{digit})*
identifier-nondigit             {nondigit}|{universal-character-name}
nondigit                        [a-zA-Z_]
digit                           [0-9]

/*通用字符名*/
universal-character-name        \\u{hex-quad}|\\U{hex-quad}{hex-quad}
hex-quad                        {hexadecimal-digit}{4}

/*常数*/
constant                        {integer-constant}|{floating-constant}|{enumeration-constant}|{character-constant}
integer-constant                {decimal-constant}{integer-suffix}?|{octal-constant}{integer-suffix}?|{hexadecimal-constant}{integer-suffix}?
decimal-constant                {nonzero-digit}{digit}*
octal-constant                  0{octal-digit}*
hexadecimal-constant            {hexadecimal-prefix}{hexadecimal-digit}+
hexadecimal-prefix              0x|0X
nonzero-digit                   [1-9]
octal-digit                     [0-7]
hexadecimal-digit               [0-9a-fA-F]
integer-suffix                  {unsigned-suffix}{long-suffix}?|{unsigned-suffix}{long-long-suffix}|{long-suffix}{unsigned-suffix}?|{long-long-suffix}{unsigned-suffix}?
unsigned-suffix                 u|U
long-suffix                     l|L
long-long-suffix                ll|LL
floating-constant               {decimal-floating-constant}|{hexadecimal-floating-constant}
decimal-floating-constant       {fractional-constant}{exponent-part}?{floating-suffix}?|{digit-sequence}{exponent-part}{floating-suffix}?
hexadecimal-floating-constant   {hexadecimal-prefix}{hexadecimal-fractional-constant}{binary-exponent-part}{floating-suffix}?|{hexadecimal-prefix}{hexadecimal-digit-sequence}{binary-exponent-part}{floating-suffix}?
fractional-constant             {digit-sequence}?.{digit-sequence}|{digit-sequence}.
exponent-part                   (e|E){sign}?{digit-sequence}
sign                            +|-
digit-sequence                  {digit}+
hexadecimal-fractional-constant {hexadecimal-digit-sequence}?.{hexadecimal-digit-sequence}|{hexadecimal-digit-sequence}.
binary-exponent-part            (p|P){sign}?{digit-sequence}
hexadecimal-digit-sequence      {hexadecimal-digit}+
floating-suffix                 f|l|F|L
enumeration-constant            {identifier}
character-constant              [LuU]?'{c-char-sequence}'
c-char-sequence                 {c-char}+
c-char                          [^'\\]|{simple-escape-sequence}
escape-sequence                 {simple-escape-sequence}|{octal-escape-sequence}|{hexadecimal-escape-sequence}|{universal-character-name}
simple-escape-sequence          \\['"?\\abfnrtv]
octal-escape-sequence           \\{octal-digit}{1,3}
hexadecimal-escape-sequence     \\x{hexadecimal-digit}+

%%

/*关键表*/
"auto"                          { return AUTO; }
"break"                         { return BREAK; }
"case"                          { return CASE; }
"char"                          { return CHAR; }
"const"                         { return CONST; }
"continue"                      { return CONTINUE; }
"default"                       { return DEFAULT; }
"do"                            { return DO; }
"double"                        { return DOUBLE; }
"else"                          { return ELSE; }
"enum"                          { return ENUM; }
"extern"                        { return EXTERN; }
"float"                         { return FLOAT; }
"for"                           { return FOR; }
"goto"                          { return GOTO; }
"if"                            { return IF; }
"inline"                        { return INLINE; }
"int"                           { return INT; }
"long"                          { return LONG; }
"register"                      { return REGISTER; }
"restrict"                      { return RESTRICT; }
"return"                        { return RETURN; }
"short"                         { return SHORT; }
"signed"                        { return SIGNED; }
"sizeof"                        { return SIZEOF; }
"static"                        { return STATIC; }
"struct"                        { return STRUCT; }
"switch"                        { return SWITCH; }
"typedef"                       { return TYPEDEF; }
"union"                         { return UNION; }
"unsigned"                      { return UNSIGNED; }
"void"                          { return VOID; }
"volatile"                      { return VOLATILE; }
"while"                         { return WHILE; }
"_Alignas"                      { return _ALIGNAS; }
"_Alignof"                      { return _ALIGNOF; }
"_Atomic"                       { return _ATOMIC; }
"_Bool"                         { return _BOOL; }
"_Complex"                      { return _COMPLEX; }
"_Generic"                      { return _GENERIC; }
"_Imaginary"                    { return _IMAGINARY; }
"_Noreturn"                     { return _NORETURN; }
"_Static_assert"                { return _STATIC_ASSERT; }
"_Thread_local"                 { return _THREAD_LOCAL; }

/*标识符*/
{identifier}                    { return IDENTIFIER; }

/*常数*/


/*字符串字面量*/

/*运算符(第72页)*/
"["                             { return ; }
"]"                             { return ; }
"("                             { return ; }
")"                             { return ; }
"{"                             { return ; }
"}"                             { return ; }
"."                             { return ; }
"->"                            { return ; }
"++"                            { return ; }
"--"                            { return ; }
"&"                             { return ; }
"*"                             { return ; }
"+"                             { return ; }
"-"                             { return ; }
"~"                             { return ; }
"!"                             { return ; }
"/"                             { return ; }
"%"                             { return ; }
"<<"                            { return ; }
">>"                            { return ; }
"<"                             { return ; }
">"                             { return ; }
"<="                            { return ; }
">="                            { return ; }
"=="                            { return ; }
"!="                            { return ; }
"^"                             { return ; }
"|"                             { return ; }
"&&"                            { return ; }
"||"                            { return ; }
"?"                             { return ; }
":"                             { return ; }
";"                             { return ; }
"..."                           { return ; }
"="                             { return ; }
"*="                            { return ; }
"/="                            { return ; }
"%="                            { return ; }
"+="                            { return ; }
"-="                            { return ; }
"<<="                           { return ; }
">>="                           { return ; }
"&="                            { return ; }
"^="                            { return ; }
"|="                            { return ; }
","                             { return ; }
"#"                             { return ; }
"##"                            { return ; }
"<:"                            { return ; }
":>"                            { return ; }
"<%"                            { return ; }
"%>"                            { return ; }
"%:"                            { return ; }
"%:%:"                          { return ; }







%%