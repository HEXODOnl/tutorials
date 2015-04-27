#!/bin/bash

cat tutorials_template.md > en/list.md
echo "| Title | Category |" >> en/list.md
echo "| ----- | -------- |" >> en/list.md

for path in en/tutorials/*/*.md
do
	IFS='/' read -a explode <<< "$path"
	category=${explode[2]}
	category="$(tr '[:lower:]' '[:upper:]' <<< ${category:0:1})${category:1}"
	title=$(head -n 1 $path)
	title="${title/'# '/}"
	url="${explode[1]}/${explode[2]}/${explode[3]}"
	echo "| [$title]($url) | $category |" >> en/list.md
done;