#!/bin/bash

# first we start with analysing the number of files and categories
find . -name '*.aiml' | wc -l | xargs echo "Number of .aiml files:"
grep -ro "</category>" . | wc -l | xargs echo -n "Number of <category> elements"
ls -lR | grep "\.aiml" | awk '{ x += $5 } END { print x }' | numfmt --to=iec-i --suffix=B --format="%.3f" | xargs echo "Total size "
echo

# accross different versions
for version in 'version="1.0"' 'version="1.0.1"' 'version="2.0"'
do
    grep -ro $version . | wc -l | xargs echo -e $version "\t\t"
done
echo

# different tags
for tag in $(cat aiml_tags.txt)
do
    grep -ro $tag . | wc -l | xargs echo -e $tag "\t\t"
done
echo