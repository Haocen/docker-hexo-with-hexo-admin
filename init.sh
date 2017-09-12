#!/bin/sh

if [ "$(ls -A ./run_scripts/)" ]; then
   echo "Executing additional scripts..."
   for SCRIPT in ./run_scripts/*
   do
      sh $SCRIPT
   done
fi

echo "Check if folder is empty."

if  [ "$(ls -A ./)" ]; then
    echo "Starting server..."
    hexo server
  else
    hexo init /blog
    npm install --save hexo-generator-sitemap
    npm install --save hexo-generator-index
    npm install --save hexo-generator-archive
    npm install --save hexo-generator-category
    npm install --save hexo-generator-tag
    npm install --save hexo-admin
    npm install --save hexo-deployer-shell
    echo "Template built."
fi
