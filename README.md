# GettingAndCleaningDataCourseProject

To run the file just run 'run_analysis.R' as an R script and make sure the 'getdata_projectfiles_UCI HAR Dataset' folder with files is in the same directory as the script. A file called 'tidy_data_set.txt' should be produced in the same directory.


The script works by:

Retrieving the data from the training and testing files, those being the files that store the sensor data, activity labels, and subject labels.

The train and testing data is then combined to full data files for each respective data file set.

Then the mean and standard deviation for the sensor data is found across each row and stored in the table.
The activity labels and converted and stored into the table.
The subject labels are stored into the table.

The table is then reduced to its necessary columns and aggreated by subject and activity with averaging on the mean and standard deviation.

The table is again reduced to its necessary columns and relabled to then be saved as a text file.
