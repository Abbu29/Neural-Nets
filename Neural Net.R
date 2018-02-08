#Reading the file
df <- read.csv("/Users/satyamaddali/Desktop/R for data science/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/bank_nte_data.csv")
head(df)
str(df)
#Spliting the data into train and test data
library(caTools)
set.seed(101)
splitdf <- sample.split(df$Class, SplitRatio = 0.7)
train <- subset(df, splitdf== T)
test <- subset(df, splitdf== F)
str(train)
#Building the Neural Net
install.packages("neuralnet")
library(neuralnet)
#Training a neural net
nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data=train, hidden = 10, linear.output = FALSE)
plot(nn)
#Predictions
predicted.nn <- compute(nn, test[1:4])
head(predicted.nn$net.result)
predictions <- sapply(predicted.nn$net.result, round)
head(predictions)
table(predictions, test$Class)

