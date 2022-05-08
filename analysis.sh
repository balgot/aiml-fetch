#!/bin/bash


# first we start with analyzin the number of files and categories
find . -name '*.aiml' | wc -l | xargs echo "Number of .aiml files:"


echo -n "Number of <category> elements"
grep -ro "<category>" . | wc -l | xargs echo "Total matches :"

grep -ro 'version="1.0"' . | wc -l | xargs echo "Number of AIML 1.0 versions"
grep -ro 'version="1.0.1"' . | wc -l | xargs echo "Number of AIML 1.0.1 versions"
grep -ro 'version="2.0"' . | wc -l | xargs echo "Number of AIML 2.0 versions"
