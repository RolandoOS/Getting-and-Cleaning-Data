## Functionality

The processing script (run_analysis.R) to process the Samsung Galaxy S data does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Operation

When "run_analysis.R" is sourced, it will automatically download and uncompress the data into the current working directory.

The script will print to the screen a description of the present working task.


## Output

There will be two output files saved into the working directory:

1. "Tidy_Data.txt": this file contains the tidy data for Parts 1-4.
2. "Tidy_Data_summary.txt": this file contains the tidy data for Part 5.
