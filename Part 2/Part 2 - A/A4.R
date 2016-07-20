df1980 <- subset(df, Birth == 1980)
df2014 <- subset(df, Birth == 2014)

uu1= data.frame(summarize(group_by(df1980,Name), sum(Fr)))
uu2= data.frame(summarize(group_by(df2014,Name), sum(Fr)))

mer2 <- merge(x = uu1, y = uu2, by = "Name", all.x =  TRUE)
#calculating percent change
mer2$perc <- (((mer2$sum.Fr..y - mer2$sum.Fr..x) / mer2$sum.Fr..x ) * 100 )

perci <- mer2[which.max(mer2$perc), ]
percd <- mer2[which.min(mer2$perc), ]
print(perci)
print(percd)