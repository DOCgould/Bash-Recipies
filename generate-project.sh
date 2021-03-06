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
echo "project(${PROJECT_NAME})" >> CMakeLists.txt
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
echo "add_executable(${PROJECT_NAME}" >> CMakeLists.txt
echo '  ${SOURCE}' >> CMakeLists.txt
echo '  ${HEADER}' >> CMakeLists.txt
echo ')' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo 'source_group('Header include' FILES ${HEADER})' >> CMakeLists.txt
echo 'source_group('Source src'     FILES ${SOURCE})' >> CMakeLists.txt
echo '' >> CMakeLists.txt
echo '# link libraries' >> CMakeLists.txt
echo '#target_link_libraries(${PROJECT_NAME} ${SOME_LIB})' >> CMakeLists.txt
echo '' >> CMakeLists.txt
}

function gen_proj_files()
{
    echo "[ info ] Generating Project $PROJECT_NAME Files ..."
    touch README.md
    touch LICENSE.md
    gen_cmake
}

function gen_proj_dirs()
{
    echo "[ info ] Generating Project $PROJECT_NAME Directories ..."
    mkdir {include,src,build,tests,docs,extern,scripts}
}

function gen_proj()
{
    echo "[ info ] Generating Project $PROJECT_NAME"
    mkdir $PROJECT_NAME
    cd $PROJECT_NAME
    gen_proj_dirs
    gen_proj_files
    echo "[ info ] Complete. Exit"
}

PROJECT_ROOT=$PWD
PROJECT_NAME=$1
gen_proj
