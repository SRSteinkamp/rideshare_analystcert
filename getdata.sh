#!/bin/bash

# Create directory
mkdir data
# Declare list of dates to be included
declare -a StringArray=(202004 202005 202006 202007 202008 202009 202010 202011 202012 202101 202102 202103 202104)

base_url="https://divvy-tripdata.s3.amazonaws.com"
for date in ${StringArray[@]}
do
    # Create url
    tmpurl="${base_url}/${date}-divvy-tripdata.zip"
    # Print out
    echo $tmpurl
    # Download data with redirect, to data folder
    curl $tmpurl -o "data/${date}-divvy-tripdata.zip" -L
    # Unzip
    unzip "data/${date}-divvy-tripdata.zip" -d data/
    # Clean up zipfiles
    rm "data/${date}-divvy-tripdata.zip"
done

# clean up
rm -r data/__MACOSX/