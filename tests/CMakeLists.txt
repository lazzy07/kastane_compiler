cmake_minimum_required(VERSION 3.24)

set(This Sabre-Compiler-Tests)

project(This LANGUAGES CXX)

include_directories(This PRIVATE ../src)

enable_testing()

add_subdirectory(
  ${CMAKE_SOURCE_DIR}/vendor/gtest-1.17.0 
  ${CMAKE_SOURCE_DIR}/build/googletest
)

set(
  Sources
  LexerTester.cpp
)

add_executable(${This} ${Sources})

target_link_libraries(${This} PUBLIC gtest_main)

