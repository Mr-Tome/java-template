#!/bin/bash



#let's check the final destination before we actually do anything


if [ -d "$destination_dep" ]; then
	echo "OpenJDK $openJdk_ver-$op_sys already exists."
	echo "Testing the download."
	#"$destination_dep"/bin/cmake.exe --version
	java -version
else
	echo "Downloading OpenJDK v$openJdk_ver"
	# Define the URL of the OpenJDK installer
	url="https://download.java.net/java/GA/jdk22.0.1/c7ec1332f7bb44aeba2eb341ae18aca4/8/GPL/openjdk-22.0.1_windows-x64_bin.zip"

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
	echo "OpenJDK ZIP archive extracted to $destination."

	# Clean up the ZIP file
	echo "Cleaning up the downloaded ZIP file" 
	rm $zip_file
	
	#Testing the download
	echo "Testing the download."
	java -version
	
	
	##TODO:
	
	## Set JAVA_HOME temporarily
	#export JAVA_HOME="C:/OpenJDK/jdk-11.0.2"
	#
	## Add Java bin directory to PATH
	#export PATH="$JAVA_HOME/bin:$PATH"
	#	
	## Verify Java version
	#java -version
fi


