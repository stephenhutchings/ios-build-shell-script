## iOS/Cordova Build Shell Script ##

This simple script should be run before building a Cordova project for production.

It removes all .less files and .css files (that are not named all.css).
It then runs all remaining .css, .js and .json files through the YUI Compressor.

### How to use it ###

1. In Xcode, open your project and select the Build Phases tab.
2. Select "Add build phase" in the lower right corner.
3. Select "Add run script"
4. Replace the text "Type a script or drag a script file from your workspace" with the following:

~~~
	cd "$PROJECT_DIR/scripts"
	./ios_build.sh
~~~

### Dependencies ###

This script assumes that the YUI Compressor and this script is located in the
project folder like so:

	- ProjectFolder
		-- www
		-- scripts
			--ios-build.sh
			--yuicompressor-2.4.7