#!/bin/bash

cat tutorials_template.md > en/list.md
echo '' >> en/list.md
echo "| Category | Title | Author | Date |" >> en/list.md
echo "| -------- |------ | ------ | ---- |" >> en/list.md

for path in en/tutorials/*/*.md
do
	IFS='/' read -a explode <<< "$path"
	category=${explode[2]}
	category="$(tr '[:lower:]' '[:upper:]' <<< ${category:0:1})${category:1}"
	title=$(cat $path | sed -n 1p)
	title="${title/'# '/}"
	author=$(cat $path | sed -n 2p)
	author="${author/'By: '/}"
	date=$(cat $path | sed -n 3p)
	date="${date/'Date: '/}"
	url="${explode[1]}/${explode[2]}/${explode[3]}"
	echo "| $category | [$title]($url) | $author | $date | " >> en/list.md
done;

git config --global user.email "circleci@0fi.net"
git config --global user.name "CircleCI"

git add -A
git commit -m 'Generated list'
git push origin gh-pages