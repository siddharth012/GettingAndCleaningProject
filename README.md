Samsung Dataset From Smartphone Accelerometers
========================================================

The data set includes the following files:
========================================================

'README.md': This contains detailed information about scripts contained in this repository, including kind of transformations, and processing done on the variables from original data set.

'run_analysis.R': This contains code which cleans the original data set and generates another tidy data set with mean of all the variables based on subject and activity type.

'CodeBook.md': Contains details about all the variables in 'run_analysis.R' file, along with its explanation and original variable name from which it has been transformed.

'run_analysis.R':
========================================================

This script contains code which creates a tidy data set. Initially we read all the text files that contain original data('test/X_test.txt', 'train/X_train.txt', 'test/y_test.txt', 'train/y_train.txt', 'test/subject_test.txt', 'train/subject_train.txt', 'activity_labels.txt'), along with their column name file('features.txt'). 'X_train.txt' and 'X_test.txt' file is combined by row and 'features.txt' is combined from above to generate the initial data set with required column names, and their data. Columns containing mean and standard deviation are extarcted, and rest are discarded. Column names are changed to required format by changing them to lower case, etc. 

Then we use another vector which contains appended 'subject_train.txt' and 'subject_test.txt' data and merge it with the original data set. Then we combine 'y_train.txt' and 'y_test.txt' data and give it the required label depending on the value inside according to 'activity_labels.txt' file. These new labels are stored in 'activity' variable, and combined by column with the data set. Then we melt the data set by 'subject' and 'activity', and take mean of the other variables. This is the required final tidy data set.

References:
========================================================

Data set description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
