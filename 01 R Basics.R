# R is an open source programming language that is widely used as a statistical software and data analysis tool.
# R Basics

#Variables
#---------
test = 10
test_value = 10
test.value = 10

#Predefined Constants
#--------------------
print(pi)  # 3.141593
print(letters) # a - z
print(LETTERS) # A - Z
print(month.name) # January - December
print(month.abb) # Jan - Dec

#Data Types
#----------
print(typeof(TRUE))   # logical
print(typeof(+1))     # double
print(typeof(1.50))   # double
print(typeof(2 + 3i)) # complex
print(typeof('abc'))  # character

#Verify data type
#----------------
print(is.integer(1))  # FALSE
print(is.double(1))   # TRUE

#Convert Data Type
#-----------------
print(as.integer(1))    # 1
print(as.character(1))  # "1"
print(as.numeric(1.67805905)) # 1.67805905

#Vectors
#-------
vector_1 = c(1,2,3,4,5)
print(vector_1)         # 1 2 3 4 5
print(vector_1[4])      # 4
print(typeof(vector_1)) # double

#List
#----
list_1 = list(vector_1)
print(list_1)
# [[1]]
# [1] 1 2 3 4 5
print(list_1[[1]])    # [1] 1 2 3 4
print(list_1[[1]][2]) # 2

emp_id = c(1,2,3,4)
emp_name = c("Ram","Moham","Shyam","Govind")
emp_cnt = 4

list_2 = list(
  "id"= emp_id,
  "name"= emp_name,
  "count" = emp_cnt
)
print(list_2)
# $id
# [1] 1 2 3 4
# 
# $name
# [1] "Ram"    "Moham"  "Shyam"  "Govind"
# 
# $count
# [1] 4
print(list_2$id) #[1] 1 2 3 4

print(typeof(list_2))  # "list"

list_2[[2]][2] = "Sagar"

print(list_2[[2]])  # "Ram"    "Sagar"  "Shyam"  "Govind"

list_2[[2]][5] = "Prashant"

print(list_2[[2]]) # "Ram"      "Sagar"    "Shyam"    "Govind"   "Prashant"

# Concatenation of Lists
#-----------------------
emp_age = list("ages" = c(25,30,28,26,31))

list_2 = c(list_2,emp_age)

print(list_2)

# $id
# [1] 1 2 3 4
# 
# $name
# [1] "Ram"      "Sagar"    "Shyam"    "Govind"   "Prashant"
# 
# $count
# [1] 4
# 
# $ages
# [1] 25 30 28 26 31

#Data Frame - data object of R, used to store tabular data
#---------------------------------------------------------
vect_1 = c(1,2,3)
vect_2 = c("R","Python","Java")
vect_3 = c(TRUE,TRUE,FALSE)

df = data.frame(vect_1,vect_2,vect_3)
print(df)

#   vect_1 vect_2 vect_3
# 1      1      R   TRUE
# 2      2 Python   TRUE
# 3      3   Java  FALSE

df_2 = read.table(file="C:/Users/sgd8w23/Desktop/NPTEL/GitHub/R/pandas_data.csv",sep=",")
# default seprator is blank
print(df_2)
#      V1      V2     V3
# 1 EmpId EmpName EmpAge
# 2     1     Ram     25
# 3     2   Mohan     28
# 4     3  Ramesh     22
# 5     4    Vayu     26
# 6     5     Jal     30
# 7     6    Agni     25
# 8     7  Aakash     29ssa
# 9     8 Prithvi     22

print(df_2[1,])   # Print first row 
print(df_2[1:2,]) # Print First and second rows
print(df_2[,1])   # Print first column
print(df_2[,1:2]) # Print First and Second Columns

# Subset - extracts subset of data based on conditions
#-----------------------------------------------------
df_3 = subset(df_2,V2=="Ram"|V3==25)
print(df_3)
#   V1   V2 V3
# 2  1  Ram 25
# 7  6 Agni 25

#Update data frame
#-----------------
df_2[[2]][4] = "Ganesh"
print(df_2)
#      V1      V2     V3
# 1 EmpId EmpName EmpAge
# 2     1     Ram     25
# 3     2   Mohan     28
# 4     3  Ganesh     22
# 5     4    Vayu     26
# 6     5     Jal     30
# 7     6    Agni     25
# 8     7  Aakash     29
# 9     8 Prithvi     22

#Edit data frame
#---------------
df_2 = edit(df_2)
# It open pop up window where we can edit all the rows and columns of dataframe

#Adding Extra Rows and Columns
------------------------------
print(df)
df = rbind(df,data.frame(vect_1=4,vect_2="PLI",vect_3=TRUE))
print(df)
#   vect_1 vect_2 vect_3
# 1      1      R   TRUE
# 2      2 Python   TRUE
# 3      3   Java  FALSE
# 4      4    PLI   TRUE

