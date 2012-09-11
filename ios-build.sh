#!/bin/bash

# Simple build script for optimising a Cordova project
# Removes all .less files and .css files not named all.css
# Runs all remaining .css, .js and .json files through the 
# YUI Compressor, which is stored for ease in a scripts
# folder in the project directory

echo "iOS/Cordova Optimisation build script"
echo "====================================="

YUI_PATH="$PROJECT_DIR/scripts/yuicompressor-2.4.7/build/yuicompressor-2.4.7.jar"

echo "--> Syncing WWW directory"
rsync -pvtrlL --cvs-exclude "$PROJECT_DIR/www/" "$BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www"

echo "--> Removing LESS files"
find $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www -iname '*.less' -delete

echo "--> Removing unecessary CSS files [CSS not matching all.css]"
find $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www -iname '*.css' \! -iname "all.css"  -delete

echo "--> Running JS files through YUI Compressor"
find $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www -iname '*.js' -exec java -jar $YUI {} -o {} \;

echo "--> Running JSON files through YUI Compressor"
find $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www -iname '*.json' -exec java -jar $YUI {} --type js -o {} \;

echo "--> Running CSS files through YUI Compressor"
find $BUILT_PRODUCTS_DIR/$CONTENTS_FOLDER_PATH/www -iname '*.css' -exec java -jar $YUI {} -o {} \;