Codebook
---
author: Nikhil 
Created on date and Time: 2016-07-02 00:34:28

Variable name    | Description
-----------------|-----------------------------
subject          | ID the subject who performed the activity.
activity         | Activity name
ftdomain       	 | Feature: Time domain signal or frequency domain signal
ftdevice         | Feature: Measuring instrument - accelerometer or gyroscope
ftacceltype      | Feature: Acceleration signal - body or gravity
ftmeasure        | Feature: Mean or Standard Deviation
ftjerk           | Feature: Jerk signal
ftmag            | Feature: Magnitude of the signals
ftaxis           | Feature: 3 - axial signals in the X, Y and Z directions
mean		     | Feature: Average of each variable for each activity and each subject

***

Key variables in the data table
----------------------------------------


```
## [1] "subject"     "activity"    "ftdomain"    "ftacceltype" "ftdevice"   
## [6] "ftjerk"      "ftmag"       "ftmeasure"   "ftaxis"
```

***

Summary of variables in Tidy Data
---------------------------------


```
##     subject                   activity    ftdomain     ftacceltype  
##  1      : 396   LAYING            :1980   time:7200   NA     :4680  
##  2      : 396   SITTING           :1980   freq:4680   body   :5760  
##  3      : 396   STANDING          :1980               gravity:1440  
##  4      : 396   WALKING           :1980                             
##  5      : 396   WALKING_DOWNSTAIRS:1980                             
##  6      : 396   WALKING_UPSTAIRS  :1980                             
##  (Other):9504                                                       
##           ftdevice     ftjerk           ftmag      ftmeasure   ftaxis   
##  accelerometer:7200   NA  :7200   NA       :8640   mean:5940   NA:3240  
##  gyroscope    :4680   jerk:4680   magnitude:3240   std :5940   X :2880  
##                                                                Y :2880  
##                                                                Z :2880  
##                                                                         
##                                                                         
##                                                                         
##   mean(value)      
##  Min.   :-0.99767  
##  1st Qu.:-0.96205  
##  Median :-0.46989  
##  Mean   :-0.48436  
##  3rd Qu.:-0.07836  
##  Max.   : 0.97451  
## 
```

***

Tidy Data structure
-----------------


```
## Classes 'grouped_dt', 'tbl_dt', 'tbl', 'tbl_dt', 'tbl', 'data.table' and 'data.frame':	11880 obs. of  10 variables:
##  $ subject    : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ activity   : Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ ftdomain   : Factor w/ 2 levels "time","freq": 1 1 1 1 1 1 1 1 1 1 ...
##  $ ftacceltype: Factor w/ 3 levels NA,"body","gravity": 1 1 1 1 1 1 1 1 1 1 ...
##  $ ftdevice   : Factor w/ 2 levels "accelerometer",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ ftjerk     : Factor w/ 2 levels NA,"jerk": 1 1 1 1 1 1 1 1 2 2 ...
##  $ ftmag      : Factor w/ 2 levels NA,"magnitude": 1 1 1 1 1 1 2 2 1 1 ...
##  $ ftmeasure  : Factor w/ 2 levels "mean","std": 1 1 1 2 2 2 1 2 1 1 ...
##  $ ftaxis     : Factor w/ 4 levels NA,"X","Y","Z": 2 3 4 2 3 4 1 1 2 3 ...
##  $ mean(value): num  -0.0166 -0.0645 0.1487 -0.8735 -0.9511 ...
##  - attr(*, "sorted")= chr  "subject" "activity" "ftdomain" "ftacceltype" ...
##  - attr(*, ".internal.selfref")=<externalptr> 
##  - attr(*, "vars")=List of 8
##   ..$ : symbol subject
##   ..$ : symbol activity
##   ..$ : symbol ftdomain
##   ..$ : symbol ftacceltype
##   ..$ : symbol ftdevice
##   ..$ : symbol ftjerk
##   ..$ : symbol ftmag
##   ..$ : symbol ftmeasure
```

***

Display a few random rows of the dataset
------------------------------

Random rows generated : 

```
##  [1] 8420 5199 2376 9111 6095  531 8311 7675  499 1277
```

```
## Source: local data table [10 x 10]
## Groups: 
## 
##    subject         activity ftdomain ftacceltype      ftdevice ftjerk
##     (fctr)           (fctr)   (fctr)      (fctr)        (fctr) (fctr)
## 1       22          SITTING     time     gravity accelerometer     NA
## 2       14           LAYING     freq        body accelerometer     NA
## 3        6 WALKING_UPSTAIRS     freq        body accelerometer   jerk
## 4       24           LAYING     time          NA     gyroscope     NA
## 5       16         STANDING     time        body accelerometer     NA
## 6        2         STANDING     time          NA     gyroscope     NA
## 7       21 WALKING_UPSTAIRS     freq        body accelerometer   jerk
## 8       20         STANDING     time        body accelerometer     NA
## 9        2          SITTING     time     gravity accelerometer     NA
## 10       4          SITTING     time        body accelerometer     NA
## Variables not shown: ftmag (fctr), ftmeasure (fctr), ftaxis (fctr),
##   mean(value) (dbl)
```
***

Feature Combinations
--------------------


