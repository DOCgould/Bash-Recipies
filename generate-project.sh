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

function gen_proj_files()
{
    echo "[ info ] Generating Project $PROJECT_NAME Files ..."
    touch README.md
    touch LICENSE.md
    touch CMakeLists.txt
}

function gen_proj_dirs()
{
    echo "[ info ] Generating Project $PROJECT_NAME Directories ..."
    mkdir {include,src,apps,tests,docs,extern,scripts}
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

