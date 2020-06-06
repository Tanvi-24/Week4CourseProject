
setwd("C:\\Users\\HP\\Desktop\\Data Science\\Getting and cleaning data")

URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download the zip file 
download.file(URL, destfile = "dataset.zip", mode='wb')
setwd("C:\\Users\\HP\\Desktop\\Data Science\\Getting and cleaning data\\UCI HAR Dataset")

#Reading training sets - X_train.txt,Y_train.txt,subject_train.txt 
xtrain = read.table("train/X_train.txt",header = FALSE)
ytrain=read.table("train/Y_train.txt",header=FALSE)
subject_train<-read.table("train/subject_train.txt",header=FALSE)

#Reading testing sets - X_test.txt,Y_test.txt,subject_test.txt
x_test<-read.table("test/X_test.txt",header = FALSE)
xtest<-read.table("test/X_test.txt",header = FALSE)
ytest<-read.table("test/Y_test.txt",header = FALSE)
subject_test<-read.table("test/subject_test.txt",header = FALSE)

#Read features 
features<-read.table("features.txt",header=FALSE)

#Read activity_labels data
activity_labels<-read.table("activity_labels.txt",header = FALSE)

#Giving column names to training data using features 
colnames(xtrain)<-features[,2]
colnames(ytrain)<-"activityId"

#Giving column names to testing data using features
colnames(xtest)<-features[,2]
colnames(ytest)<-"activityId"

colnames(subject_train)<-"subjectId"
colnames(subject_test)<-"subjectId"
colnames(activity_labels)<-c("activityId","activityType")

#combining data to create a training dataset
TRAIN<-cbind(ytrain,subject_train,xtrain)

#combining data to create a testing dataset
TEST<-cbind(ytest,subject_test,xtest)

#Merging testing and training data
TOTAL<-rbind(TRAIN,TEST)

#storing colnames of TOTAL to a variable
colNames = colnames(TOTAL)

#Extract the measurement for only mean and standard deviation measurements
mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
setForMeanAndStd <- TOTAL[ , mean_and_std == TRUE]

#setting the descriptive names by activity labels
setWithActivityNames = merge(setForMeanAndStd, activity_labels, by='activityId', all.x=TRUE)

#creating new independent data for with average of each variable for each activity and each subject using aggregate function
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)

#writing the data to secTidySet.txt file
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)

secTidySet




