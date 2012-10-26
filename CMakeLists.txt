project(dotfile-yyc)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})
include(DotFiles)

add_subdirectory(git)
add_subdirectory(emacs)
