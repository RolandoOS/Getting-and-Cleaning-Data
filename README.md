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

The "run_analysis.R" script uses the `dplyr` library almost exclusively to process and tidy the data.

## Output

There will be two output files saved into the working directory:

1. "Tidy_Data.txt": this file contains the tidy data for Parts 1-4.
2. "Tidy_Data_summary.txt": this file contains the tidy data for Part 5.

## Part 0. Download and extract data

In this section we download the data from:

`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

and it's saved into the file Dataset.zip; it is uncompressed using the unzip method. The test data resides in the `./UCI HAR Dataset/test` directory, the train data in `./UCI HAR Dataset/test`.

## Part 1. Merge the training and the test sets to create one data set.

In this section, using the `read.csv()` we open the files:

* `./UCI HAR Dataset/features.txt`
* `./UCI HAR Dataset/train/X_train.txt`
* `./UCI HAR Dataset/test/X_test.txt`
* `./UCI HAR Dataset/train/subject_train.txt`
* `./UCI HAR Dataset/test/subject_test.txt`
* `./UCI HAR Dataset/train/y_train.txt`
* `./UCI HAR Dataset/test/y_test.txt`

The files are converted into data frame tbl using `tbl_df()` for further manipulation with `dplyr` and `tidyr`. We combine the training and test variables into temporary variables "aux_train" and "aux_test" respectively using `select()` and `mutate()`. We also create a label "test" and "train" to differentiate the types of runs in the final dataset.

We combine the temporary test and train sets using the `bind_rows()` method. We assign the variables the specified names in the `features` variable. We found there are duplicate features; since these features are not mean() or std() we removed the duplicates.

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

We extract the features that have the strings `mean()` and `std()` using the dyplr `contains()` method.

## 3. Use descriptive activity names to name the activities in the data set.

Using the dyplr `mutate()` method along with `replace()`, we change the numeric labels for the activities with the actual names as specified in the "activity_labels.txt" file.

## 4. Appropriately labels the data set with descriptive variable names. 

We assign more descriptive names to the features of the data set using `gsub()`. We also remove the parenthesis from the names, as they were interfering with the later `mean()` operations.

We also sort the data frame by subject and activity using the `arrange()` method.

This final tidy data frame is saved into the file "Tidy_Data.txt”.

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Using the `group_by()`, `select()`, and `summarise_each()` methods we calculate the mean of the mean measurements grouped by subject and activity. We do not include the mean of the standard deviation measurements.

This independent tidy data frame is saved into the file "Tidy_Data_summary.txt”.
