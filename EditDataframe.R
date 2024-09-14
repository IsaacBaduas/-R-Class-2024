#Editing the dataframe 

df.t1<- read.csv(file="data/tempExperiment-raw.csv")
head(df.t1)
str(df.t1)



#Checkpoint 1: Is this data structure ready for analysis?
#No the dataframe is not ready for analysis so we need work on it to make it ready. 
#we can fix it by separating temperature treatment from population by using the function ‘strsplit’ to do this.


#separating the temperature treatment from population ( eg. if I have two things attached this is how I separate it)
a <- strsplit(as.character(df.t1$temp), split = '-')
# note that without "as.character" it thinks the variable is a factor and won't work
newvar <- matrix(unlist(a), ncol = 2, byrow = TRUE)
head(newvar)


#sets the dataframe to a new variable so we can fix it
df.t2 <- df.t1 # we set the dataframe to a new variable so we can fix it
df.t2$temp <- newvar[,1]
df.t2$pop <- newvar[,2]
head(df.t2)



#Checkpoint 2.
#Making ‘temp’ and ‘pop’ to have the correct levels.
#the function sub to give ‘temp’ only numeric values and ‘pop’ only levels ‘pop1’ and ‘pop2

df.t2$temp <- sub('ten', '10', df.t2$temp)
df.t2$temp <- sub('twenty', '20', df.t2$temp)
df.t2$pop <- sub('population ', 'pop', df.t2$pop)
str(df.t2)

#making sure all the objects in the dataframe are of the correct flavor. Use the function factor or as.numeric to do so.
df.t2$temp <- factor(df.t2$temp)
df.t2$pop <- factor(df.t2$pop)
str(df.t2)
write.csv(df.t2, 'data/tempExperiment_v2.csv')




#Why are we doing this? This allows us to read and execute the R code from the EditDataframe script file.  
#How is it going to help us? It allows us to the reuse code across multiple projects without rewriting it. 
#It also helps keep the script organized and clean.
  