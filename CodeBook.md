## Identification Fields

* `subject` - The participant ("subject") ID. Values: 1-30.
* `activity` - The label of the activity performed when the corresponding measurements were taken: (1) `WALKING`, (2) `WALKING_UPSTAIRS`, (3) `WALKING_DOWNSTAIRS`, (4) `SITTING`, (5) `STANDING`, (6) `LAYING`.
* `run`: test or train.

## Features in tidy data set:

* `Time-BodyAccelerometer-MEAN-X`
* `Time-BodyAccelerometer-MEAN-Y`
* `Time-BodyAccelerometer-MEAN-Z`
* `Time-GravityAccelerometer-MEAN-X`
* `Time-GravityAccelerometer-MEAN-Y`
* `Time-GravityAccelerometer-MEAN-Z`
* `Time-BodyAccelerometerJerk-MEAN-X`
* `Time-BodyAccelerometerJerk-MEAN-Y`
* `Time-BodyAccelerometerJerk-MEAN-Z`
* `Time-BodyGyroscope-MEAN-X`
* `Time-BodyGyroscope-MEAN-Y`
* `Time-BodyGyroscope-MEAN-Z`
* `Time-BodyGyroscopeJerk-MEAN-X`
* `Time-BodyGyroscopeJerk-MEAN-Y`
* `Time-BodyGyroscopeJerk-MEAN-Z`
* `Time-BodyAccelerometerMagnitude-MEAN`
* `Time-GravityAccelerometerMagnitude-MEAN`
* `Time-BodyAccelerometerJerkMagnitude-MEAN`
* `Time-BodyGyroscopeMagnitude-MEAN`
* `Time-BodyGyroscopeJerkMagnitude-MEAN`
* `Frequency-BodyAccelerometer-MEAN-X`
* `Frequency-BodyAccelerometer-MEAN-Y`
* `Frequency-BodyAccelerometer-MEAN-Z`
* `Frequency-BodyAccelerometerJerk-MEAN-X`
* `Frequency-BodyAccelerometerJerk-MEAN-Y`
* `Frequency-BodyAccelerometerJerk-MEAN-Z`
* `Frequency-BodyGyroscope-MEAN-X`
* `Frequency-BodyGyroscope-MEAN-Y`
* `Frequency-BodyGyroscope-MEAN-Z`
* `Frequency-BodyAccelerometerMagnitude-MEAN`
* `Frequency-BodyBodyAccelerometerJerkMagnitude-MEAN`
* `Frequency-BodyBodyGyroscopeMagnitude-MEAN`
* `Frequency-BodyBodyGyroscopeJerkMagnitude-MEAN`
* `Time-BodyAccelerometer-SD-X`
* `Time-BodyAccelerometer-SD-Y`
* `Time-BodyAccelerometer-SD-Z`
* `Time-GravityAccelerometer-SD-X`
* `Time-GravityAccelerometer-SD-Y`
* `Time-GravityAccelerometer-SD-Z`
* `Time-BodyAccelerometerJerk-SD-X`
* `Time-BodyAccelerometerJerk-SD-Y`
* `Time-BodyAccelerometerJerk-SD-Z`
* `Time-BodyGyroscope-SD-X`
* `Time-BodyGyroscope-SD-Y`
* `Time-BodyGyroscope-SD-Z`
* `Time-BodyGyroscopeJerk-SD-X`
* `Time-BodyGyroscopeJerk-SD-Y`
* `Time-BodyGyroscopeJerk-SD-Z`
* `Time-BodyAccelerometerMagnitude-SD`
* `Time-GravityAccelerometerMagnitude-SD`
* `Time-BodyAccelerometerJerkMagnitude-SD`
* `Time-BodyGyroscopeMagnitude-SD`
* `Time-BodyGyroscopeJerkMagnitude-SD`
* `Frequency-BodyAccelerometer-SD-X`
* `Frequency-BodyAccelerometer-SD-Y`
* `Frequency-BodyAccelerometer-SD-Z`
* `Frequency-BodyAccelerometerJerk-SD-X`
* `Frequency-BodyAccelerometerJerk-SD-Y`
* `Frequency-BodyAccelerometerJerk-SD-Z`
* `Frequency-BodyGyroscope-SD-X`
* `Frequency-BodyGyroscope-SD-Y`
* `Frequency-BodyGyroscope-SD-Z`
* `Frequency-BodyAccelerometerMagnitude-SD`
* `Frequency-BodyBodyAccelerometerJerkMagnitude-SD`
* `Frequency-BodyBodyGyroscopeMagnitude-SD`
* `Frequency-BodyBodyGyroscopeJerkMagnitude-SD`

## From the features explanation file:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
