# Set up environment: Data Cleaning
install.packages("tidyr")
library(tidyr)
install.packages("janitor")
library("janitor")

# Make sure columns are named the same.
# double checked: data frame [ALL SAME FORMAT]
# double checked: colnames(abc) == colnames(xyz) [ALL RETURN TRUE; no anomalies in the column]
# double checked: rename() [NOT REQUIRED]

# data frame: xxx obs. of 13 variables
# $ ride_id           : chr  "EACB19130B0CDA4A" "8FED874C809DC021" "789F3C21E472CA96" "C9A388DAC6ABF313" ...
# $ rideable_type     : chr  "docked_bike" "docked_bike" "docked_bike" "docked_bike" ...
# $ started_at        : chr  "2020-01-21 20:06:59" "2020-01-30 14:22:39" "2020-01-09 19:29:26" "2020-01-06 16:17:07" ...
# $ ended_at          : chr  "2020-01-21 20:14:30" "2020-01-30 14:26:22" "2020-01-09 19:32:17" "2020-01-06 16:25:56" ...
# $ start_station_name: chr  "Western Ave & Leland Ave" "Clark St & Montrose Ave" "Broadway & Belmont Ave" "Clark St & Randolph St" ...
# $ start_station_id  : int  239 234 296 51 66 212 96 96 212 38 ...
# $ end_station_name  : chr  "Clark St & Leland Ave" "Southport Ave & Irving Park Rd" "Wilton Ave & Belmont Ave" "Fairbanks Ct & Grand Ave" ...
# $ end_station_id    : int  326 318 117 24 212 96 212 212 96 100 ...
# $ start_lat         : num  42 42 41.9 41.9 41.9 ...
# $ start_lng         : num  -87.7 -87.7 -87.6 -87.6 -87.6 ...
# $ end_lat           : num  42 42 41.9 41.9 41.9 ...
# $ end_lng           : num  -87.7 -87.7 -87.7 -87.6 -87.6 ...
# $ member_casual     : chr  "member" "member" "member" "member

colnames(Q1_2020) == colnames(Q2_APR_2020)
colnames(Q2_APR_2020) == colnames(Q2_MAY_2020)
colnames(Q2_MAY_2020) == colnames(Q2_JUN_2020)
colnames(Q2_JUN_2020) == colnames(Q3_JUL_2020)
colnames(Q3_JUL_2020) == colnames(Q3_AUG_2020)
colnames(Q3_AUG_2020) == colnames(Q3_SEP_2020)
colnames(Q3_SEP_2020) == colnames(Q4_OCT_2020)
colnames(Q4_OCT_2020) == colnames(Q4_NOV_2020)
colnames(Q4_NOV_2020) == colnames(Q4_DEC_2020)
colnames(Q4_DEC_2020) == colnames(Q1_2020)

# Make data types are the same before merging data.
# In case of data type compatibleness, use this code:  xyz <- mutate() {xyz, abc =as.integer(abc), def = as.characthers(def)}

# Is there a better way to check data types?
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

# Nice try, but NO!
Q1_2020 (is.character(ride_id),
         is.character(rideable_type),
         is.character(started_at),
         is.character(ended_at),
         is.character(start_station_name),
         is.integer(start_station_id ),
         is.character(end_station_name),
         is.integer(end_station_id),
         is.numeric(start_lat),
         is.numeric(start_lng),
         is.numeric(end_lat),
         is.numeric(end_lng ),
         is.character(member_casual))

# double cheked: datatypes; mutate() [NOT REQUIRED], data is good for merging.
compare_df_cols(Q1_2020,
                Q2_APR_2020,
                Q2_MAY_2020,
                Q2_JUN_2020,
                Q3_JUL_2020,
                Q3_AUG_2020,
                Q3_SEP_2020,
                Q4_OCT_2020,
                Q4_NOV_2020,
                Q4_DEC_2020)



