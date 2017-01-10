#Loading the dplyr package
library(dplyr)
setwd("C:/Users/Dell Inspiron/Documents/sharmila.r/UCI HAR Dataset/dataset")
#Read the training dataset
train_sub     <- read.table("subject_train.txt")
train_y       <- read.table("y_train.txt")
train_x       <- read.table("X_train.txt")
#Bind all the columns in the training dataset
training      <-cbind(train_sub, train_y, train_x)
#Reading the test dataset
test_sub      <- read.table("subject_test.txt")
test_y        <- read.table("y_test.txt")
test_x        <- read.table("X_test.txt")
#Bind all the columns in the test dataset
test          <- cbind(test_sub, test_y, test_x)
#Merge both the training and the test dataset in order to obtain the true dataset
data          <- rbind(training,test)
#Load the features dataset in order to know the features 
features      <- read.table("features.txt")
features      <- features[["V2"]]
features      <- as.character(features)
#Read the activity labels
activities    <- read.table("activity_labels.txt")
colnames(activities) <- c("activity_ID","activity_Label")
#Assigning the column names for the dataframe
colnames(data)[1:2]   <- c("Subject", "Activity")
colnames(data)[3:563] <- features
#Extract only the mean and standard deviation from the dataset
a             <- data[,(grepl("Subject",names(data)))]
b             <- data[,(grepl("Activity",names(data)))]
c             <- data[,(gll;lrepl("mean()",names(data)))]
d             <- data[,(grepl("std()",names(data)))]
mydata        <- data.frame(a,b,c,d)
#Replace activity values with named factor levels
mydata$Activity[mydata$b==1] <- "WALKING"
mydata$Activity[mydata$b==2] <- "WALKING_UPSTAIRS"
mydata$Activity[mydata$b==3] <- "WALKING_DOWNSTAIRS"
mydata$Activity[mydata$b==4] <- "SITTING"
mydata$Activity[mydata$b==5] <- "STANDING"
mydata$Activity[mydata$b==6] <- "LAYING"
#Cleaning the column names
#fetching all the column names in mydatacols
mydatacols    <- colnames(mydata)
#Now converting the names starting with "t" to timeDomain
mydatacols    <- gsub("^t", "timeDomain ", mydatacols) 
mydatacols    <- gsub("^f", "frequencyDomain ", mydatacols)
mydatacols    <- gsub("Acc", " Acclerometer ", mydatacols)
mydatacols    <- gsub("Gyro", " Gyroscope ", mydatacols)
mydatacols    <- gsub("std", "standard deviation ", mydatacols)
mydatacols    <- gsub("mean", "mean ", mydatacols)
mydatacols    <- gsub("Freq", "Frequency ", mydatacols)
mydatacols    <- gsub("Mag", "Magnitude ", mydatacols)
mydatacols    <- gsub("^a", "Subject", mydatacols)
mydatacols    <- gsub("Jerk", "Jerk ", mydatacols)
mydatacols    <- gsub("\\.", "", mydatacols)
#Attaching the names of the mydatacols as the column names to mydata
colnames(mydata) <- mydatacols
#Removing the second column from the dataframe
mydata <- mydata[,-2]
#group_by subject and activity and summarise using mean
mydata_means <- mydata %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
#Write the data in to the tidy data.txt file
write.table(mydata_means, "tidy_data.txt")
