####################################################################
# We need to have the working directory point to "UCI HAR Dataset"
####################################################################
setwd("H:/My Documents/Coursera/03 Getting and Cleaning Data/UCI HAR Dataset")


####################################################################
# Read features and activity that will be used for both training and test
####################################################################
# Read the 561 features
features = read.table("./features.txt", header = FALSE, sep = "")

# Read the 6 different Activities
activity = read.table("./activity_labels.txt", header = FALSE, sep = "")
names(activity) <- c("activity_id", "activity")


####################################################################
# Training set
####################################################################
# Read the subject that are in the training set and name the columns
subject_train = read.table("./train/subject_train.txt", header = FALSE, sep = "")
names(subject_train) <- "subject"

# Read the activities that are in the training set and name the columns
activity_train = read.table("./train/y_train.txt", header = FALSE, sep = "")
names(activity_train) <- "activity_id"

# Read the training data and name the columns
X_train = read.table("./train/x_train.txt", header = FALSE, sep = "")
names(X_train) <- features[ , 2]

# create id for each row and mark it as Train
id <- c(1:nrow(X_train))
TestTrain <- rep("Train", nrow(X_train))

# bind the vectors together into one train data.frame
train_clean <- cbind(TestTrain, id, subject_train, activity_train, X_train)


####################################################################
# Test set
####################################################################
# Read the subjects that are in the test set and name the columns
subject_test = read.table("./test/subject_test.txt", header = FALSE, sep = "")
names(subject_test) <- "subject"

# Read the activities that are in the test set and name the columns
activity_test = read.table("./test/y_test.txt", header = FALSE, sep = "")
names(activity_test) <- "activity_id"

# Read the test and name the columns
X_test = read.table("./test/x_test.txt", header = FALSE, sep = "")
names(X_test) <- features[ , 2]

# create id for each row and mark it as Test
id <- c(1:nrow(X_test))
TestTrain <- rep("Test", nrow(X_test))

# bind the vectors together into one test data.frame
test_clean <- cbind(TestTrain, id, subject_test, activity_test, X_test)


##########################################################################
# combine the the train and test data.frames together 
# and merge with activity so we gate the Activity description
##########################################################################
combined <- rbind(test_clean, train_clean)
combined <- merge(activity, combined)


##########################################################################
# Hand pick the columns we need:
#      - Subject and activity description
#      - All columns that have "mean()" in the name
#      - All columns that have "std()" in the name
#      - The last 6 columns that end with "gravityMean"
##########################################################################
clean <- combined[ , c(2, 5, 46:51, 86:91, 126:131, 166:171, 206:207, 
                       219:220, 232:233, 245:246, 258:259, 271:276, 350:355, 
                       429:434, 508:509, 521:522, 534:535, 547:548, 561:566)]


###############################################################################
# Group the data by subject and activity and calculate the mean for each column
###############################################################################
clean_mean <- group_by(clean, subject, activity)
clean_mean <-  summarise_each(clean_mean, funs(mean))


###############################################################################
# Write the resulting data.frame to a file called CleanMean.txt
###############################################################################
write.table(clean_mean, file = "./CleanMean.txt", sep = " ", col.names = TRUE,  row.name=FALSE)
