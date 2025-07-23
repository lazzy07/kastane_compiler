#include <iostream>
#include <FlexLexer.h>
#include <sstream>

int main(int argc, char** argv) {
    FlexLexer* lexer = new yyFlexLexer(std::cin, std::cerr);

    lexer->yylex();

    delete lexer;
    return 0;
}