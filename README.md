# Getting and Cleaning Data


Here is a brief description of the steps I took in the run_analysis.R to clean the the data:
1. Get data that I used with the training data and the test data
2. Get the training data and rename the columns using the features file.  I then combined it with corresponding subject and activity_id for the training data
3. Get the test data and did the same as with the training data
4. Combine the two datasets together
5. Added the Activity description to the combined dataset instead of the activity_id
6. Created new dataset with columns of interest, i.e. Subject, Activity description and relevant research data (see the Code Book)
7. Grouped the data by subject and activity description
8. Calculated the average for all of the relevant variables for each subject and each activity description
9. Saved the result to a file “CleanMean.txt” in the working directory
