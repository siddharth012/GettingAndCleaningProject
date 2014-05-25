#Read all the data sets and column name text files into the script

testx <- read.table("test/X_test.txt")
trainx <- read.table("train/X_train.txt")
testy <- read.table("test/y_test.txt")
trainy <- read.table("train/y_train.txt")
features <- read.table("features.txt")
subtest <- read.table("test/subject_test.txt")
subtrain <- read.table("train/subject_train.txt")
actlab <- read.table("activity_labels.txt")

#Merge trainx and testx data

merdat <- rbind(trainx, testx)

#Column name of merdat is extracted from features text file

names(merdat) <- features[,2]

#Column names containg mean and std are extracted

merdat <- merdat[, c(grep("mean()", names(merdat), value=TRUE), grep("std()", names(merdat), value=TRUE))]

#Extra Column names are removed to get only the required columns

merdat <- merdat[, !grepl("meanFreq()", names(merdat))]

#Following lines of codes help in getting the column names to our required text names without '()', '_', etc.

names(merdat) = tolower(names(merdat))
names(merdat) = sub("()", "", names(merdat), fixed=TRUE)
names(merdat) = sub("-", "", names(merdat), fixed=TRUE)
names(merdat) = sub("-", "", names(merdat), fixed=TRUE)

#Another variable containing a single data frame of subtrain and subtest values:

subject <- rbind(subtrain, subtest)

#Convert this data frame into a vector:

subject <- as.vector(t(subject[,1]))

#This vector is added to the data set:

merdat$subject <- subject

#Another variable containing a single data frame of trainy and testy values:

activity <- rbind(trainy, testy)

#Convert this data frame into a vector:

activity <- as.vector(t(activity[,1]))

#Convert this vector into a character vector:

actlab[,2] <- as.character(actlab[,2])

#Initializing plyr package

library(plyr)

#Activity vector is mapped from 'activity_labels.txt' file and values are converted accordingly:

activity <- mapvalues(activity, from = 1:6, to = actlab[,2])

#This vector is added to the data set:

merdat$activity <- activity

#Initializing reshape2 package

library(reshape2)

#Data set is melted to create another final tidy data set which has means of all the variables 
#according to subject and activity names

data <- melt(merdat, id = c("subject", "activity"))
data <- dcast(data, ...~variable, mean)

# This is the final Data:

data