#!/bin/bash

shopt -s extglob
rm -rf !(*.py|*.txt|"venv"|*.sh)
shopt -u extglob
