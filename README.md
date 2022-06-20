# Getting-and-Cleaning-Data-Course-Project
Project for the coursera course: Getting and Cleaning Data
==================================================================

Project by: Brendan Brogan
Based on : Human Activity Recognition Using Smartphones Data Set by UCI
Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
Original data link: archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Summary
==================================================================

This repository extracts the data from the "Human Activity Recognition Using Smartphones Data Set" from University of California Irvine. This was an experiment in which 30 subjects performed 6 different activites, walking on a flat surface, walking uphill, walking downhill, standing still, sitting, and laying down. The data was taken using a Samsung smartphone and the built in accelerometer and gyroscope. This data was split 30/70 into a test and train set. From this dataset, the following files were used in this project:
X_test, y_test, X_train, y_train, subject_test, subect_train, features, and activity_labels files were used to gather this data.

The only variables extracted from this set were measurements of the accelerometer and gyroscope. This includes the X, Y, and Z axis, with both the mean and standard deviation for each axis. This resulted in a total of 15 variables, which are explained in the Codebook.

The run.analysis.R script combines all of these files into a tidy dataset. The X_ files contained the data from all the features for each observation, the y_ files contains the activity for each observation, and the subject_ file contains the subect for each observation. The script merges each of these into the mergeddata file. The variable names were kept the same as in the original feature file. More detailed descriptions can be found in the codebook 

With the mergeddata dataset, the data was grouped by the activity performed and the subject performing the activity. From there, each variable was averaged to create the summarydata file. 

Files
==================================================================

The files included in this project are:

- Codebook.txt: The codebook contains more detailed information about the variables sed in the dataset. The variables are the same between the mergeddata and summarydata files. 
- run_analysis.R: This script creates the mergeddata and summarydata files from the original data.
- mergeddata.txt: This file contains the full data extracted from the expiriment, both the test and training set. This was used to create the summarydata set
- summarydata.txt: This file contains the average of each variable for every activity done by each subect.