Project for the coursera course: Getting and Cleaning Data
==================================================================

Title: Codebook
Author: Brendan Brogan
Date: 6/22/2022

==================================================================
Variable Information

- With the exception of subject and activity, all data is normalized fro -1 to 1

- subjcet - Identifies which subject the data came from. There were a total of 30 subjects
- activity - Identifies what the subject was doing whent he measurements were taken
    * Walking on a flat surface, walking uphill, walking downhill, standing, sitting, and laying

- There are several variables summarizing the data for acceleration and gyroscopic readings
- Each of these variables was measured accross the X, Y, and Z axis denoted as - X, - Y, and - Z respectively)
- The mean and standard deviation of each sample was evaluate (denoted as -mean() and -std() respectively)
- This results in a total of 6 variables per listed variable below

tBodyAcc - The acceleration of the body 
tGravityAcc - The acceleration due to gravity
tBodyAccJerk - The jerk acceleration of the body
tBodyGyro - The gyroscopic movement of the body
tBodyGyroJerk- The jerk acceleration of the gyroscopic motion

- These were the only variables removed from the dataset as these were the raw measurements, the rest were calculations performed on these

==================================================================
Data Extraction

- The data was extracted with the run_analysis.R script, broken into 5 sections
- Section 1: Getting the data
    * The data was downloaded from the UCI project webpage as a zip format
- Section 2: Establishing the objects within R
    * The data was read into r primarily by the read.table function
    * All of the data was read in, although most would later be cut out
- Section 3: Extracting the necessary data 
    * The mean and standard deviations of the measurements were extracted
    * The test and train datasets were then combined into one object
- Section 4: Formatting
    * The names were pulled from the original dataset and applied to the new data.frame
    * The activity variable was transformed from a numbered list to a descriptive factor
- Section 5: Exporting
    * Two files were exported by this script
    * mergeddata.txt contained all the data from all the observations
    * summarydata.txt contained only the average for each variable for each activity done by each subject