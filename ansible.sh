#!/bin/bash

DIR=$(dirname "$0")

cd $DIR

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
rm -rf _site
mkdir _site
git worktree prune
rm -rf .git/worktrees/_site

echo "Checking out template-callysto branch into public"
git worktree add -B template-callysto _site origin/template-callysto

echo "Removing existing files"
rm -rf _site/*

echo "Generating site"
jekyll build

echo "Updating template-callysto branch"
cd _site && git add --all && git commit -m "Publishing to template (ansible.sh)" && git push
