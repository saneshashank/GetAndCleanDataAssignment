# Coursera: Getting and Cleaning Data: Project: run_analysis.R
### extracting of Tidy dataset from data files in UCI HAR Dataset folder is divided into following 8 logical sections, with the corresponding variables defined.

### Section 1: Set File paths - declares all file path variables. In case the folder location is not in working directory edit the file path variables.  
Variables used:
* FilePathTrainData: file path for training data set - X_train.txt
* FilePathTrainLabels: file path for training data labels - y_train.txt
* FilePathTrainSubjects: file path for training subjects - subject_train.txt
* FilePathTestData: file path for test data set - X_test.txt
* FilePathTestLabels: file path for test data labels - y_test.txt
* FilePathTestSubjects: file path for test data subjects - subject_test.txt
* FilePathActivity: file path for Activity Labels - activity_labels.txt
* FilePathFeatures: File path for Features - features.txt

### Section 2: Extract test data based on X_test.txt, y_test.txt and subject_test.txt (in UCI HAR Dataset\test ).
Variables used:
* dfTestLabels: data frame for extracted labels for test data.
* dfTestSubjects: data frame for extracted subjects list for test data.
* dfTest: data frame for extracted test data.

### Section 3: Extract training data based on X_train.txt, y_train.txt and subject_train.txt (in UCI HAR Dataset\train ).
Variables used:
* dfTrainLabels: data frame for extracted labels for training data.
* dfTrainSubjects: data frame for extracted subjects list for training data.
* dfTrain: data frame for extracted training data.

### Section 4: Merge test and training data.
Variables used:
* dfData: data frame for merged test and training data.

### Section 5: rename the merged data variable names with feature names.
Variables used:
* dfFeatures: data frame for extracted features list from features.txt
* FeatureNames: character vector of feature names.

### Section 6: Extract only measurements on mean and standard deviation for each measurement.
Variables used:
* iMean: vector of indexes for columns containing mean variables.
* iStd: vector of indexes for columns containing standard deviation variables.
* iExtract: vector of indexes for extracting subset of data frame dfData containing only mean and standard deviation variables.
* dfExtract: data frame subset of data frame dfData containing only mean and standard deviation variables.

### Section 7: Adding descriptive activity names and naming all variables.
Variables used:
* dfActivityNames: data frame for extracted activity names from activity_labels.txt.

### Section 8: creating independent Tidy data set containing average of each variable for each Activity and each Subject.
Variables used:
* dfTidyGrpData: data frame containing tidy data set containing average of each variable for each Activity and each Subject.
* TidyData.txt: text file created with tidy data set dfTidyGrpData.

### Use the following to view tidy data (after run_analysis.R is run): View(read.table("./TidyData.txt",header = TRUE))
