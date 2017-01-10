# Getting-and-Cleaning-Data-course-project
The objective of the course to mess with the untidy dataset and create a new tidy dataset from the existing dataset

For creating a tidy data set of wearable computing, The data was collected originaly from http://archive.ics.uci.edu/ml/datasets
/Human+Activity+Recognition+Using+Smartphones

#Files that i have attached with this repo
README.md       <- The one which you are reading now

Codebook.md     <- The one which describes about the variables, the data and the transformations

run_analysis.R  <- My source code in order to clean this untidy data

#run_analysis.R Goals
The main goal of this project is to 1.Merge the training and the test dataset to create one dataset, 2.Extracts only the 
measurements on the mean and standard deviation for each measurement, 3.Uses descriptive activity names to name the activities
in the data set, 4.Appropriately labels the data set with descriptive variable names, 5.From the data set in step 4, creates a 
second, independent tidy data set with the average of each variable for each activity and each subject.

The final output of this project is produced with the name called the tidy_data.txt

#run_analysis.R Walk through

#Step-1:
   # Read all the training dataset files that includes train_sub, train_x, train_y and column bind all the three using the cbind 
   command.
   
   # Read all the training dataset files that includes test_sub, test_x, test_y and column bind all the three using the cbind 
   command.
   
   # Merge both the training and the test dataset using the rbind command.
   
   # Load the features file in the dataset in order to extract the column names of the dataset.
   
   # Load the activity file in the dataset in order to know about the subject involved and the activity done by the subject.

#Step-2:
   # Now Extract the columns in the dataset that contains mean and std in the column names, this is done using the regex and form 
   the new dataframe called mydata.

#Step-3:
   # Now Replace the activity Values with the named factor levels and clean the column names by abbrevating timeDomain for 't' 
   etc. 

#Step-4:
   # Now by using the pipe operator to group by the subject and the activity and summarise using the mean function.

#Step-5:
   # Finally write the table into newdata called the tidy_data.txt.
