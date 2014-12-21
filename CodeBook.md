# Code Book Getting and Cleaning Data

The script in run_Analysis.R performs the following steps:

1. Reads all the data placed in a folder "UCI HAR Dataset" in the default working directory.
1.a. First, it reads all training data and merges in into one data frame using cbind.
1.b. Second, it reads all testing data and merges in into one data frame using cbind.
1.c. Third, it reads the activity labels and features data sets.

2. Merges the data using rbind
3. Extracts only measurements on mean and standard deviation 
4. Labels the data set using activity labels variable
5. Cleans up the column labels by converting the "-" to "_" and removes "()"
6. Creates and independent tidy data set using ddply function from "plyr" package and writes a new file named "tidy.txt"

# List of Variables
* training - a data frame containing all training data merged using cbind
* test - a data frame containing all testing data merged using cbind
* activity_labels - a data frame containing the activity labels
* features - a data frame containing the features
* mergedData - a data frame merging "training" and "test" using rbind
* vars - logical vector used to select only columns that have mean and std measurements
* cleanData - a data frame containing only measurements using mean and std measurements, with appropriate labelling and "activity"
and "subject" columns.
* average_data - a data frame with the average of each variable from cleanData and excluding the "activity" and "subject" columns
