
wd <- '~/R/coursera/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset'

x_train <- paste(wd, '/train/X_train.txt', sep='')
y_train <- paste(wd, '/train/y_train.txt', sep='')
s_train <- paste(wd, '/train/subject_train.txt', sep='')
x_test <- paste(wd, '/test/X_test.txt', sep='')
y_test <- paste(wd, '/test/y_test.txt', sep='')
s_test <- paste(wd, '/test/subject_test.txt', sep='')

train_labels <- read.table(y_train, header = FALSE, sep = "", dec = ".")
test_labels <- read.table(y_test, header = FALSE, sep = "", dec = ".")
train_set <- read.table(x_train, header = FALSE, sep = "", dec = ".")
test_set <- read.table(x_test, header = FALSE, sep = "", dec = ".")
train_subjects <- read.table(s_train, header = FALSE, sep = "", dec = ".")
test_subjects <- read.table(s_test, header = FALSE, sep = "", dec = ".")

name_activity <- function(x) {
  if (x == 1)
    return("WALKING")
  if (x == 2)
    return("WALKING_UPSTAIRS")
  if (x == 3)
    return("WALKING_DOWNSTAIRS")
  if (x == 4)
    return("SITTING")
  if (x == 5)
    return("STANDING")
  if (x == 6)
    return("LAYING")
  return("")
}

full_data_set <- rbind(train_set, test_set)
full_data_labels <- rbind(train_labels, test_labels)
full_data_subjects <- rbind(train_subjects, test_subjects)

full_data_set['mean'] <- apply(full_data_set, 1, mean)
full_data_set['standard_deviation'] <- apply(full_data_set, 1, sd)
full_data_set['activity_name'] <- apply(full_data_labels, 1, name_activity)
full_data_set['subject'] <- full_data_subjects
data_set <- full_data_set[c("subject", "activity_name", "mean", "standard_deviation")]

tidy_data_set <- aggregate(data_set, list(data_set$activity_name, data_set$subject), mean)
tidy_data_set <- tidy_data_set[c("Group.1", "Group.2", "mean", "standard_deviation")]
names(tidy_data_set) <- c("activity_name", "subject", "mean", "standard_deviation")
write.table(tidy_data_set, "tidy_data_set.txt")