```
##    ftdomain ftacceltype      ftdevice ftjerk     ftmag ftmeasure ftaxis
## 1      time        <NA>     gyroscope   <NA>      <NA>      mean      X
## 2      time        <NA>     gyroscope   <NA>      <NA>      mean      Y
## 3      time        <NA>     gyroscope   <NA>      <NA>      mean      Z
## 4      time        <NA>     gyroscope   <NA>      <NA>       std      X
## 5      time        <NA>     gyroscope   <NA>      <NA>       std      Y
## 6      time        <NA>     gyroscope   <NA>      <NA>       std      Z
## 7      time        <NA>     gyroscope   <NA> magnitude      mean   <NA>
## 8      time        <NA>     gyroscope   <NA> magnitude       std   <NA>
## 9      time        <NA>     gyroscope   jerk      <NA>      mean      X
## 10     time        <NA>     gyroscope   jerk      <NA>      mean      Y
## 11     time        <NA>     gyroscope   jerk      <NA>      mean      Z
## 12     time        <NA>     gyroscope   jerk      <NA>       std      X
## 13     time        <NA>     gyroscope   jerk      <NA>       std      Y
## 14     time        <NA>     gyroscope   jerk      <NA>       std      Z
## 15     time        <NA>     gyroscope   jerk magnitude      mean   <NA>
## 16     time        <NA>     gyroscope   jerk magnitude       std   <NA>
## 17     time        body accelerometer   <NA>      <NA>      mean      X
## 18     time        body accelerometer   <NA>      <NA>      mean      Y
## 19     time        body accelerometer   <NA>      <NA>      mean      Z
## 20     time        body accelerometer   <NA>      <NA>       std      X
## 21     time        body accelerometer   <NA>      <NA>       std      Y
## 22     time        body accelerometer   <NA>      <NA>       std      Z
## 23     time        body accelerometer   <NA> magnitude      mean   <NA>
## 24     time        body accelerometer   <NA> magnitude       std   <NA>
## 25     time        body accelerometer   jerk      <NA>      mean      X
## 26     time        body accelerometer   jerk      <NA>      mean      Y
## 27     time        body accelerometer   jerk      <NA>      mean      Z
## 28     time        body accelerometer   jerk      <NA>       std      X
## 29     time        body accelerometer   jerk      <NA>       std      Y
## 30     time        body accelerometer   jerk      <NA>       std      Z
## 31     time        body accelerometer   jerk magnitude      mean   <NA>
## 32     time        body accelerometer   jerk magnitude       std   <NA>
## 33     time     gravity accelerometer   <NA>      <NA>      mean      X
## 34     time     gravity accelerometer   <NA>      <NA>      mean      Y
## 35     time     gravity accelerometer   <NA>      <NA>      mean      Z
## 36     time     gravity accelerometer   <NA>      <NA>       std      X
## 37     time     gravity accelerometer   <NA>      <NA>       std      Y
## 38     time     gravity accelerometer   <NA>      <NA>       std      Z
## 39     time     gravity accelerometer   <NA> magnitude      mean   <NA>
## 40     time     gravity accelerometer   <NA> magnitude       std   <NA>
## 41     freq        <NA>     gyroscope   <NA>      <NA>      mean      X
## 42     freq        <NA>     gyroscope   <NA>      <NA>      mean      Y
## 43     freq        <NA>     gyroscope   <NA>      <NA>      mean      Z
## 44     freq        <NA>     gyroscope   <NA>      <NA>       std      X
## 45     freq        <NA>     gyroscope   <NA>      <NA>       std      Y
## 46     freq        <NA>     gyroscope   <NA>      <NA>       std      Z
## 47     freq        <NA>     gyroscope   <NA> magnitude      mean   <NA>
## 48     freq        <NA>     gyroscope   <NA> magnitude       std   <NA>
## 49     freq        <NA>     gyroscope   jerk magnitude      mean   <NA>
## 50     freq        <NA>     gyroscope   jerk magnitude       std   <NA>
## 51     freq        body accelerometer   <NA>      <NA>      mean      X
## 52     freq        body accelerometer   <NA>      <NA>      mean      Y
## 53     freq        body accelerometer   <NA>      <NA>      mean      Z
## 54     freq        body accelerometer   <NA>      <NA>       std      X
## 55     freq        body accelerometer   <NA>      <NA>       std      Y
## 56     freq        body accelerometer   <NA>      <NA>       std      Z
## 57     freq        body accelerometer   <NA> magnitude      mean   <NA>
## 58     freq        body accelerometer   <NA> magnitude       std   <NA>
## 59     freq        body accelerometer   jerk      <NA>      mean      X
## 60     freq        body accelerometer   jerk      <NA>      mean      Y
## 61     freq        body accelerometer   jerk      <NA>      mean      Z
## 62     freq        body accelerometer   jerk      <NA>       std      X
## 63     freq        body accelerometer   jerk      <NA>       std      Y
## 64     freq        body accelerometer   jerk      <NA>       std      Z
## 65     freq        body accelerometer   jerk magnitude      mean   <NA>
## 66     freq        body accelerometer   jerk magnitude       std   <NA>
##      N
## 1  180
## 2  180
## 3  180
## 4  180
## 5  180
## 6  180
## 7  180
## 8  180
## 9  180
## 10 180
## 11 180
## 12 180
## 13 180
## 14 180
## 15 180
## 16 180
## 17 180
## 18 180
## 19 180
## 20 180
## 21 180
## 22 180
## 23 180
## 24 180
## 25 180
## 26 180
## 27 180
## 28 180
## 29 180
## 30 180
## 31 180
## 32 180
## 33 180
## 34 180
## 35 180
## 36 180
## 37 180
## 38 180
## 39 180
## 40 180
## 41 180
## 42 180
## 43 180
## 44 180
## 45 180
## 46 180
## 47 180
## 48 180
## 49 180
## 50 180
## 51 180
## 52 180
## 53 180
## 54 180
## 55 180
## 56 180
## 57 180
## 58 180
## 59 180
## 60 180
## 61 180
## 62 180
## 63 180
## 64 180
## 65 180
## 66 180
```

---
