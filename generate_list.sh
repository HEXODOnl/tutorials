#!/bin/bash

cat tutorials_template.md > en/list.md
for path in en/tutorials/*/
do
	IFS='/' read -a explode <<< "$path"
	category=${explode[2]}
	category="$(tr '[:lower:]' '[:upper:]' <<< ${category:0:1})${category:1}"
	echo '' > $path/index.md
	echo "# Categories -> $category" >> $path/index.md
	echo "| Title | Author | Difficulty |" >> $path/index.md
	echo "| ----- | ------ | ---------- |" >> $path/index.md
	echo "- [$category](${explode[1]}/${explode[2]}/index.md)" >> en/list.md
done;

for path in en/tutorials/*/*-*.md
do
	IFS='/' read -a explode <<< "$path"
	title=$(cat $path | sed -n 1p)
	title="${title/'# '/}"
	author=$(cat $path | sed -n 2p)
	author="${author/'By: '/}"
	difficulty=$(cat $path | sed -n 3p)
	difficulty="${difficulty/'Difficulty: '/}"
	url="${explode[3]}"
	echo "| [$title]($url) | $author | $difficulty | " >> ${explode[0]}/${explode[1]}/${explode[2]}/index.md
	echo ${explode[0]}/${explode[1]}/${explode[2]}
done;

git config --global user.email "me@cas.yt"
git config --global user.name "CircleCI"

git add --force -A
git commit -m 'Generated list'
git push origin gh-pages
