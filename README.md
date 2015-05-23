## Getting & Cleaning Data course project
This repo contains file submissions for the course project of "Getting and Cleaning Data" session 14 

### Contents of this README file
* 1. Repository Contents
* 2. File Descriptions
* 3. Original Coursera Project Directions

### Contents of this repository
* Codebook.md
* run_analysis.R
* README.md
* tidydata.txt

### File Descriptions
`Codebook.md` contains information regarding variables and the transformations to the dataset done by run_analysis.R

`run_analysis.R` is a script that does the following
* downloads and extracts the UCI HAR dataset if necessary
* creates a dataframe that merges test & training sets
* adds & fixes labels
* extracts columns relating to mean and standard deviation
* creates a tidydataset.txt file that is a new dataset containing averages for each variable for each subject

`tidydata.txt` is the tidy data set created from the run_analysis.R script

### Original project directions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 
* 1) a tidy data set as described below 
* 2) a link to a Github repository with your script for performing the analysis
* 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.