subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test,subject_train)

x_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
x <- rbind(x_test,x_train)

y_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
y <- rbind(y_test,y_train)

activity_labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

y$activity <- factor(y$V1, levels=activity_labels$V1,labels=activity_labels$V2)
y$V1 <- NULL
names(x) <- features$V2
x <- x[,c(grep("mean()",colnames(x)),grep("std()",colnames(x)))]
names(subject) <- "subject"
combined_data <- cbind(subject,y,x)

tidy_data <- aggregate(.~subject+activity,combined_data,mean)
write.table(tidy_data,"tidy_data.txt")


