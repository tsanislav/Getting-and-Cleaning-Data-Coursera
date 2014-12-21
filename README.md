# COURSE PROJECT: GETTING AND CLEANING DATA
==================================
## DESCRIPTION
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## FILES

This repository contains the following the files:
* run_Analysis.R - the script to run the analysis 
* CodeBook.md - describes the variables, the data, and any transformations or work that was performed to clean up the data 
* tidy.txt - the output of run_Analysis.R

## HOW DOES THE CODE WORK

The code is contained in the run_Analysis.R file and it performs the following tasks:

* Reads and merges all the data placed in a folder "UCI HAR Dataset" in the default working directory. 
* Extracts only measurements on mean and standard deviation
* Labels and cleans up the labels 
* Creates and independent tidy data set - tidy.txt
