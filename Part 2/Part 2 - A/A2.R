# code to show most popular name
df= out[,1:5]
# data frame carrying sums of frequencies
df1 =data.frame(summarize(group_by(df,Name), sum(Fr)))
popu <- df1[which.max(df1$sum.Fr.), ]
print(popu)



