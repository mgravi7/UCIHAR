# UCI Human Activity Data Analysis
This codebook explains the tidy data created based on raw data from
[UCI Machine Learning site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
You can read this [fun article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)
to understand more about the trends in wearable computing and the role of data in this.

List of data sets:
* HAR_Data
* activity_labels

## activity_labels data set
The following table shows the activities for which measurements were made.
You can read more about the experiment and how raw data was created in the
*Background on experiment and raw data creation* section.

index | activityNames
----- | -------------
1 | walking
2 | walking.upstairs
3 | walking.downstairs
4 | sitting
5 | standing
6 | laying

## HAR_Data data set
This data contains 68 features.
* The first feature is *activity* (as described in the above section).
* The second feature is *subject*. In order to maintain anonimity, subjects are given an identifier from 1 to 30.
No more information is available about the subjects.
* All the features from 3 to 68 are all values that are grouped by activity and subject. **All the values are mean
of the observations from the raw data.** From the 561 features in the raw data, only features that are mean and
standard deviation (total of 66) are chosen for HAR_Data.
  * Time domain signals (prefix *timeDomain*) were captured at a constant rate of 50 Hz.
Then, they were filtered using a median filter and a 3rd order low pass Butterworth filter with a
corner frequency of 20 Hz to remove noise.
  * Frequency domain signals (prefix *frequencyDomain*) were obtained by applying Fast Fourier Transform (FFT)
  * *Accelerometer* and *Gyroscope* 3-axial raw signals (split into x, y and z axis) are the source of signal data.
  * *Accelerometer* signal was split into *body* and *gravity* signals using another low pass Butterworth filter with a
corner frequency of 0.3 Hz.
  * The first *mean* indicates the mean was taken from raw inertial signals
  * The first *standard deviation* indicates the standard deviation was taken from raw inertial signals
  * Body linear acceleration and angular velocity were derived in time to obtain *Jerk* signals.
Also the *magnitude* of these three-dimensional signals were calculated using the Euclidean norm.

List of features:
1. *activity*                                                                       
2. *subject*                                                                        
3. *timeDomain.bodyAccelerometerSignal.x.mean.mean*                                 
4. *timeDomain.bodyAccelerometerSignal.y.mean.mean*                                 
5. *timeDomain.bodyAccelerometerSignal.z.mean.mean*                                 
6. *timeDomain.bodyAccelerometerSignal.x.standardDeviation.mean*                    
7. *timeDomain.bodyAccelerometerSignal.y.standardDeviation.mean*                    
8. *timeDomain.bodyAccelerometerSignal.z.standardDeviation.mean*                    
9. *timeDomain.gravityAccelerometerSignal.x.mean.mean*                              
10. *timeDomain.gravityAccelerometerSignal.y.mean.mean*                              
11. *timeDomain.gravityAccelerometerSignal.z.mean.mean*                              
12. *timeDomain.gravityAccelerometerSignal.x.standardDeviation.mean*                 
13. *timeDomain.gravityAccelerometerSignal.y.standardDeviation.mean*                 
14. *timeDomain.gravityAccelerometerSignal.z.standardDeviation.mean*                 
15. *timeDomain.bodyAccelerometerJerkSignal.x.mean.mean*                             
16. *timeDomain.bodyAccelerometerJerkSignal.y.mean.mean*                             
17. *timeDomain.bodyAccelerometerJerkSignal.z.mean.mean*                             
18. *timeDomain.bodyAccelerometerJerkSignal.x.standardDeviation.mean*                
19. *timeDomain.bodyAccelerometerJerkSignal.y.standardDeviation.mean*                
20. *timeDomain.bodyAccelerometerJerkSignal.z.standardDeviation.mean*                
21. *timeDomain.bodyGyroscopeSignal.x.mean.mean*                                     
22. *timeDomain.bodyGyroscopeSignal.y.mean.mean*                                     
23. *timeDomain.bodyGyroscopeSignal.z.mean.mean*                                     
24. *timeDomain.bodyGyroscopeSignal.x.standardDeviation.mean*                        
25. *timeDomain.bodyGyroscopeSignal.y.standardDeviation.mean*                        
26. *timeDomain.bodyGyroscopeSignal.z.standardDeviation.mean*                        
27. *timeDomain.bodyGyroscopeJerkSignal.x.mean.mean*                                 
28. *timeDomain.bodyGyroscopeJerkSignal.y.mean.mean*                                 
29. *timeDomain.bodyGyroscopeJerkSignal.z.mean.mean*                                 
30. *timeDomain.bodyGyroscopeJerkSignal.x.standardDeviation.mean*                    
31. *timeDomain.bodyGyroscopeJerkSignal.y.standardDeviation.mean*                    
32. *timeDomain.bodyGyroscopeJerkSignal.z.standardDeviation.mean*                    
33. *timeDomain.bodyAccelerometerMagnitudeSignal.mean.mean*                          
34. *timeDomain.bodyAccelerometerMagnitudeSignal.standardDeviation.mean*             
35. *timeDomain.gravityAccelerometerMagnitudeSignal.mean.mean*                       
36. *timeDomain.gravityAccelerometerMagnitudeSignal.standardDeviation.mean*          
37. *timeDomain.bodyAccelerometerJerkMagnitudeSignal.mean.mean*                      
38. *timeDomain.bodyAccelerometerJerkMagnitudeSignal.standardDeviation.mean*         
39. *timeDomain.bodyGyroscopeMagnitudeSignal.mean.mean*                              
40. *timeDomain.bodyGyroscopeMagnitudeSignal.standardDeviation.mean*                 
41. *timeDomain.bodyGyroscopeJerkMagnitudeSignal.mean.mean*                          
42. *timeDomain.bodyGyroscopeJerkMagnitudeSignal.standardDeviation.mean*             
43. *frequencyDomain.bodyAccelerometerSignal.x.mean.mean*                            
44. *frequencyDomain.bodyAccelerometerSignal.y.mean.mean*                            
45. *frequencyDomain.bodyAccelerometerSignal.z.mean.mean*                            
46. *frequencyDomain.bodyAccelerometerSignal.x.standardDeviation.mean*               
47. *frequencyDomain.bodyAccelerometerSignal.y.standardDeviation.mean*               
48. *frequencyDomain.bodyAccelerometerSignal.z.standardDeviation.mean*               
49. *frequencyDomain.bodyAccelerometerJerkSignal.x.mean.mean*                        
50. *frequencyDomain.bodyAccelerometerJerkSignal.y.mean.mean*                        
51. *frequencyDomain.bodyAccelerometerJerkSignal.z.mean.mean*                        
52. *frequencyDomain.bodyAccelerometerJerkSignal.x.standardDeviation.mean*           
53. *frequencyDomain.bodyAccelerometerJerkSignal.y.standardDeviation.mean*           
54. *frequencyDomain.bodyAccelerometerJerkSignal.z.standardDeviation.mean*           
55. *frequencyDomain.bodyGyroscopeSignal.x.mean.mean*                                
56. *frequencyDomain.bodyGyroscopeSignal.y.mean.mean*                                
57. *frequencyDomain.bodyGyroscopeSignal.z.mean.mean*                                
58. *frequencyDomain.bodyGyroscopeSignal.x.standardDeviation.mean*                   
59. *frequencyDomain.bodyGyroscopeSignal.y.standardDeviation.mean*                   
60. *frequencyDomain.bodyGyroscopeSignal.z.standardDeviation.mean*                   
61. *frequencyDomain.bodyAccelerometerMagnitudeSignal.mean.mean*                     
62. *frequencyDomain.bodyAccelerometerMagnitudeSignal.standardDeviation.mean*        
63. *frequencyDomain.bodyBodyAccelerometerJerkMagnitudeSignal.mean.mean*             
64. *frequencyDomain.bodyBodyAccelerometerJerkMagnitudeSignal.standardDeviation.mean*
65. *frequencyDomain.bodyBodyGyroscopeMagnitudeSignal.mean.mean*                     
66. *frequencyDomain.bodyBodyGyroscopeMagnitudeSignal.standardDeviation.mean*        
67. *frequencyDomain.bodyBodyGyroscopeJerkMagnitudeSignal.mean.mean*                 
68. *frequencyDomain.bodyBodyGyroscopeJerkMagnitudeSignal.standardDeviation.mean*  

## Background on experiment and raw data creation
All the information in this section has been compiled from the documentation found in the downloaded zip file.
### Acknowlegment
    Human Activity Recognition Using Smartphones
    Dataset Version 1.0

    Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
    DITEN - Universita degli Studi di Genova.
    Via Opera Pia 11A, I-16145, Genoa, Italy.

    activityrecognition@smartlab.ws
    www.smartlab.ws

### Experiments
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and
30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into
body acceleration and gravity. The gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Feature selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of
20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern
('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean