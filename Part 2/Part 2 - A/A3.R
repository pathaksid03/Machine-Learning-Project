dff <- subset(df, Birth == 2013)

bg= data.frame(summarize(group_by(dff,Name, Sex), sum(Fr)))
bgt= data.frame(summarize(group_by(dff,Name), sum(Fr)))
dg <- bg[which(bg$Sex == "F"),]
#db <- bg[which(bg$Sex == "M"),]


  mer <- merge(x = bgt, y = dg, by = "Name", all.x =  TRUE)
  #calculating percentage of girl names
  mer$perg = (mer$sum.Fr..y / mer$sum.Fr..x) * 100
# range between 40-60, and frequency more than 1000 for popularity

amb <- subset(mer, perg >= 40 & perg <= 60 & sum.Fr..x > 1000 & sum.Fr..y > 1000)
amb$diff <- abs(50-amb$perg)
#final ans
gamb <- amb[which.min(amb$diff), ]
print(gamb)