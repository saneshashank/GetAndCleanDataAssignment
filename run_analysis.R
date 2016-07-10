
## -------Section 1: Set File paths ------------------------------------
## ------- All file paths depend on UCI HAR Dataset folder kept in
## ------- working directory. In case of change in folder location
## ------- edit file paths.
## ---------------------------------------------------------------------

## Set File paths for all required data sets

## Assign file path for training data set - X_train.txt
FilePathTrainData <-".\\UCI HAR Dataset\\train\\X_train.txt"

## Assign File path for training data labels - y_train.txt
FilePathTrainLabels <- ".\\UCI HAR Dataset\\train\\y_train.txt"

## Assign File path for training subjects - subject_train.txt
FilePathTrainSubjects <- ".\\UCI HAR Dataset\\train\\subject_train.txt"

## Assign File path for test data set - X_test.txt
FilePathTestData <- ".\\UCI HAR Dataset\\test\\X_test.txt"

## Assign File path for test data labels - y_test.txt
FilePathTestLabels <- ".\\UCI HAR Dataset\\test\\y_test.txt"


## Assign File path for test data subjects - subject_test.txt
FilePathTestSubjects <- ".\\UCI HAR Dataset\\test\\subject_test.txt"

## Assign File path for Activity Labels - activity_labels.txt
FilePathActivity <- ".\\UCI HAR Dataset\\activity_labels.txt"

## Assign File path for Features - features.txt
FilePathFeatures <- ".\\UCI HAR Dataset\\features.txt"

## ---------------------------------------------------------------------
## ---------------------------------------------------------------------

## Load dplyr package
library(dplyr)

## ---------Section 2: Extract Test Data---------------------------------
## ----------------------------------------------------------------------

