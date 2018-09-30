#!/usr/bin/env bash

MINICONDA_VERSION=3
MINICONDA_PREFIX="$USER_LOCAL_APP/miniconda${MINICONDA_VERSION}"
MINICONDA_BIN_FOLDER=$MINICONDA_PREFIX/bin
MINICONDA_CONDA_EXEC=$MINICONDA_BIN_FOLDER/conda
MINICONDA_ACTIVATE_EXEC=$MINICONDA_BIN_FOLDER/activate
MINICONDA_DEACTIVATE_EXEC=$MINICONDA_BIN_FOLDER/deactivate

# python3 environment with stock python
#PYTHON_3_ENV_NAME=py3
#$MINICONDA_CONDA_EXEC create -n $PYTHON_3_ENV_NAME python
#source $MINICONDA_ACTIVATE_EXEC $PYTHON_3_ENV_NAME
#source $MINICONDA_DEACTIVATE_EXEC

# python3 environment with python from conda-forge
#PYTHON_3_ENV_NAME=py3
#$MINICONDA_CONDA_EXEC create -n $PYTHON_3_ENV_NAME
#source $MINICONDA_ACTIVATE_EXEC $PYTHON_3_ENV_NAME
#conda install -c conda-forge -y python
#source $MINICONDA_DEACTIVATE_EXEC

# ruby2 environment (it would still be better to use rbenv to manage ruby versions, so that we don't have to switch conda env to use ruby)
#RUBY_2_ENV_NAME=rb2
#$MINICONDA_CONDA_EXEC create -n $RUBY_2_ENV_NAME
#source $MINICONDA_ACTIVATE_EXEC $RUBY_2_ENV_NAME
#conda install -c conda-forge -y ruby
#source $MINICONDA_DEACTIVATE_EXEC
