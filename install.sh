#!/bin/bash

read -p "What is your package name (no spaces)? " name
read -p "What is your package description? " description
read -p "What is the author name? " author
read -p "What is license? " license


read -r -d '' PACKAGE <<-EOM
{
  "name": "$name",
  "version": "0.0.1",
  "description": "$description",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "build": "gulp build",
    "build-production": "NODE_ENV=production gulp build",
    "serve": "gulp",
    "serve-production": "NODE_ENV=production node --harmony app.js"
  },
  "author": "$author",
  "license": "$license",
  "dependencies": {
    "react": "^0.12.2",
    "react-router": "^0.12.4",
    "react-router-async-props": "^0.1.6"
  },
  "devDependencies": {
    "babelify": "^5.0.4",
    "browserify": "^9.0.3",
    "gulp": "^3.8.11",
    "gulp-jshint": "^1.9.2",
    "gulp-less": "^3.0.1",
    "gulp-livereload": "^3.8.0",
    "gulp-mocha": "^2.0.0",
    "gulp-mocha-selenium": "^1.0.0",
    "gulp-nodemon": "^1.0.5",
    "gulp-notify": "^2.2.0",
    "gulp-react": "^3.0.1",
    "gulp-rename": "^1.2.0",
    "gulp-streamify": "0.0.5",
    "gulp-uglify": "^1.1.0",
    "gulp-util": "^3.0.4",
    "jshint-stylish": "^1.0.1",
    "lazypipe": "^0.2.2",
    "vinyl-source-stream": "^1.1.0",
    "watchify": "^2.4.0"
  }
}
EOM

mkdir ./$name
cd ./$name
git clone https://github.com/mtomcal/react-nodejs-boilerplate .
rm -rf .git
git init
npm install
bower install

echo "$PACKAGE" > package.json

rm install.sh
