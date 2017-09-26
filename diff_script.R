# Script to perform differenced values

# Read data ---------------------------------------------------------------

data <- read.csv("log_data.csv")

# Subsetting --------------------------------------------------------------

data <- data[,c(-1,-2,-5,-7,-8)]


cat("No of missing values : ",sum(is.na(data)),"\n")
cat("No. of variables : ",ncol(data),"\n")
cat("Training cases : ",nrow(data),"\n")


# Indexing ----------------------------------------------------------------


data <- cbind(data,NA)
colnames(data)[4] <- "Diff"
data[1:nrow(data),]

for(i in 1:nrow(data)){
  cat("Step no. :",i,"\n")
  if(grepl("3",data$Code[i])){
    cat("3 found \t")
    temp <- data$Time[i]
  }
  if(Label[i] == "Response"){
    cat("Response found", i,"\t")
    data[i,4] <- data$Time[i] - temp
  }
}

# Update data -------------------------------------------------------------

data[1:nrow(data),]
write.csv(data,"aut_diff.csv")
