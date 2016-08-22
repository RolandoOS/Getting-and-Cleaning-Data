print("Getting and Cleaning Data - Project")

ptm = proc.time()

print("Loading libraries: dplyr, tidyr...")

library(dplyr)
library(tidyr)

# 0. Download and extract data.

print("Downloading Files...")

#setwd("/Users/developer3/Desktop/JHU_DS_Cert/3_Getting_Data/Project/")

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f = file.path(getwd(), "Dataset.zip")
download.file(url, f)

#list.files()

unzip("Dataset.zip")

# 1. Merge the training and the test sets to create one data set. ----

print("Extracting Data...")

features <- tbl_df(read.csv("./UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE, sep=""))

X_train <- tbl_df(read.csv("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep=""))
X_test  <- tbl_df(read.csv("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep=""))

subject_train <- tbl_df(read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)) %>% select(subjects=V1)
subject_test  <- tbl_df(read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE))   %>% select(subjects=V1)

y_train <- tbl_df(read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE)) %>% select(activities=V1)
y_test  <- tbl_df(read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE))   %>% select(activities=V1)

aux_train <- mutate(X_train, subject=subject_train$subjects, activity=y_train$activities, run = 'train') %>%
  select(subject, activity, run, starts_with("V"))

aux_test <- mutate(X_test, subject=subject_test$subjects, activity=y_test$activities, run = 'test') %>%
  select(subject, activity, run, starts_with("V"))

print("Merging the training and testing data sets.")

Data_0 <- bind_rows(aux_test, aux_train)

print("Naming variables with feature names.")

names(Data_0)[4:564] <- features$V2 #as.list()

print("Cleaning work space.")

rm(list=setdiff(ls(), c("ptm", "Data_0")))

print("Removing duplicate variables.")

Data_1 <- Data_0[ , !duplicated(colnames(Data_0))]

# 2. Extract only the measurements on the mean and standard deviation for each measurement. ----

print("Extracting mean and standard deviation of measurements.")

Data_1 <- Data_1 %>% select(subject, activity, run, contains("mean()") , contains("std()"))

# 3. Use descriptive activity names to name the activities in the data set. ----

# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

print("Assigning descriptive activities names.")

Data_1 <- Data_1 %>% mutate(activity = replace(activity, activity==1, "WALKING")) %>%
  mutate(activity = replace(activity, activity==2, "WALKING_UPSTAIRS")) %>%
  mutate(activity = replace(activity, activity==3, "WALKING_DOWNSTAIRS")) %>%
  mutate(activity = replace(activity, activity==4, "SITTING")) %>%
  mutate(activity = replace(activity, activity==5, "STANDING")) %>%
  mutate(activity = replace(activity, activity==6, "LAYING"))

# 4. Appropriately label the data set with descriptive variable names. ----

print("Assigning descriptive feature names.")

names(Data_1) <- gsub("Acc", "Accelerometer", names(Data_1))
names(Data_1) <- gsub("Mag", "Magnitude", names(Data_1))
names(Data_1) <- gsub("Gyro", "Gyroscope", names(Data_1))
names(Data_1) <- gsub("Body", "Body", names(Data_1))
names(Data_1) <- gsub("^t", "Time-", names(Data_1))
names(Data_1) <- gsub("^f", "Frequency-", names(Data_1))
names(Data_1) <- gsub("mean\\(\\)", "MEAN", names(Data_1))
names(Data_1) <- gsub("std\\(\\)", "SD", names(Data_1))

print("Writing tidy Dataset Output: Tidy_Data_1.txt")
write.table(Data_1, file = "./Tidy_Data.txt", row.names = FALSE)

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. ----

Data_2 <- Data_1 %>% group_by(subject, activity) %>% select(subject, activity, contains("MEAN"))  %>%
  summarise_each(funs(mean(., na.rm = TRUE)))

print("Writing summary  tidy Dataset Output: Tidy_Data_1.txt")

write.table(Data_2, file = "./Tidy_Data_summary.txt", row.names = FALSE)

ftm = proc.time() - ptm

print("Run time:"); print(ftm)
