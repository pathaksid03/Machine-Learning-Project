# use install.packages("package-name") to install if not already present

library(randomForest)
library(gbm)
library(ipred)
library(hydroGOF)
library(clusterGeneration)
#Loading required package: MASS
library(mnormt)
library(corrplot)
library(caret)
library(ggplot2)
library(mice)

#tested out a bunch of models with a bunch of variations in parameters

#imputing NAs
com <- mice(codetest_train, m=1, maxit = 1)
codetest_train <- complete(com)

# fitting the GBM
gbmcom6 <- gbm(target ~ ., data=codetest_train, n.trees = 3000, shrinkage = .05, interaction.depth = 6, cv.folds = 10)

# checking OOB error graph
gbm.perf(gbmcom6, oobag.curve = TRUE, overlay = TRUE, method="OOB")

# predicting target 
prediction <- predict(gbmcom6, newdata=codetest_test, type="response", n.trees=2000)

# saving in txt file
p <- as.data.frame(prediction)
write.table(p, "prediction.txt", sep="\t", row.names=FALSE, col.names=FALSE)
