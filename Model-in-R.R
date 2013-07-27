## load the data
data(iris)
colnames(iris) = tolower(colnames(iris))

## fit a model to a dataset
library(rpart)
tree = rpart(species ~ ., data=iris)

## score the dataset -- I hate factors
pred = predict(tree, newdata=iris, type="class")
pred = as.character(pred)
df = cbind(iris, pred)

## save the scored dataframe to an R datafile
save(df, file="test-pred.rdata")
