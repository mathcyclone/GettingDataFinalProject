# GettingDataFinalProject

 The data for this project originates from the Human Activity Recognition Using Smartphones Dataset Version 1.0 by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto at Smartlab - Non Linear Complex Systems Laboratory in DITEN - Università degli Studi di Genova (Via Opera Pia 11A, I-16145, Genoa, Italy; activityrecognition@smartlab.ws; www.smartlab.ws). They provided the following description of their data collection methods:
 
 "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ, 
- tGravityAcc-XYZ, 
- tBodyAccJerk-XYZ, 
- tBodyGyro-XYZ, 
- tBodyGyroJerk-XYZ, 
- tBodyAccMag, 
- tGravityAccMag, 
- tBodyAccJerkMag, 
- tBodyGyroMag, 
- tBodyGyroJerkMag, 
- fBodyAcc-XYZ, 
- fBodyAccJerk-XYZ, 
- fBodyGyro-XYZ, 
- fBodyAccMag,  
- fBodyAccJerkMag, 
- fBodyGyroMag, 
- fBodyGyroJerkMag" 

For each of these variables, the mean and standard deviation, along with other statistical measurements, were calculated for each sampling interval. Thus, this vector of the statistical measurements associated with the above variables for each sampling interval, separated into the test and training data, comprised the raw data for this project.

The runAnalysis.R script provided in this respository produces two tidy datasets from the messy dataset described above. The first, final_feature_data, provides the means and standard deviations of the feature data at each sampling interval from both the testing and training datasets in one table, with the associated subject and activity noted for each interval (and the columns labeled with the corresponding variables, unlike the raw data). The second tidy dataset that is produced, final_feature_averages, contains the averages of the data in final_feature_data separated by subject and activity.
