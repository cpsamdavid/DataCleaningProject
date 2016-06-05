if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Load activity labels
acti_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load: data column names
feat <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", feat)

# Load and process X_test & y_test data.
X_t <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_t <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_t <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_t) = feat

# Extract only the measurements on the mean and standard deviation for each measurement.
X_t = X_t[,extract_features]

# Load activity labels
y_t[,2] = acti_labels[y_t[,1]]
names(y_t) = c("Activity_ID", "Activity_Label")
names(sub_t) = "subject"

# Bind data
test_data <- cbind(as.data.table(sub_t), y_t, X_t)

# Load and process X_train & y_train data.
X_tr <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_tr <- read.table("./UCI HAR Dataset/train/y_train.txt")

sub_tr <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_tr) = feat

# Extract only the measurements on the mean and standard deviation for each measurement.
X_tr = X_tr[,extract_features]

# Load activity data
y_tr[,2] = acti_labels[y_tr[,1]]
names(y_tr) = c("Activity_ID", "Activity_Label")
names(sub_tr) = "subject"

# Bind data
train_data <- cbind(as.data.table(sub_tr), y_tr, X_tr)

# Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")