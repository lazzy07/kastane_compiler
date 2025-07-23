%{
  #include <stdio.h>
%}

%option c++
%option noyywrap

DIGIT [0-9]
ID    [a-zA-Z_][a-zA-Z0-9_]*

%%
"//".*                        { /* Ignore single-line comment */ }
"/*"([^*]|\*+[^*/])*\*+"/"    { /* Ignore multi-line comment */ }

[ \t\n\r]+                    {  /* Ignore whitespaces */   }  ;

"type"                        { printf("KEYWORD_TYPE "); };
"entity"                      { printf("KEYWORD_ENTITY "); };
"property"                    { printf("KEYWORD_PROPERTY "); };
"action"                      { printf("KEYWORD_ACTION "); };
"trigger"                     { printf("KEYWORD_TRIGGER "); };

"precondition"                { printf("FUN_KEYWORD_PRECONDITION "); };
"effect"                      { printf("FUN_KEYWORD_EFFECT "); };
"consenting"                  { printf("FUN_KEYWORD_CONSENTING "); };
"observing"                   { printf("FUN_KEYWORD_OBSERVING "); };

"number"                      { printf("DATATYPE_NUMBER "); };
"boolean"                     { printf("DATATYPE_BOOLEAN "); };

"if"                          { printf("KEYWORD_IF "); };
"else"                        { printf("KEYWORD_ELSE "); };


{DIGIT}+                      { printf("NUMBER(%s) ", yytext); };
{ID}                          { printf("IDENTIFIER(%s) ", yytext); };
"?"                           { printf("VALUE_UNKNOWN"); };

"=="                          { printf("OP_BINARY_EQUAL "); };
"!="                          { printf("OP_BINARY_NOT_EQUAL "); };
"="                           { printf("OP_BINARY_ASSIGN "); };
"!"                           { printf("OP_UNARY_NOT "); };
"|"                           { printf("OP_BINARY_OR "); };
"&"                           { printf("OP_BINARY_AND "); };

"+"                           { printf("OP_BINARY_PLUS "); };
"-"                           { printf("OP_BINARY_MINUS "); };
"*"                           { printf("OP_BINARY_MULTI "); };
"/"                           { printf("OP_BINARY_DIV "); };


"("                           { printf("START_BRACKET "); };
")"                           { printf("END_BRACKET "); };
"{"                           { printf("START_CUR_BRACES "); };
"}"                           { printf("END_CUR_BRACES "); };

";"                           { printf("SEMICOLON \n"); };
":"                           { printf("COLON "); };
","                           { printf("COMMA "); };


<<EOF>>                       { printf("EOF "); };
.                             { printf("ERROR Other: %s", yytext); };

%%

int yywrap(void) { return 1; };
