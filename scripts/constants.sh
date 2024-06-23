#!/bin/bash

export PROJECT_NAME="java-template"
export openJdk_ver=22.0.1
export op_sys=windows-x64
export destination="$HOME/.configuration-dependencies/$PROJECT_NAME"
export destination_dep="$destination/jdk-$openJdk_ver"
export gradle_ver=8.8
export gradle_destination="$destination/gradle-$gradle_ver"