
# code taken from https://www.kaggle.com/jagelves/d/kaggle/us-baby-names/does-pop-culture-name-our-babies; written by  J. Alejandro Gelves

NameR <- df[df$Name == "Dustin",]
name.df= aggregate(Fr~Birth, NameR,sum)
plot(Fr~Birth, name.df, main="Dustin")
abline(v=1979, col="red")