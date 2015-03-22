# Getting and Cleaning Data


When doing this project I decided to do it in the following order:

1. Get the training data and rename the columns using the features file.  I then combined it with corresponding subject and activity_id
2. Get the test data and did the same as with the training data
3. Combine the two datasets together
4. Added the Activity description to the combined dataset
5. Created new dataset with columns of interest, i.e. Subject, Activity description and relevant research data (see the Code Book)
6. Grouped the data by subject and activity description
7. Calculated the average for all of the relevant variables for each subject and each activity description
8. Saved the result to a file “CleanMean.txt” in the working directory
