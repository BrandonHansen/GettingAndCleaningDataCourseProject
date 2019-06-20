The variables in the program are divided by the processes they are used to represent.

wd
Represents the working directory for the files.

x_train, y_train, s_train, x_test, y_test, s_test 
Represent the files paths for the desired files.

train_labels, train_set, train_subjects, test_labels, test_set, test_subjects 
Are used to store the unporcessed data from the motion sensor files that represent that sensor data, activity, and participant respectiviely.

name_activity
Is a processing function for the transforming a given number to activity name.

full_data_set, full_data_labels, full_data_subjects
Combines the train and test files for each data collection into a single file.

After these processes the mean and standared deviation are calculated and stored in new columns for each row in full_data_set.
The activity names is determined from full_data_labels and stored in a new column for full_data_set.
The subjects from full_data_subjects are stored in a new column for full_data_set.

data_set
The desired columns from full_data_set are stored into data_set.

tidy_data_set
The mean for each subject and there activity is found through aggregation for mean and standard deviation in data_set.

The tidy_data_set is then reduced to it's necessary columns and has its columns renamed.
The file is then written to a text file.
