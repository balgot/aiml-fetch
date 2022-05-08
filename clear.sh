#!/bin/bash

shopt -s extglob
rm -rf !(*.py|*.txt|"venv"|*.sh|*.md|"helpers")
shopt -u extglob
