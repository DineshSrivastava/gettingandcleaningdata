Getting and Cleaning Data
========================================================

This script "run_analysis.R" fulfills the project requirement of Week 3 of "Getting and  Cleaning Data" course.

This script perform following tasks.

*  General Housekeeping


        1. Set the working directory (WD) where script and data has to be housed.
        2. Install "data.table" and "reshape2" packages if required.

*  Getting the Data

        The data file was manually downloaded from given url ("https://d396qusza40orc.
        cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") in the 
        workdirectory represented by getwd(). The "UCI HAR dataset.zip" was unzipped
        to get all project related data in the required directory structure.
        
        Though this step could be automated through R script but was performed 
        manually because it was not a project requirement.


*  Load the Labels/column names for activities and features

*  Load the training and the test sets

        1. Load Test Data
        2. Load Training Data

*  Extract only the measurements on the mean and standard deviation

        * Assign descriptive activity names to name the activities in the data set 
        * Appropriately labels the data set with descriptive activity names 

                1. Assign activity labels to test data sets
                2. Assign activity labels to training data sets
                3. Bind data


*  Merge test and train dataSet

*  Creates a second, independent tidy data set with the average ##  of each variable for each activity and each subject

        1. Apply mean function to dataset using dcast function
        2. Write the tidy data file
        
        
        
