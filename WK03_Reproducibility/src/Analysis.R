rm(list=ls(all=TRUE))
df.t <- read.csv('data/tempExperiment_v2.csv')
str(df.t)

df.t$temp <- factor(df.t$temp)

#looking at the growth rate as a function of temperature and population
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop)


#making the plot nicer:
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop,
        names = c('10', '20', '10', '20'), #Temperature label
        at = c(1, 2, 4, 5), # space out the boxes according to population
        ylab = 'Growth rate mm/day',
        xlab = ''
)


# Introducing the 'mtext' command to add margin text
mtext('Pop 1', side = 1, at = 1.5, line = 3)
mtext('Pop 2', side = 1, at = 4.5, line = 3)


#saving to a .pdf
pdf('figures/MyBoxplot.pdf', width = 5, height = 5)
# (just copying and pasting above code)
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop,
        names = c('10', '20', '10', '20'), #Temperature label
        at = c(1, 2, 4, 5), # space out the boxes according to population
        ylab = 'Growth rate mm/day',
        xlab = ''
)
# Introducing the 'mtext' command to add margin text
mtext('Pop 1', side = 1, at = 1.5, line = 3)
mtext('Pop 2', side = 1, at = 4.5, line = 3)
dev.off()


#Checking if the effect of Population or the effect of Temperature is significant in our analysis using the ANOVA
m1 <- aov(df.t$growthRate ~ df.t$temp * df.t$pop)
# To see the results, use the "summary" command
m1.summary <- summary(m1)
m1.summary


#Checkpoint 4: How do we interpret this summary? Looking at p values for temperature,population and interaction of both,
#Only the effect of Temperature shows a slight significant trend. 
#Neither Population nor the interaction between Temperature and Population has a statistically significant effect in this analysis. 
#None of temperature and population significantly affects growth rate 



#Checkpoint 5. What did we just do? We just learnt how to structure our codes in several scripts and also putting stuff into different folders. 
#This helps with good organization. #Yes, I think this approach is easily editable and reproducible

