####################################################################################################
##STEP 0. loading packages, getting & reading files
####################################################################################################

##loading plyr
library(plyr)

##getting & unzipping the file if necessary and setting working directory
if (file.exists("./UCI HAR Dataset")==FALSE){
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl, destfile = "getdatazip.zip", method="curl")
    unzip("getdatazip.zip")
}

##reading in test, train, feature, & label files
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

####################################################################################################
##STEP 1. Merging datasets to create one data set
####################################################################################################

##merging xdata, ydata, & subject data
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
subdata <- rbind(subtrain, subtest)

##adding variable names
names(subdata) <- "subject"
names(ydata) <- "activity"
names(xdata) <- features$V2

##merging into one data frame
data <- cbind(xdata, cbind(subdata, ydata))

####################################################################################################
##STEP 2. Extracting mean and median measurements
####################################################################################################

#grabbing only the columns with mean() or std()
vect <- grep("-(mean|std)\\(\\)", features[,2])

## subsetting
datasub <- subset(data, data[,vect] & data$subject & data$activity)

####################################################################################################
##STEP 3. Descriptive activity names
####################################################################################################

##using the activity_labels.txt file to assign names
datasub$activity <- labels[datasub$activity,2]

####################################################################################################
##STEP 4. Descriptive variable names
####################################################################################################

##this step has been already completed through the process

####################################################################################################
##STEP 5. Tidy data set with average of each variable
####################################################################################################

tidydata <- ddply(.data=datasub, .variables=c("subject","activity"), .fun=numcolwise(mean))
write.table(tidydata, file="tidydata.txt",row.name=FALSE)
