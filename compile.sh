#!/usr/bin/env bash


OIFS="$IFS"
IFS=$'\n'
for file in `find . -type f -name "*.md"`
do
    echo "$file"
    fn=$(echo "$file" | cut -d '/' -f3- | rev | cut -d '.' -f2- | rev)
    pandoc "$file" -o public/$fn.html --lua-filter=links-to-html.lua --template template.html --include-in-header header.html --include-before-body navbar.html --include-after-body footer.html --standalone --no-highlight --toc --toc-depth 2 --mathjax
done
IFS="$OIFS"


