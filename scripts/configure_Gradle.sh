#!/bin/bash

exportGradle()
{
	# Set GRADLE_HOME temporarily
	echo "GRADLE_HOME being set to $gradle_destination"
	export GRADLE_HOME="$gradle_destination"

	# Add Gradle bin directory to PATH
	export PATH="$GRADLE_HOME/bin:$PATH"
}

testGradleDownload()
{
	#Testing the download
	echo "Testing the download."
	echo ""
	echo ""
	exportGradle
	gradle -v
	echo ""
	echo ""
	echo "Finished Testing the download."
}

if [ -d "$gradle_destination" ]; then
	echo "Gradle $gradle_ver already exists."
	testGradleDownload
else
	echo "Downloading Gradle v$gradle_ver"
	# Define the URL of the OpenJDK installer
	url="https://github.com/gradle/gradle-distributions/releases/download/v8.8.0/gradle-8.8-bin.zip"

	# Define the temporary file to store the downloaded installer
	zip_file=$(mktemp)
	
	# Download the OpenJDK installer
	curl -L -o $zip_file $url

	# Check if the destination directory exists; if not, create it
	if [ -d "$destination" ]; then
		echo "$destination exists"
		
	else
		echo "making $destination"
		mkdir -p "$destination"
	fi
	echo "Extracting the ZIP archive to the aforementioned destination directory."
	unzip -q $zip_file -d "$destination"
	echo "Gradle ZIP archive extracted to $destination."

	# Clean up the ZIP file
	echo "Cleaning up the downloaded ZIP file" 
	rm $zip_file

	testGradleDownload
	
fi