# Merge Data for 2020 (12 files in total) into one data set
Q1234_2020 <- rbind(Q1_2020,
                    Q2_APR_2020,
                    Q2_MAY_2020,
                    Q2_JUN_2020,
                    Q3_JUL_2020,
                    Q3_AUG_2020,
                    Q3_SEP_2020,
                    Q4_OCT_2020,
                    Q4_NOV_2020,
                    Q4_DEC_2020)

View(Q1234_2020)

# Integration successful!
# What else is needed to answer our analysis?
# To answer time related concern, started_at and ended_at is currently "chr".
# Clearly, Date-Time format is vital, a conversion is needed for further calculation.

# Set up environment: R Date-Time format
install.packages("lubridate")
library(lubridate)
# Option 1: (format: NA NA, NOT GOOD!)
Q1234_2020$started_at = strptime(Q1234_2020$started_at, format = '%Y-%m%-%d %H:%M:%S')
Q1234_2020$ended_at = strptime(Q1234_2020$ended_at, format = '%Y-%m-%d %H:%M:%S')

# Option 2: (FAILED)
Q1234_2020$started_at %>% mutate_at(-1, as.POSIXct, format = '%d%b%Y:%H:%M:%S')

# Option 3:(format: NA NA, NOT GOOD!)
Q1234_2020 %>% mutate_at(-1, dmy_hms)

# Option 4: (format: NA NA, NOT GOOD!)
Q1234_2020[['started_at']] <- ymd_hms(Q1234_2020[['started_at']])
Q1234_2020[['eded_at']] <- ymd_hms(Q1234_2020[['ended_at']])

# Option 5: (format: NA NA, NOT GOOD!)
Q1234_2020$started_at = as.POSIXct(Q1234_2020$started_at, format = '%d%b%Y:%H:%M:%S')
Q1234_2020$ended_at = as.POSIXct(Q1234_2020$ended_at, format = '%d%b%Y:%H:%M:%S')

# Option 6: (format: NA NA, NOT GOOD!)
Q1234_2020$started_at <- as.POSIXct(Q1234_2020$started_at, format = "%Y-%m-%d %H:%M:%S", tz="GMT")
Q1234_2020$ended_at <- as.POSIXct(Q1234_2020$ended_at, format = "%Y-%m-%d %H:%M:%S", tz="GMT")

# Option 7: (FAILED)
Q1234_2020(x=c(as.POSIXct(DateTime,tz=Sys.timezone()),as.POSIXct(DateTime,tz=Sys.timezone())+1))

# Option 8: (SUCCESSFUL!)
Q1234_2020$started_at <- as_datetime(Q1234_2020$started_at)
Q1234_2020$ended_at <- as_datetime(Q1234_2020$ended_at)

str(Q1234_2020)

