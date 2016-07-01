
#' Start Time
t_start<-Sys.time()

#' Get file path
dirpath<-getwd()
filepath<-file.path(dirpath,"UCI HAR Dataset")

#' Read Files and Convert to data table
x_train<-read.table(file.path(filepath, "train", "x_train.txt"))
x_train<-data.table(x_train)
x_test<-read.table(file.path(filepath,"test","x_test.txt"))
x_test<-data.table(x_test)

y_train<-read.table(file.path(filepath,"train","y_train.txt"))
y_train<-data.table(y_train)
y_test<-read.table(file.path(filepath,"test","y_test.txt"))
y_test<-data.table(y_test)

subject_train<-read.table(file.path(filepath,"train","subject_train.txt"))
subject_train<-data.table(subject_train)

subject_test<-read.table(file.path(filepath,"test","subject_test.txt"))
subject_test<-data.table(subject_test)

activitynames<-read.table(file.path(filepath,"activity_labels.txt"))
activitynames<-data.table(activitynames)

datafeatures<-read.table(file.path(filepath,"features.txt"),stringsAsFactors = FALSE)
datafeatures<-data.table(datafeatures)

#' Bind Data and nameing the columns
subject <- rbind(subject_train, subject_test)
setnames(subject, "V1", "subject")
activity <- rbind(y_train, y_test)
setnames(activity, "V1", "activitynum")
data <- rbind(x_train, x_test)
subject <- cbind(subject, activity)
data <- cbind(subject, data)
setkey(data, subject, activitynum)
setnames(datafeatures, names(datafeatures), c("featurenum", "featurename"))

#' Finding Features containing Mean and Standard Deviation
datafeatures <- datafeatures[grepl("-mean\\(\\)|-std\\(\\)", featurename)]
datafeatures$code <- datafeatures[, paste0("V", featurenum)]

#' Subset Columns 
select <- c(key(data), datafeatures$code)
data <- data[, select, with=FALSE]
setnames(activitynames, names(activitynames), c("activitynum", "activityname"))

#' Merge data
data <- merge(data, activitynames, by="activitynum", all.x=TRUE)
setkey(data, subject, activitynum, activityname)
data <- data.table(melt(data, key(data), variable.name="code"))
data <- merge(data, datafeatures[, list(featurenum, code, featurename)], by="code", all.x=TRUE)

#' Coerce to factor
data$subject <-as.factor(data$subject)
data$activity <- as.factor(data$activityname)
data$features <- as.factor(data$featurename)


#'Function to search for requred text and assign a factor value to it 
splitter <- function (feat,factorval) {
  grepl(feat, data$features)*factorval
}

#' Subsetting and converting them to factor
time_domain<-splitter("^t",1)
freq_domain<-splitter("^f",2)
data$ftdomain<-factor(time_domain+freq_domain,labels =c("time","freq"))

acc_dev<-splitter("Acc",1)
gyro_dev<-splitter("Gyro",2)
data$ftdevice<-factor(acc_dev+gyro_dev,labels =c("accelerometer","gyroscope"))

body_acc<-splitter("BodyAcc",1)
grav_acc<-splitter("GravityAcc",2)
data$ftacceltype<-factor(ifelse((body_acc+grav_acc)>0,(body_acc+grav_acc),0),labels=c(NA, "body", "gravity"))

average<-splitter("mean()",1)
std<-splitter("std()",2)
data$ftmeasure<-factor(average+std,labels =c("mean","std"))

data$ftjerk<-factor(splitter("Jerk",1),labels=c(NA, "jerk"))
data$ftmag<-factor(splitter("Mag",1), labels=c(NA, "magnitude"))

xaxis<-splitter("-X",1)
yaxis<-splitter("-Y",2)
zaxis<-splitter("-Z",3)
data$ftaxis<-factor(xaxis+yaxis+zaxis,labels =c(NA,"X","Y","Z"))

#'Check if there is any mismatch 
identical(data$activity,data$activityname)

#' Grouping
setkey(data, subject, activity, ftdomain, ftacceltype, ftdevice, ftjerk, ftmag, ftmeasure, ftaxis)
data<-select(data,subject,activity, ftdomain, ftacceltype, ftdevice, ftjerk, ftmag, ftmeasure, ftaxis,value )
data<-group_by(data, subject, activity, ftdomain, ftacceltype, ftdevice, ftjerk, ftmag, ftmeasure, ftaxis)

#Independent Tidy Dataset
datatidy <- summarise(data,mean(value))

#End Time and Total Time
t_end<- Sys.time()
t_total<-t_end-t_start
timetext<-c("Start Time : ", "End Time : " , "Total Time :")
timetaken<-c(as.character(t_start),as.character(t_end),as.character(t_total))

#`------------------------End of Script-------------------------
paste(timetext,timetaken)



