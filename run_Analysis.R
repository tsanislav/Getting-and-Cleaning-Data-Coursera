# STEP 1: READING THE DATA

# PUTTING ALL TRAINING DATA INTO ONE DATA FRAME USING CBIND
training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training <- cbind(training,read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE))
training <- cbind(training,read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE))

# PUTTING ALL TESTING DATA INTO ONE DATA FRAME USING CBIND
test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test <- cbind(test,read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE))
test <- cbind(test,read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE))

# READING ACTIVITY LABELS AND FEATURES DATA SETS
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)

# STEP 2: MERGING THE DATA AND CLEANING THE COLUMN NAMES
mergedData <- rbind(training,test)
names(mergedData) <- gsub("V*","", names(mergedData))

# STEP 3: EXTRACTING ONLY THE MEASUREMENTS ON THE MEAN AND STDEV
names(features) <- c("activity", "feature")
features <- features[grepl(".*mean.*|.*std.*", features$feature),]

# SELECT ONLY MEAN AND STDEV COLUMNS
vars <- names(mergedData) %in% features$activity 
cleanData <- mergedData[vars]

# STEP 4: APPROPRIATLY LABELLING THE DATA SET 
mergedData <- mergedData[,c(ncol(mergedData)-1, ncol(mergedData))]
cleanData <- cbind(cleanData, mergedData)

colnames(cleanData)[ncol(cleanData)] <- "subject"
colnames(cleanData)[ncol(cleanData)-1] <- "activity"
colnames(cleanData)[1:(ncol(cleanData)-2)] <- paste(features[,2])

names(cleanData) <- gsub("-","_",names(cleanData))
names(cleanData) <- gsub("[_()]","",names(cleanData))

activity = 1
for (activityLabel in activity_labels$V2) {
  cleanData$activity <- gsub(activity, activityLabel, cleanData$activity)
  activity <- activity + 1
}

# STEP 5: INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE EXCLUDING SUBJECT AND ACTIVITY

require("plyr")

average_data <- ddply(cleanData, .(activity, subject), function(x) colMeans(x[, 1:(ncol(cleanData)-2)]))
average_data <- average_data[, 3:ncol(average_data)]
write.table(average_data, "tidy.txt", sep="\t", row.name=FALSE)