wine = read.csv(file = 'C:\\Users\\nitis\\OneDrive\\Documents\\Data Mining and ML\\wine\\wine (1).csv')
str(wine)
summary(wine)
model1 = lm(Price ~ AGST, data=wine)
summary(model1)

model1$residuals
SSE = sum(model1$residuals^2)
SSE

model2 = lm(Price ~ AGST + HarvestRain, data=wine)
summary((model2))
SSE = sum(model2$residuals^2)
SSE

model3 = lm(Price~AGST + HarvestRain + WinterRain + Age + FrancePop, data = wine)
summary(model3)
SSE = sum(model3$residuals^2)
SSE

model4 = lm(Price ~ HarvestRain + WinterRain, data=wine)
summary(model4)
SSE = sum(model4$residuals)
SSE

model5 = lm(Price ~ AGST + HarvestRain + WinterRain + Age, data = wine)
summary(model5)
SSE = sum(model5$residuals^2)
SSE

cor(wine$WinterRain, wine$Price)
cor(wine$Age, wine$FrancePop)
cor(wine$HarvestRain, wine$WinterRain)

wine_test = read.csv("C:\\Users\\nitis\\OneDrive\\Documents\\Data Mining and ML\\wine\\wine_test.csv")
str(wine_test)
predictTest = predict(model5, newdata = wine_test)
predictTest
SSE = sum((wine_test$Price - predictTest)^2)
SST = sum((wine_test$Price - mean(wine$Price))^2)
1 - (SSE/SST)
 