library(klaR)
library(psych)
library(MASS)
library(caTools)
set.seed(123)
dataset <- german
split = sample.split(dataset$X21, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

training_set[-14] = scale(training_set[-14])
lda = lda(formula = X21 ~ ., data = training_set)
training_set = as.data.frame(predict(lda, training_set))
head(training_set)
plot(lda)

predito=as.data.frame(predict(lda, test_set))
predito$class


Tr = length(subset(a,a == TRUE))
Fl = length(subset(a,a == FALSE))


153/200 = 0.765
