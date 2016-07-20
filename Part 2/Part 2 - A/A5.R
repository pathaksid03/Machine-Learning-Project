


df2014 <- subset(df, Birth == 2014)
uu2= data.frame(summarize(group_by(df2014,Name), sum(Fr)))

p <- uu2[which.max(uu2$sum.Fr.), ]
print(p)
#checking if most popular name Emma has min 5 frequency
dfe <- subset(df, Name == "Emma")
pe <- dfe[which.min(dfe$Fr), ]
print(pe)