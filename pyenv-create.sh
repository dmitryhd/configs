#!/usr/bin/env bash

# cp pyenv-create.sh ~/.local/bin/pyenv-create

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PY_VERSION=3.6.2

DIRNAME=$(basename "$PWD")

echo -e "-> creating virtualenv for ${BLUE}${DIRNAME}$NC"


eval "$(pyenv init -)"

pyenv deactivate 2> /dev/null
pyenv virtualenv $PY_VERSION $DIRNAME
pyenv activate $DIRNAME

export PIP_INDEX_URL=http://pypi.k.avito.ru/pypi/
export PIP_TRUSTED_HOST=pypi.k.avito.ru

echo -e "-> installing ${BLUE}reqirements.txt$NC"

pip3 install -r requirements.txt

echo -e "-> installing ${BLUE}test-reqirements.txt$NC"
pip3 install -r test-requirements.txt 

echo -e "-> installing ${BLUE}dev-reqirements.txt$NC"
pip3 install -r dev-requirements.txt 

echo -e "-> updating ${BLUE}.env$NC"
echo "pyenv deactivate 2> /dev/null" > .env
echo "pyenv activate $DIRNAME 2> /dev/null" >> .env
echo "pyenv deactivate> /dev/null" > .out

source .env
