#!/bin/bash

echo ""
echo "#### STARTED TRAVIS MAGIC ON $GH_REPO"

REPO=$(git config remote.origin.url)
BRANCH="gh-pages"
REPO_URL="https://$GH_TOKEN@github.com/$GH_REPO.git"

git config user.name "travis-bot"
git config user.email "travis"

# python ./python/index_builder.py

echo ""
echo "#### STATUS"

git status

git add csv

git commit -m ":rocket: new deploy from travis-ci"

echo ""
echo "Pulling latest gh-pages..."

git checkout $BRANCH

git merge csv -m ":rocket: merge from travis-ci"

echo ""
echo "Pushing..."

git push $REPO_URL $BRANCH

echo ""
echo "#### DEPLOY COMPLETE"