# HOW TO FIND THE ORDER OF DAYS IN A WEEK?
Q1234_2020$date_weekday <- ordered(Q1234_2020$date_weekday, level=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Option 1:
install.packages("lubridate")
library(lubridate)
df$date <- as.Date(df$date)
wday(df$date, label=TRUE)
[1] Wed   Wed   Thurs
Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat

# Option 2:(Successful, how to make new column?)
df  = data.frame(date=c("2020-01-01", "2020-01-02", "2020-01-03"))
dow <- function(x) format(as.Date(x), "%A")
df$day <- dow(df$date)
df

# Option 3: (FAILED)
data2 <- data                                        
data2$day <- strftime(data2$date, "%A")
data2

# Option 4: (FAILED)
data3 <- data                                         # Replicate data for Example 3
data3$weekday <- c("Sunday", "Monday", "Tuesday",     # Convert dates to weekdays
                   "Wednesday", "Thursday", "Friday",
                   "Saturday")[as.POSIXlt(data3$date)$wday + 1]
data3    

# Option 5:
data1 <- data                                         # Replicate data for Example 1
data1$weekday <- weekdays(data1$date)                 # Convert dates to weekdays
data1  

# Option 6: (FAILED)
# "2020-01-01" is Wednesday
date_string <- "2020-01-01"
dt <- dmy(date_string)
dt
## [1] "2015-07-02 UTC"

### Day of week : (1-7, Sunday is 1)
wday(dt)
## [1] 5

### Day of year (1-366; for 2015, only 365)
yday(dt)
## [1] 183

### Or a little shorter to do the same thing for Day of year
yday(dmy("02-July-2015"))
## [1] 183

# Option 7:
wday(ymd("2019-12-31"))
wday(ymd("2020-01-01"))
wday(ymd("2020-01-02"))
wday(ymd("2020-01-03"))
wday(ymd("2020-01-04"))
wday(ymd("2020-01-05"))

# Option 8:(FAILED)
unclass(as.POSIXlt(as.Date("02-July-2015", "%d-%B-%Y")))$yday + 1

# Option 9: (FAILED)
weekdays(as.POSIXct(“2016-06-06 10:00:12”), abbreviate = F)

# Option 10: (Sucessful, but does it increament? And how to join the table?)
date_dayname <- data.frame(date = as.Date(c("2020-01-01","2020-01-02",
                                            "2020-01-03","2020-01-04"))+1, "%A")
weekday <- weekdays(date_dayname$date)                
print(weekday)

# Option 11:
Q1234_2020  %>%
  mutate(weekday = wday(started_at,label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  arrange(member_casual,weekday)

all_trips_v2 %>%
  mutate(weekday = wday(started_at,label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual,weekday)

# Option 12:(Nice try, but NO)
new_Q1234_2020 <- Q1234_2020 %>%
  arrange(date_dayname)


# Option 13:
Q1234_2020$date <- as.Date(Q1234_2020$started_at)
#Q1234_2020$year <- format(as.Date(Q1234_2020$date),"%Y")
#Q1234_2020$month <- format(as.Date(Q1234_2020$date),"%m")
#Q1234_2020$day <- format(as.Date(Q1234_2020$date),"%d")
Q1234_2020$week_name <- format(as.Date(Q1234_2020$started_at),"%A")

# Check date vs week days Sunday = 1
wday(ymd("2019-12-29")) # Sunday = 1
wday(ymd("2019-12-30")) # Monday  = 2
wday(ymd("2019-12-31")) # Tuesday = 3
wday(ymd("2020-01-01")) # Wednesday = 4
wday(ymd("2020-01-02")) # Thursday = 5
wday(ymd("2020-01-03")) # Friday = 6
wday(ymd("2020-01-04")) # Saturday = 7
wday(ymd("2020-01-21")) # Code = 3, therefore it's Tuesday!

yday("2020-12-31") #Which day in 2020?



head(Q1234_2020)
str(Q1234_2020)
View(Q1234_2020)


# For stastistic (such as mean, midpoint, average, min, max)
nrow(Q1234_2020) # Rough total Population
dim(Q1234_2020)
head(Q1234_2020)
tail(Q1234_2020)
summary(Q1234_2020) # Show total population (Need further calculation!)
table(Q1234_2020)

str(Q1234_2020)

# Check duration of rides' data type before calculation, change its data type from "chr" into "numeric" to ease calculation!!!
Q1234_2020$ride_duration_s <- difftime(Q1234_2020$ended_at, Q1234_2020$started_at) # in seconds!
Q1234_2020$ride_duration_s <- as.numeric(as.character(Q1234_2020$ride_duration_s)) # change "chr" to "num"

is.numeric(Q1234_2020$ride_duration_s) #logical query, should return TRUE to validate we've succesfully change the data types.

# Remove unnecessary data columns: start_lat, start_lng, end_lat, end_lng
Q1234_2020 <- Q1234_2020 %>% select(-c(start_lat, start_lng, end_lat, end_lng, date, year, month, day)
                                    
Q1234_2020_cleaned1 <- Q1234_2020[!(Q1234_2020$ride_duration_s <=0),] # Remove 0 or NIL seconds data, probably some failed rides, could be used in the future.
Q1234_2020_cleaned1 <- na.omit(Q1234_2020_cleaned1) # Remove potential NA values
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>%  distinct() # Remove potential duplicates
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>% filter(!(is.na(start_station_name) | start_station_name == "")) %>%  filter(!(is.na(end_station_name) | end_station_name == "")) # Remove blank results
str(Q1234_2020_cleaned1)
                                    
# Arrange cleaned data according to dates (URGHHH!) HOW TO SOLVE THIS PART?
                                    
# Option 1: (FAILED)
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>%
arrange(started_at, "%Y-%m-%d")
                                    
# Option 2: (FAILED)
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1[as.Date(Q1234_2020_cleaned1):1,]
                                    
# Option 3: (FAILED)
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>%
arrange(date = as.Date(date, "%d/%m/%Y"))
                                    
# Option 4: (FAILED)
# SUCCESSFUL! BUT can't seem to change the data set....
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1[order(as.Date(Q1234_2020_cleaned1$date, format="%Y/%m/%d")),]  
Q1234_2020_cleaned1[order(as.Date(Q1234_2020_cleaned1$started_at, format="%Y/%m/%d")),]
Q1234_2020_cleaned1[order(as.Date(Q1234_2020_cleaned1$ended_at, format="%Y/%m/%d")),]
                                    
# Option 5:
# SUCCESSFUL!!!!!!!!
Q1234_2020_cleaned1$started_at <- as.POSIXct(Q1234_2020_cleaned1$started_at , format = "%m/%d/%Y %I:%M:%S %p" , tz = "GMT")
class(Q1234_2020_cleaned1$started_at)
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1[do.call(order, Q1234_2020_cleaned1), ]
                                    
Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>% select(-c(start_lat, start_lng, end_lat, end_lng)
str(Q1234_2020_cleaned1)
View(Q1234_2020_cleaned1)
# Total population (calculate mean, midpoint, average, min, max)
nrow(Q1234_2020_cleaned1)
Q1234_2020_cleaned1 %>%  group_by(member_casual) %>%  summarise(ride_freq = length(ride_id))
                                                      
### ANALYSIS
# Total riding duration
sum(Q1234_2020_cleaned1$ride_duration_s)
# Mean
mean(Q1234_2020_cleaned1$ride_duration_s)
# Midpoint
median(Q1234_2020_cleaned1$ride_duration_s)
# Longest ride
 max(Q1234_2020_cleaned1$ride_duration_s)
# Shortest ride
min(Q1234_2020_cleaned1$ride_duration_s) #Why is this happening?
# Standard Deviation
sd(Q1234_2020_cleaned1$ride_duration_s)
 # Variance
var(Q1234_2020_cleaned1$ride_duration_s)
# Riding duration by type of customer
 setNames(aggregate(ride_duration_s ~ member_casual, Q1234_2020_cleaned1, sum ),
 c("customer_type","ride_duration_s")) # Casual riders more than member!!!! Almost doubled!
                                                      
# Rideable type population
table(Q1234_2020_cleaned1$rideable_type) # Docked > Electric > Classic
# Customer rideable preferences
str(Q1234_2020_cleaned1)
                                                      
 # Trying to change rideable type from "num"to "chr" [FAILED]
Q1234_2020_cleaned1$rideable_type <- as.numeric(as.character(Q1234_2020_cleaned1$rideable_type)) # change "chr" to "num"
Q1234_2020_cleaned1$rideable_type <- as.character(as.numeric(Q1234_2020_cleaned1$rideable_type)) # change "num" to "chr"
Q1234_2020_cleaned1 %>% group_by(member_casual,rideable_type) %>% summarise(member_casual,rideable_type)
                                                      
# Option 1: Successful!
Q1234_2020_cleaned1 %>% group_by(Q1234_2020_cleaned1$member_casual) %>% count(Q1234_2020_cleaned1$rideable_type)
                                                      
# How to show it like this? stats <- data.frame(sum,mean,median,max,min,sd,var)
                                                      
stats <- Q1234_2020_cleaned1 %>%
sum(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE) %>%
mean(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE) %>%
median(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE) %>%
max(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE) %>%
min(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE) %>%
sd(Q1234_2020_cleaned1$ride_duration_s) %>%
var(Q1234_2020_cleaned1$ride_duration_s, na.rm = TRUE)
                                                      
as.table(Q1234_2020_cleaned1 %>%  
sum(Q1234_2020_cleaned1$ride_duration_s) %>%
mean(Q1234_2020_cleaned1$ride_duration_s) %>%
median(Q1234_2020_cleaned1$ride_duration_s) %>%
max(Q1234_2020_cleaned1$ride_duration_s) %>%
min(Q1234_2020_cleaned1$ride_duration_s) %>%
sd(Q1234_2020_cleaned1$ride_duration_s) %>%
var(Q1234_2020_cleaned1$ride_duration_s)) %>%
drop_na()
 # Find the population for members (calculate mean, midpoint, average, min, max)
                                                      
  # Option 1: (FAILED, migbt be OK to do it separately)                                    
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,
                                                                FUN = sum, FUN = mean, FUN = median, FUN = max, FUN = min, FUN = sd, FUN = var)
                                                      
# Option 2: (SUCCESSFUL but can we join it together? Or refactor it)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual, FUN = sum)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = mean)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = median)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = max)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = min)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = sd)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = var)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = range)
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = quantile)
                                                      
                                                      
# Option 2: (FAILED)
Q1234_2020_cleaned1_stats <- do.call(data.frame,aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,
  function(x) c(sum = sum(x, na.rm = TRUE), mean = mean(x, na.rm = TRUE), median = median(x, na.rm = TRUE), max= max(x, na.rm = TRUE), min= min(x, na.rm = TRUE, sd = sd(x, na.rm = TRUE, var= var(x, na.rm = TRUE)
                                                                                                                                                                                                                                                                                       range = max(x, na.rm = TRUE) - min(x, na.rm = TRUE), quantile(x, probs = seq(.1, 1, by = .1),
                                                                                                                                                                                                                                                                                                                                                     na.rm = TRUE, .groups = 'drop'))))
                                                                                                                
  # Option 3:(SUCESSFUL BUT CALCULATION SEEMS SUS)
Q1234_2020_cleaned1 %>%
group_by(ride_duration_s) %>%
summarize(sum = sum(ride_duration_s, na.rm = TRUE),
mean = mean(ride_duration_s, na.rm = TRUE),
median = median(ride_duration_s, na.rm = TRUE),
max = max(ride_duration_s, na.rm = TRUE),
min = min(ride_duration_s, na.rm = TRUE),
sd = sd(ride_duration_s, na.rm = TRUE),
var = var(ride_duration_s, na.rm = TRUE),
range = diff(range(ride_duration_s, na.rm = TRUE)),
quantile = list(quantile(ride_duration_s, probs = seq(.1, 1, by = .1), na.rm = TRUE))) %>%
 unnest_wider(quantile)
                                                                                                                
# Option 4: (FAILED)
Q1234_2020_cleaned1 %>%
group_by(ride_duration_s) %>%
aggregate(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual, FUN = sum)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = mean)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = median)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = max)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = min)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = sd)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = var)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = range)
(Q1234_2020_cleaned1$ride_duration_s ~ Q1234_2020_cleaned1$member_casual,FUN = quantile))
                                                                                           
 # Find the population for casuals (calculate mean, midpoint, average, min, max)
mean(3732614925/2)
median((3732614925+1952034518)/2)

save(
  Q1234_2020_cleaned1,
  "/Volumes/UDISK/2020 R",
  col.names = TRUE,
  row.names = FALSE
)