## Create data frame for Test Data
dfTest <- read.table(FilePathTestData,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert data frame to table data frame
dfTest <- tbl_df(dfTest)

## check the dimensions of dfTest data frame (resultis 2947 rows and 561 columns)
dim(dfTest)

## View test data, data frame - this helps visualize data in nice tabular format
## (commented for final run, uncomment to view)
## View(dfTest)

## Create data frame for test data labels
dfTestLabels <- read.table(FilePathTestLabels,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert to table data frame
dfTestLabels <- tbl_df(dfTestLabels)

## Check the dimension of dfTestLabels (dimensions are 2947 rows and 1 column)
dim(dfTestLabels)

## View dfTestLabels (commented for final run, uncomment to view)
## View(dfTestLabels)

## Create Data frame for test subjects
dfTestSubjects <- read.table(FilePathTestSubjects,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert to table data frame
dfTestSubjects <- tbl_df(dfTestSubjects)

## Check the dimension of dfTestSubjects (dimensions are 2947 rows and 1 column)
dim(dfTestSubjects)

## View dfTestLabels (commented for final run, uncomment to view)
## View(dfTestSubjects)

## Column bind dfTestLabels and dfTest
dfTest <- cbind(dfTestSubjects,dfTestLabels,dfTest)

## View final test data set created
View(dfTest)

## ------------------------------------------------------------------------------------
## ------------------------------------------------------------------------------------

## ---------Section 3: Extract Training Data-------------------------------------------
## ------------------------------------------------------------------------------------

## Create data frame for Training Data
dfTrain <- read.table(FilePathTrainData,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert data frame to table data frame
dfTrain <- tbl_df(dfTrain)

## check the dimensions of dfTest data frame (resultis 7352 rows and 561 columns)
dim(dfTrain)

## View test data, data frame - this helps visualize data in nice tabular format
## (commented for final run, uncomment to view) 
## View(dfTrain)

## Create data frame for training data labels
dfTrainLabels <- read.table(FilePathTrainLabels,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert to table data frame
dfTrainLabels <- tbl_df(dfTrainLabels)

## Check the dimension of dfTestLabels (dimensions are 7352 rows and 1 column)
dim(dfTrainLabels)

## View dfTestLabels (commented for final run, uncomment to view)
## View(dfTrainLabels)

## Create Data frame for test subjects
dfTrainSubjects <- read.table(FilePathTrainSubjects,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert to table data frame
dfTrainSubjects <- tbl_df(dfTrainSubjects)

## Check the dimension of dfTestLabels (dimensions are 7352 rows and 1 column)
dim(dfTrainSubjects)

## View dfTestLabels (commented for final run, uncomment to view)
## View(dfTrainSubjects)

## Column bind dfTrainSubjects,dfTrainLabels and dfTest to obtain final training data frame
dfTrain <- cbind(dfTrainSubjects,dfTrainLabels,dfTrain)

## View final test data set created
View(dfTrain)

## Check the dimension of final training data (7352 rows and 563 columns)
dim(dfTrain)

## -------------------------------------------------------------------------------------------
## -------------------------------------------------------------------------------------------

## ---------------Section 4: Merge test and training Data-------------------------------------
## -------------------------------------------------------------------------------------------

## Merge the training and test data frames into single data frame
## This completes part 1 of the Project Assignment
dfData <- rbind(dfTest,dfTrain)

## check the dimensions of merged data set (10299 rows and 563 columns)
dim(dfData)

## View final test data set created
## (commented for final run, uncomment to view)
## View(dfTrain)

## --------------------------------------------------------------------------------------------
## --------------------------------------------------------------------------------------------

## -----------Section 5: Extract features data and name the column names of dfData ------------
## -----------with feature names.
## --------------------------------------------------------------------------------------------

## Create data from from features
dfFeatures <- read.table(FilePathFeatures,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## convert to table data frame
dfFeatures <- tbl_df(dfFeatures)

## check the dimensions of dfFeatures(561 rows and 2 columns)
dim(dfFeatures)

## View dfFeatures (commented for final run, uncomment to view)
## View(dfFeatures)

## Extract feature names from dfFeatures data frame
FeatureNames <- dfFeatures[,2]

## Convert FeatureNames data frame to list
FeatureNames <- as.list(FeatureNames)

## Add SubjectID and ActivityID as additional list element
## The purpose of this step is to create complete list of variable names
FeatureNames <- list("SubjectID", "ActivityID",FeatureNames)

## Unlist FeatureNames and coerce to character vector
FeatureNames <- as.character(unlist(FeatureNames))

## Check the length of Features vector to check that it matches the number of 
## variables in data frame dfData (563 variables)
length(FeatureNames)

## Rename the column names of dfData with the variable names
names(dfData)<- c(FeatureNames)

## View dfData
View(dfData)

## ---------------------------------------------------------------------------------------
## ---------------------------------------------------------------------------------------

## --------Section 6: Extract only measurements on mean and standard deviation------------
## ---------------------------------------------------------------------------------------

## Find the indexes of column names having mean values
## exclude values for meanFreq as we only need the variable values which are mean of the variable values
iMean <- grep("mean\\(",names(dfData))

#Find the indexes of column names having std values
iStd <- grep("std",names(dfData))

## Create vector of all indexes including 1st and 2nd columns (as SubjectID and ActivityID is to be included)
iExtract <- c(1:2,iMean,iStd)

## Extract data with column names having mean and std only
dfExtract <- dfData[,iExtract]

## Check the dimensions of Extracted Data frame
dim(dfExtract)

## View the extracted data
## This only contains Mean and Standard Deviation measurements and completes part 2 of
## Project Assignment (commented for final run, uncomment to view)
## View(dfExtract)

## -----------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------



## ---------Section 7: Adding descriptive activity names based on Activity list-------------
## --------- and also naming all column variable names       
## -----------------------------------------------------------------------------------------

## create data frame with Activity Names
dfActivityNames <- read.table(FilePathActivity,sep="",header = FALSE,quote="",stringsAsFactors = FALSE,na.strings = "NA")

## Convert to table data frame
dfActivityNames <- tbl_df(dfActivityNames)

## View Activity Data frame (commented for final run, uncomment to view)
## View(dfActivityNames)

## Replace with activity Names
dfExtract <- merge(dfExtract,dfActivityNames,by.x = "ActivityID",by.y = "V1",all = FALSE)

## View the dfExtractWithNames data frame (commented for final run, uncomment to view)
## View(dfExtract)

## Check the dimensions of dfExtract (10299 rows and 69 columns)
dim(dfExtract)

## select with reordered columns (make Activity Name as first column) and remove the ActivityID column
dfExtract <- select(dfExtract,c(69,2:68))

## rename first column as ActivityName
dfExtract <- rename(dfExtract,ActivityName=V2)

## View dfExtract
## this completes part 3 and 4 of Project assignment.
## The variable names have been named with corresponding feature names
## The activity ID's have been replaced with Activity Names
View(dfExtract)

## -----------------------------------------------------------------------------------------------
## -----------------------------------------------------------------------------------------------

## -----Section 8: creating independent Tidy data set containing average of each variable---------
## -----for each Activity and each Subject--------------------------------------------------------
## -----------------------------------------------------------------------------------------------

## group by data on Activity Name and Subject
## summarize with mean values for each variable
dfTidyGrpData <- dfExtract %>% group_by(ActivityName,SubjectID)%>%
                      summarise_each(funs(mean))

## Check dimension of grouped data
dim(dfTidyGrpData)

## Arrange data based on Subject ID
## The data frame contains each variable in separate column and each measurement is separate row
## and satisfies the definition of Tidy Data
dfTidyGrpData <- arrange(dfTidyGrpData,SubjectID,ActivityName)


## Write the tidy data set
## the TidyData.txt is created in working directory
write.table(dfTidyGrpData,"./TidyData.txt",row.names = FALSE)

## Uncomment and run below code to view TidyData created-----
## View(read.table("./TidyData.txt",header = TRUE))

## -----------------End of Project Assignment-------------------------------------------------------
## -------------------------------------------------------------------------------------------------

