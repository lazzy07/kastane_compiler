#include <gtest/gtest.h>
#include <FlexLexer.h>
#include <sstream>

TEST(LexerTest, TypeTest){
  std::istringstream input("type location;");
  std::ostringstream output;

  FlexLexer* lexer = new yyFlexLexer(&input, &output);

  int token = 0;
  std::vector<int> tokens;

  while ((token = lexer->yylex()) != 0) {
    tokens.push_back(token);
  }

  delete lexer;

  ASSERT_EQ(tokens.size(), 3);
  EXPECT_EQ(tokens[0], KEYWORD_TYPE);
  EXPECT_EQ(tokens[1], TYPE_NAME);  // or whatever token `location` maps to
  EXPECT_EQ(tokens[2], SEMICOLON);
};