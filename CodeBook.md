---
title: "CoolBook"
author: "Tanvi"
date: "6/5/2020"
output: word_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

**This contains description of the dataset. R Markdown document.**

Training data is in train folder 
Testing data is in test folder

Steps to Get Tidy data

1) Read train data
2) Read  test data 
3) Read features data
4) Read activity labels 
5) Assign all features column as column name to test and train data
6) Assign activityId as column name to train and test labels
7) Merge training and testing data
8) Extract the measurements for mean and standard deviation
9) Create vector for defining ID, mean and standard deviation
10) Using descriptive activity names to name the activity labels in the data set
11) Creating a new independent tidy data set 
12) Writing the data t0 a file

Variable names:
xtrain, ytrain, xtest, ytest, subject_train, subject_test, features, activity_labels, TRAIN, TEST, TOTAL, mean_and_std, setForMeanAndStd, setWithActivityNames, secTidySet