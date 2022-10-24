# Set up environment: Data structures & Data types
# Display the data types and internal structure to identify anomalies or commonalities vice versa. (Types of data: characters, numeric, integer, complex, logical); (Data Structures: vector, list, matrix, data frame, array, factor); (object with different atrributes, name, dimension, class)
install.packages("here")
library("here")
install.packages("skimr")
library("skimr")
install.packages("dplyr")
library("dplyr")
install.packages("tibble")
library(tibble)

# Data processing:
# Display and check the data types and internal structure to identify anomalies or commonalities vice versa. 
# (Types of data: characters, numeric, integer, complex, logical); 
# (Data Structures: vector, list, matrix, data frame, array, factor); (object with different atrributes, name, dimension, class)

# 2020 (12 months)
# Check and glance through data frames
str(Q1_2020)
str(Q2_APR_2020)
str(Q2_MAY_2020)
str(Q2_JUN_2020) 
str(Q3_JUL_2020)
str(Q3_AUG_2020)
str(Q3_SEP_2020) 
str(Q4_OCT_2020)
str(Q4_NOV_2020) 
str(Q4_DEC_2020)

# Check and glance through column names
# 2020 (12 months)
colnames(Q1_2020) 
colnames(Q2_APR_2020)
colnames(Q2_MAY_2020)
colnames(Q2_JUN_2020) 
colnames(Q3_JUL_2020)
colnames(Q3_AUG_2020)
colnames(Q3_SEP_2020) 
colnames(Q4_OCT_2020)
colnames(Q4_NOV_2020) 
colnames(Q4_DEC_2020)


# More Data Summary
# 2020 (12 months)
head(Q1_2020)
head(Q2_APR_2020)
head(Q2_MAY_2020)
head(Q2_JUN_2020) 
head(Q3_JUL_2020)
head(Q3_AUG_2020)
head(Q3_SEP_2020) 
head(Q4_OCT_2020)
head(Q4_NOV_2020) 
head(Q4_DEC_2020)
