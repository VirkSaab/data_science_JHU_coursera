# Getting and Cleaning Data Course Project

## Overview from the submission page
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The goal of this project
This project creates a new tidy data given the original data above. The final output is in the file named `tidy_dataset.csv`. This new dataset contains the average of each measurement for each activity of each subject. These measurements are the mean and standard deviation estimates of accelerometer and gyroscope 3-axial raw signals. Please refer CodeBook.md for more feature information.

### Code:
- The code for creating the new dataset from given dataset is in `run_analysis.R`.
- Type `Rscript run_analysis.R` in terminal to run the code or use Rstudio.
