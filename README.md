# Bash-Recipies
>A Number of Useful Bash Recipies for Various Projects and applications

There are a great number of bash scripts that I make on the daily basis that would be great to use consistently - yet I often forget them once they're done. 
So I plan on filling this repo with bash scripts that I use to make my projects for easy quick 'n dirty templates.

# generate-project.sh
This script build a directory using the first argument to the script - because this is generic, it will link to all sources and all headers in include, and nothing else - if this is not the intended default configuration, you must either modify the generate script, or the CMakeLists.txt after the generation has occurred. 
