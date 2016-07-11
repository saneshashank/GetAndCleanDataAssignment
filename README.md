# Coursera: Getting and Cleaning Data: Project: run_analysis.R

##The repo contains the following files :
* CodeBook: the instructions of the data processing
* run_analysis.R: the R script
* README: this present README file


## perquisites for running the code
* dplyr package should be installed.
* Unzip getdata_projectfiles_UCI HAR Dataset.zip from assignment and copy UCI HAR Dataset folder in working directory. 

## run_analysis.R contains following sections (demarcated by comments code):
* Section 1: Set File paths - declares all file path variables. In case the folder location is not as mentioned in perquisite section above
edit the file path variables.
* Section 2: Extract test data based on X_test.txt, y_test.txt and subject_test.txt (in UCI HAR Dataset\test ).
* Section 3: Extract training data based on X_train.txt, y_train.txt and subject_train.txt (in UCI HAR Dataset\train ).
* Section 4: Merge test and training data.
* Section 5: rename the merged data variable names with feature names.
* Section 6: Extract only measurements on mean and standard deviation for each measurement.
* Section 7: Adding descriptive activity names and naming all variables.
* Section 8: creating independent Tidy data set containing average of each variable for each Activity and each Subject.
