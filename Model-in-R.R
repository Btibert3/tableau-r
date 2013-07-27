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

## write the data to a MySQL database
## the connection to tableau references a pre-built DSN on Windows
library(RODBC)
ch = odbcConnect("tableau")
sqlSave(ch, df, tablename="usecase", rownames=F)