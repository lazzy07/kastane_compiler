cmake_minimum_required(VERSION 3.26)
project(Sabre-Compiler LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/dist)
set(SOURCE_DIRECTORY ${CMAKE_SOURCE_DIR}/src)
set(PARSER_OUTPUT ${SOURCE_DIRECTORY}/parser)
set(LEXER_OUTPUT ${SOURCE_DIRECTORY}/lexer)

# find_package(BISON 2.1.3 REQUIRED)
find_package(FLEX 2.5.13 REQUIRED)

# bison_target(SabreParser ${SOURCE_DIRECTORY}/Parser.y ${PARSER_OUTPUT}/Parser.cpp DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/parser.h)

flex_target(SabreScanner ${SOURCE_DIRECTORY}/lexer/Lexer.l ${LEXER_OUTPUT}/Lexer.cpp)

# add_flex_bison_dependency(SabreScanner SabreParser)

# Get all the source files
file(GLOB_RECURSE SRC_FILES CONFIGURE_DEPENDS
    src/*.cpp
)

add_executable(
    SabreCompiler 
    ${SRC_FILES} 
    # ${BISON_SabreParser_OUTPUTS}
    ${FLEX_SabreScanner_OUTPUTS}
)

target_include_directories(SabreCompiler PRIVATE ${CMAKE_BINARY_DIR})

