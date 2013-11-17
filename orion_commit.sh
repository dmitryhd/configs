#!/bin/bash

# Written by: Dmitry Khodakov

red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m' # No Color

only_lint=0
only_test=0
no_commit=0
OPTIND=1

while getopts "ltnh" opt; do
  case $opt in
  l)
      only_lint=1
      ;;
  t)
      only_test=1
      ;;
  n)
      no_commit=1
      ;;
  h)
        echo 'usage ./orion_commit.sh -l (only lint) -t (only test) -n (no commit)'
        exit
    ;;
  esac
done
shift $((OPTIND - 1))
[ "$1" = "--" ] && shift
# ----------------------------------------
# First - check if tests are passing.
# ----------------------------------------
if [[ $only_lint -ne 1 ]]
then
    echo -n 'testing: '
    nosetests -x --processes=16 --process-timeout=40
    if [[ $? -ne 0 ]]
    then
        echo -e "${red}[FAIL]${NC}"
        while true; do
        read -p "Do you wish to continue committing anyway? [Yn]:" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
        done
    fi
    echo -e "${green}[PASS]${NC}"
fi

# ----------------------------------------
# Second - check if there is pylint errors
# ----------------------------------------

if [[ $only_test -ne 1 ]]
then
    echo "Checking files to commit with pylint..."
    was_error=0
    for file in $(git diff --name-only); 
    do
        if [[ ${file: -3} == ".py" ]]
        then
            pylint -rn $file;
            if [[ $? -ne 0 ]]
            then
                echo -e "${red}Pylint find errors in ${file}${NC}"
                was_error=1
            else
                echo -e "${green}Pylint thinks that ${file} is clear${NC}"
            fi
        fi
    done

    if [[ $was_error -eq 1 ]]
    then
        echo -e "${red}There were errors. (pylint)${NC}"
        while true; do
        read -p "Do you wish to continue committing anyway? [Yn]:" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
        done
    fi
fi


if [[ $no_commit -ne 1 ]]
then
    echo -e "${green}Ok, comitting ... ${NC}"
    git commit -a 
fi