df = cbind(df,vect_4=c('Basic Level','Adv Level','Basic Level','Adv Level'))
print(df)
#   vect_1 vect_2 vect_3      vect_4
# 1      1      R   TRUE Basic Level
# 2      2 Python   TRUE   Adv Level
# 3      3   Java  FALSE Basic Level
# 4      4    PLI   TRUE   Adv Level

#Deleting Rows and Columns
#-------------------------
df_4 = df[-3,]
print(df)
#   vect_1 vect_2 vect_3      vect_4
# 1      1      R   TRUE Basic Level
# 2      2 Python   TRUE   Adv Level
# 4      4    PLI   TRUE   Adv Level

df_5 = df[,!names(df)%in%c("vect_3")]
print(df_5)
#   vect_1 vect_2      vect_4
# 1      1      R Basic Level
# 2      2 Python   Adv Level
# 3      3   Java Basic Level
# 4      4    PLI   Adv Level

df_6 = df[!df$vect_1==3,]
print(df_6)
#   vect_1 vect_2 vect_3      vect_4
# 1      1      R   TRUE Basic Level
# 2      2 Python   TRUE   Adv Level
# 4      4    PLI   TRUE   Adv Level

#Manupulating rows
#-----------------

df_5[3,1] = 3.1
df_5[3,3] = "Others"
print(df_5)

#   vect_1 vect_2      vect_4
# 1    1.0      R Basic Level
# 2    2.0 Python   Adv Level
# 3    3.1   Java      Others
# 4    4.0    PLI   Adv Level

#Recasting DataFrame 
#--------------------
# Recasting is process of manipulating a data frame in terms of its variable
# Recasting helps in reshaping the data which could bring more insights on the data

df_7 = data.frame()
df_7 = edit(df_7)
print(df_7)

#      Name Month    BS BP
# 1 Senthil   Jan 141.2 90
# 2 Senthil   Feb 139.3 78
# 3     Sam   Jan 135.2 80
# 4     Sam   Feb 160.1 81

# Recasting has two steps - Melt and Cast
# Identifier (Discrete Type Variables) - in this case Name and Month
# Measurement (Numeric variables) - in this case BS and BP
# Categorical and date vartaibles cant be measurements

library(reshape2)
df_8 = melt(df_7,id.vars=c("Name","Month"), measure.vars =c("BS","BP"))
print(df_8)

#      Name Month variable value
# 1 Senthil   Jan       BS 141.2
# 2 Senthil   Feb       BS 139.3
# 3     Sam   Jan       BS 135.2
# 4     Sam   Feb       BS 160.1
# 5 Senthil   Jan       BP  90.0
# 6 Senthil   Feb       BP  78.0
# 7     Sam   Jan       BP  80.0
# 8     Sam   Feb       BP  81.0

df_9 = dcast(df_8,variable + Month ~ Name, value.var = "value")
# variable + Month ~ Name -variable and month to remain as it is Categorties in "Name" beocme new variables
print(df_9)

#   variable Month   Sam Senthil
# 1       BS   Feb 160.1   139.3
# 2       BS   Jan 135.2   141.2
# 3       BP   Feb  81.0    78.0
# 4       BP   Jan  80.0    90.0

# Recatsing in single step
df_10 = recast(df_7,variable+Month ~ Name,id.var = c("Name","Month"))
print(df_10)

#   variable Month   Sam Senthil
# 1       BS   Feb 160.1   139.3
# 2       BS   Jan 135.2   141.2
# 3       BP   Feb  81.0    78.0
# 4       BP   Jan  80.0    90.0

#Add new variables in data frame based on existsing ones
#-------------------------------------------------------

library(dplyr)
df_11 <- mutate(df_7,log_BP = log(BP))
print(df_11)

#      Name Month    BS BP   log_BP
# 1 Senthil   Jan 141.2 90 4.499810
# 2 Senthil   Feb 139.3 78 4.356709
# 3     Sam   Jan 135.2 80 4.382027
# 4     Sam   Feb 160.1 81 4.394449

#Combine two dataframe - dplyr package
#-------------------------------------

df_a = data.frame()
df_a = edit(df_a)
print(df_a)

#   ID   Name Age
# 1  1    Ram  25
# 2  2 Shayam  27

df_b = data.frame()
df_b = edit(df_b)
print(df_b)

#   ID Gender
# 1  1   Male
# 2  2   Male

library(dplyr)
df_c<-left_join(df_a,df_b,by="ID")
print(df_c)

#  ID   Name Age Gender
#1  1    Ram  25   Male
#2  2 Shayam  27   Male

#right_join, inner_join, semi_join, full_join, anti_join also present. Can be used in similiar way how left_join is used.
