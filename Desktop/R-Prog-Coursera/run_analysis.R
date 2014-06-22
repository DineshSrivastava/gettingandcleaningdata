
#####################################################################
####                                                             ####
####                        run_analysis.R                       ####
####                        --------------                       ####
####                 Script: Getting&CleaningDataProject         ####
####                                                             ####
#####################################################################


##  GENERAL HOUSKEEPING
#####################################################################
# Set the working directory (WD)
projectWD <- "C:/Users/DKSrivastava/Desktop/R-Prog-Coursera/"
setwd(projectWD)
getwd()

## Note: library(package) and require(package) both load the namespace of the 
## package with name package and attach it on the search list. require is 
## designed for use inside other functions; it returns FALSE and gives a 
## warning (rather than an error as library() does by default) if the package 
## does not exist. Both functions check and update the list of currently 
## attached packages and do not reload a namespace which is already loaded.

if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

library("data.table")
library("reshape2")


##  GET THE DATA
#####################################################################

# The data file was manually downloaded from given url ("https://d396qusza40orc.
# cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") in the 
# workdirectory represented by getwd(). The "UCI HAR dataset.zip" was unzipped
# to get all project related data in the required directory structure.

# Though this step could be automated through R script but was performed 
# manually because it was not a project requirement.

# Please refer to README.MD for more details.


##  Load the Labels/column names for activities and features
#####################################################################

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]


##  Load the training and the test sets
#####################################################################

## Load Test Data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features  ## Assign column names

## Load Training Data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features  ## Assign column names


## Extract only the measurements on the mean and standard deviation
##############################################################################

mean_and_std_features <- grepl("mean()|std", features)
X_test = X_test[,mean_and_std_features]
X_train = X_train[,mean_and_std_features]


## Assign descriptive activity names to name the activities in the data set 
## Appropriately labels the data set with descriptive activity names 
##############################################################################

# Assign activity labels to test data sets
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "Subject"

# Assign activity labels to training data sets
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "Subject"


# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)
train_data <- cbind(as.data.table(subject_train), y_train, X_train)


## Merged test and train dataSet
#############################################
merged_data = rbind(test_data, train_data)


##  Creates a second, independent tidy data set with the average
##  of each variable for each activity and each subject
#####################################################################

id_labels = c("Subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(merged_data), id_labels)
melt_data = melt(merged_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data = dcast(melt_data, Subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt", quote = FALSE, row.names = FALSE)









