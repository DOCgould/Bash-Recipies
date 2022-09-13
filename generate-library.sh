#!/bin/bash
# ==========================================================================
# $Date:  $
# $Revision:  $
# $Author:  $
# $HeadURL:  $
# ==========================================================================
# ==========================================================================
# Date       Author      Description
# ----       ------      -----------
# MM/DD/YY   <name>      Initial version
#   ========================================================================
#
# File Name: generate-project.sh
# Creation Date: 26-05-2022

function gen_cmake()
{
echo '#' > CMakeLists.txt
echo '# Generic CmakeList file' >> CMakeLists.txt
echo '#' >> CMakeLists.txt
echo '# @author Christian Gould' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo 'cmake_minimum_required(VERSION 3.22)' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo "project(${LIBRARY_NAME})" >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo '# includes' >> CMakeLists.txt
echo 'include_directories(' >> CMakeLists.txt
echo '  include' >> CMakeLists.txt
echo ')' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo '# find header & source' >> CMakeLists.txt
echo 'file(GLOB_RECURSE HEADER 'include/*.h')' >> CMakeLists.txt
echo 'file(GLOB_RECURSE SOURCE 'src/*.cpp')' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo "add_library(${LIBRARY_NAME}" >> CMakeLists.txt
echo '  ${SOURCE}' >> CMakeLists.txt
echo '  ${HEADER}' >> CMakeLists.txt
echo ')' >> CMakeLists.txt
echo '' >> CMakeLists.txt
}

function gen_lib_files()
{
    echo "[ info ] Generating Library $LIBRARY_NAME Files ..."
    touch README.md
    touch LICENSE.md
    gen_cmake
}

function gen_lib_dirs()
{
    echo "[ info ] Generating Library $LIBRARY_NAME Directories ..."
    mkdir {include,src,build,tests,docs,extern,scripts}
}

function gen_lib()
{
    echo "[ info ] Generating Library $LIBRARY_NAME"
    mkdir $LIBRARY_NAME
    cd $LIBRARY_NAME
    gen_lib_dirs
    gen_lib_files
    echo "[ info ] Complete. Exit"
}
function gen_build_script(){
    mkdir build
    echo -e "#include $LIBRARY_NAME.h" >> build/main.cpp
    echo -e "int main(int argc, char **argv) { return 0;}" >> build/main.cpp
    echo "g++ main.cpp -L./ -l$LIBRARY_NAME -I../include -o test" >> build/build.sh
}

PROJECT_ROOT=$PWD
LIBRARY_NAME=$1
gen_lib
gen_build_script
