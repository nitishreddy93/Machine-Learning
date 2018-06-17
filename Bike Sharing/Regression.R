data = read.csv("R.csv")
head(data)

library(faraway)

mymodel <- lm(count~.,data=data)
summary(mymodel)
vif(mymodel)

library(lmtest)
library(caret)
bptest(mymodel)

distBCMod <- caret::BoxCoxTrans(data$count)
print(distBCMod)
data <- cbind(data, count_1=predict(distBCMod, data$count))
data$count <- NULL
head(data)
mymodel <- lm(count_1~.,data=data)
summary(mymodel)
bptest(mymodel)
