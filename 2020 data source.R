# Set up environment: Data upload
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("readr")
library(readr)


# Upload relevant raw data from Cyclistic bike-share provided by Divvy Bikes. 
# Data is split into pre-pandemic (2014-2018); pandemic (2019); towards post-pandemic (2020-present). 
# Looking at the historical data this way makes more sense for me, because we get to compare the impact of such crisis.
# Please note that this timeline is just a reference. WHO hasn't publicly announced the end of Covid-19 pandemic, most countries are vaccinated now and people start moving freely again.
# However, due to time constraint and minimizing the chances of data overloading and crashing, I will only analyse 2020, the year of vaccine discovery and fighting covid19 variants.

# 2020 (12 months)
Q1_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/Divvy_Trips_2020_Q1.csv")
Q2_APR_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202004-divvy-tripdata.csv")
Q2_MAY_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202005-divvy-tripdata.csv")
Q2_JUN_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202006-divvy-tripdata.csv")
Q3_JUL_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202007-divvy-tripdata.csv")
Q3_AUG_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202008-divvy-tripdata.csv")
Q3_SEP_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202009-divvy-tripdata.csv")
Q4_OCT_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202010-divvy-tripdata.csv")
Q4_NOV_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202011-divvy-tripdata.csv")
Q4_DEC_2020 <- read.csv("/Volumes/UDISK/Google Analytics Track 1/2013-2022/2020/202012-divvy-tripdata.csv")
