%{
  #include <stdio.h>
%}

%option c++
%option noyywrap

%%

hello           { printf("Hello found!\n"); };
[ \t\n]+        ; // skip whitespace
<<EOF>>         { printf("EOF\n"); };
.               { printf("Other: %s\n", yytext); };

%%

int yywrap(void) { return 1; };
