# Set up environment: Data Visualization
install.packages("ggplot2")
library(ggplot2)
install.packages("lubridate")
library(lubridate)
install.packages("ggrepel")
library(ggrepel)
installed.packages("rmarkdown")

# Plot distribution total population (Membership VS Casual)
# Make pie chart on Tableau

Q1234_2020_cleaned1 %>%
  group_by(member_casual) %>%
  summarise(ride_freq = length(ride_id)) %>%
  arrange(member_casual) %>%
  ggplot(aes(x=member_casual,y=ride_freq,fill=member_casual)) +
  labs(title ="Members VS Casual Population")

ggplot(data = Q1234_2020_cleaned1) +
  geom_bar(mapping=aes(x=member_casual,fill=member_casual)) +
  labs(title = "Members VS Casual Population") +
  facet_wrap(~rideable_type)

# Casual VS Member weekly bike usage
# Option 1: (FAILED)
Q1234_2020_cleaned1 %>%
  mutate(week_name =wday(started_at, label = TRUE)) %>%
  group_by(member_casual, week_name) %>%
  summarise(ride_freq = n(), average_duration_s = mean(ride_duration_s)) %>%
  arrange(member_casual, week_name)

Q1234_2020_cleaned1 %>%
  group_by(member_casual, date) %>%
  summarise(ride_freq = n(), average_duration_s = mean(ride_duration_s)) %>%
  arrange(member_casual, date)

# sun to mon
Q1234_2020_cleaned1 %>%
  ggplot(aes(x=week_name,y=Q1234_2020_cleaned1$ride_freq,fill=member_casual)) +
  labs(title ="Customer (Casual Vs Member) weekly bike usage", x="Day of the week", y="number of trips", fill="Customer type") +
  geom_col(width = 0.8, position = position_dodge(width=0.8)) +
  facet_wrap(~member_casual) 

# Option 2: SUCCESSFUL!!!!!!
Q1234_2020_cleaned1 %>%
  group_by(member_casual, week_name) %>%
  summarise(ride_freq = n()) %>%
  arrange(member_casual, week_name) %>%
  ggplot(mapping = aes(x = factor(week_name, c("Sunday", "Monday", "Tuesday", "Wednesday","Thursday","Friday", "Saturday")) , y=ride_freq, fill=member_casual)) +
  labs(title ="Customer (Casual Vs Member) weekly bike usage", x="Day of the week", y="number of trips", fill="Customer type") +
  geom_col(width = 0.8, position = position_dodge(width=0.5)) +
  scale_x_discrete(guide = guide_axis(n.dodge=2))


+ 
  scale_y_continuous( trans= 'log10')

+ ylim(0,10000000)

+
  scale_y_continuous(label= function(x) format(x, scientific = FALSE))

# Casual VS Member monthly bike usage

# Option 1: SUCESSFUL
Q1234_2020_cleaned1 %>%
  group_by(member_casual, date) %>%
  summarise(ride_freq = n()) %>%
  arrange(member_casual, date) %>%
  ggplot(mapping = aes(x = date, y=ride_freq, fill=member_casual)) +
  labs(title ="Customer (Casual Vs Member) monthly bike usage", x="Months", y="number of trips", fill="Customer type") +
  geom_col(width = 0.6, position = position_dodge(width=0.6)) +
  facet_wrap(~member_casual, Q1234_2020_cleaned1$date) 
# + scale_x_continuous(guide = guide_axis(n.dodge=2))


# + scale_x_discrete(guide = guide_axis(check.overlap = TRUE))
# + facet_wrap(~member_casual) 
# + scale_x_discrete(guide = guide_axis(n.dodge=2))

# Popular Riding Hours
# Option 1: (FAILED)
time_object <- data.frame(strptime(Q1234_2020_cleaned1$started_at, "%Y-%m-%d %H:%M:%S", tz="EST"))
colnames(time_object)

time_object <- data.frame(format(time_object$strptime.Q1234_2020_cleaned1.started_at....Y..m..d..H..M..S..., format = "%H"))
customer_start_hours <- data.frame(time_object, Q1234_2020_cleaned1$member_casual)
colnames(customer_start_hours)

customer_start_hours <- customer_start_hours %>% 
  dplyr::rename(start_hour = format.time_object.strptime.Q1234_2020_cleaned1.started_at....Y..m..d..H..M..S...tz....EST....,
                member_casual = Q1234_2020_cleaned1)
options(repr.plot.width = 10, repr.plot.height = 8)
ggplot(mapping = aes(x = started_at, y= ride_freq, fill=member_casual)) %>% 
  geom_bar(aes(fill=as.factor(member_casual), width = 0.50) +
             labs(title = "Popular Riding Hours",
                  subtitle = "Based on customer type",
                  x = "\nHour (SO 8601 24-hour clock system",
                  y = "ride_freq") +
             theme_grey() +
             theme(legend.position = "top", text = element_text(size = 14)) +
             scale_fill_continuous(name= "Custormer type", values = wesPalette) +
             scale_y_continuous(labels = comma) +
             facet_wrap(member_casual~.) 
           
           
           group_by(member_casual, started_at) %>% 
             summarise(ride_freq = n()) %>% 
             arrange(member_casual, started_at) %>% 
             
             # Option 2: (FAILED)
             Q1234_2020_cleaned1$started_at <- strftime(Q1234_2020_cleaned1$started_at, format = "%H:00", tz = "UTC", usetz = FALSE)
           
           hours_order <- c("0:00", "1:00", "2:00", "3:00", "4:00", "6:00", "7:00",
                            "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00",
                            "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00",
                            "22:00","23:00")
           
           Q1234_2020_cleaned1 %>% 
             group_by(member_casual, started_at) %>% 
             summarise(ride_freq = n()) %>% 
             arrange(member_casual, started_at) %>% 
             ggplot(aes(x=started_at, y = ride_freq, fill=member_casual)) +
             geom_col(position="dodge") +
             theme_linedraw() +
             labs(
               x= "\nHour (SO 8601 24-hour clock system",
               y= "ride_freq",
               fill= "Customer type",
               title= "Popular Riding Hours in 2020"
             ) +
             theme(
               axis.text.x =  element_text(size = 8, angle 45, hjust = 1),
               axis.text.y = element_text(size = 12, color="Black"),
               plot.title = element_text(size = 12, hjust - 0.5)
             ) +
             scale_y_continuous(expand = x(0,0), limits = x(0, 35000), labels = c("0","100k","200k","300k","400k")) +
             scale_fill_brewer(palette = "Set1", labels = member_casual_labels)
           
# Option 3:
Q1234_2020_cleaned1$date <- as.Date( Q1234_2020_cleaned1$started_at) #default format is yyyy-mm-dd, use start date
Q1234_2020_cleaned1$day_of_week <- wday( Q1234_2020_cleaned1$started_at) #calculate the day of the week 
Q1234_2020_cleaned1$day_of_week <- format(as.Date( Q1234_2020_cleaned1$date), "%A") #create column for day of week
Q1234_2020_cleaned1$month <- format(as.Date( Q1234_2020_cleaned1$date), "%m")#create column for month
Q1234_2020_cleaned1$day <- format(as.Date( Q1234_2020_cleaned1$date), "%d") #create column for day
Q1234_2020_cleaned1$year <- format(as.Date( Q1234_2020_cleaned1$date), "%Y") #create column for year
Q1234_2020_cleaned1$time <- format(as.Date( Q1234_2020_cleaned1$date), "%H:%M:%S") #format time as HH:MM:SS
Q1234_2020_cleaned1$time <- as_hms(( Q1234_2020_cleaned1$started_at)) #create new column for time
Q1234_2020_cleaned1$hour <- hour( Q1234_2020_cleaned1$time) #create new column for hour


Q1234_2020_cleaned1 <- Q1234_2020_cleaned1 %>% mutate(time_of_day = 
                                             case_when(hour == "0" ~ "Night",
                                                       hour == "1" ~ "Night",
                                                       hour == "2" ~ "Night",
                                                       hour == "3" ~ "Night",
                                                       hour == "4" ~ "Night",
                                                       hour == "5" ~ "Night",
                                                       hour == "6" ~ "Morning",
                                                       hour == "7" ~ "Morning",
                                                       hour == "8" ~ "Morning",
                                                       hour == "9" ~ "Morning",
                                                       hour == "10" ~ "Morning",
                                                       hour == "11" ~ "Morning",
                                                       hour == "12" ~ "Afternoon",
                                                       hour == "13" ~ "Afternoon",
                                                       hour == "14" ~ "Afternoon",
                                                       hour == "15" ~ "Afternoon",
                                                       hour == "16" ~ "Afternoon",
                                                       hour == "17" ~ "Afternoon",
                                                       hour == "18" ~ "Evening",
                                                       hour == "19" ~ "Evening",
                                                       hour == "20" ~ "Evening",
                                                       hour == "21" ~ "Evening",
                                                       hour == "22" ~ "Evening",
                                                       hour == "23" ~ "Evening")
)

# Option 4:

Q1234_2020_cleaned1 %>% 
  mutate(hour = hour(start_at)) %>% 
  group_by(usertype, hour) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length),
            max_ride=max(ride_length),.groups = "keep") %>% 
  arrange(usertype, hour)

Q1234_2020_cleaned1 %>% 
  mutate(hour = hour(start_at)) %>% 
  group_by(usertype, hour) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length),.groups = "keep") %>% 
  arrange(usertype, hour)  %>% 
  ggplot(aes(x = hour, y = number_of_rides, fill = usertype)) + 
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE)) + #set the y axis to avoid scientific notation
  geom_col(position = "dodge", color="blue") + 
  labs(title="Number of Ride Per hour",
       subtitle = "Casual vs Member",
       caption = "Source: Divvy Trip Data")

# Option 5:
Q1234_2020_cleaned1$started_at <- as.numeric(strftime(Q1234_2020_cleaned1$start_at, format = "%H"))
           
Q1234_2020_cleaned1$day <- weekdays(as.Date(Q1234_2020_cleaned1$started_at))
Q1234_2020_cleaned1$day <- as.factor(Q1234_2020_cleaned1$day)
Q1234_2020_cleaned1$day <- factor(Q1234_2020_cleaned1$day, levels = c("Sunday", "Monday", "Tuesday", 
                                          "Wednesday","Thursday", "Friday", 
                                          "Saturday"))
Q1234_2020_cleaned1 <- separate(subset(Q1234_2020_cleaned1, !is.na(start_at)), starttime, 
                      c("start.date", "start.time"), sep = " ")
Q1234_2020_cleaned1 <- subset(Q1234_2020_cleaned1, select = c(start.date, time.hour, day))
Q1234_2020_cleaned1$start_at <- as.factor(Q1234_2020_cleaned1$start_at)
Q1234_2020_cleaned1.count <- Q1234_2020_cleaned1%>%
  group_by(start.date, time.hour) %>%
  summarize(count = n())   

# Option 6: 
Q1234_2020_cleaned1 <- mutate(Q1234_2020_cleaned1$started_at = factor(Q1234_2020_cleaned1$started_at,0:23))

ggplot(Q1234_2020_cleaned1$started_at,aes(started_at)) +
  geom_bar(fill = "black",width = 0.6) +
  theme_minimal() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

typeof(started_at)
View(Q1234_2020_cleaned1)
head(Q1234_2020_cleaned1)
str(Q1234_2020_cleaned1)

# Option 7:
ggplot(Q1234_2020_cleaned1 , aes(format(started_at, "%U"),fill=member_casual)) +
  geom_bar(stat = "count") +
  labs(x = "Week")+
  theme(axis.text.x = element_text(angle = 90))

# Option 8:
Q1234_2020_cleaned1  %>%
  ggplot(aes(Q1234_2020_cleaned1$started_at, fill=member_casual)) +
  labs(x="Hour of the day") +
  geom_bar()+
  scale_x_continuous(limits = c(0:23))

# Option 9: (SUCCESSFUL!!!!) # How to make it subdive more?
hour <- c("0:00", "1:00", "2:00", "3:00", "4:00", "6:00", "7:00",
                 "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00",
                 "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00",
                 "22:00","23:00")

ggplot(data = Q1234_2020_cleaned1) +
  geom_bar(mapping = aes(x = hour(started_at), fill= member_casual)) +
  facet_wrap(~member_casual) +
  theme(axis.text.x = element_text(angle = 0)) +
  labs(title="Divvy ride trip hourly trend for Casual and Member rider",
       x="Hours",
       y="Number of Rides")

ggplot(data = Q1234_2020_cleaned1) +
  geom_freqpoly(mapping = aes(x = hour(started_at), color= member_casual)) +
  facet_wrap(~Day_of_week) + 
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Hourly distribution of casual rides and member rides for each day of week",
       x="Hours",
       y="Number of Rides")

           # Popular Routes
           # Option 1: (FAILED)
           popular_routes <- Q1234_2020_cleaned1 %>% 
             group_by(start_station_name, end_station_name, member_casual) %>% 
             summarise(ride_freq = n()) %>% 
             add_count(end_station_name, wt = ride_freq, name = "custome_type") %>% 
             ungroup() %>% 
             group_by(member_casual, end_station_name) %>% 
             add_count(end_station_name, wt= ride_freq, name ="destination_total") %>% 
             arrange(start_station_name, end_station_name, member_casual)
           
           condition <- ((is.na(popular_routes$end_station_name)) | (popular_routes$destination_total < 30000))
           
           popular_routes[!condition,] %>% 
             ggplot(aes(y=reorder(end_station_name, desc(end_station_name)), x = customer_type, fill = member_casual)) +
             geom_col(position = "dodge") +
             theme_linedraw() +
             labs(
               x="Ride Frequencies",
               y="Destination",
               fill="Customer Type",
               title = "Popular Routes in 2020",
               subtitle = "Note: For our criteria, 30,000 trips is the bare minimum"
             ) +
             theme(
               axis.text.x = element_text(size = 8),
               axis.text.y = element_text(size = 5, color="Black"),
               plot.title = element_text(size = 12, hjust = 0.5),
               plot.subtitle = element_text(size= 8, hjust = 0.5)
             ) +
             scale_x_continuous(limits = c(0,51000)) +
             scale_fill_brewer(palette = "Set1")
           
           # Option 2: (SUCCESSFUL)
           Q1234_2020_cleaned1 %>% 
             filter(member_casual == "member" & start_station_name != "missing") %>% 
             group_by(start_station_name) %>%
             summarise(ride_freq = n()) %>% 
             arrange(-ride_freq) %>% 
             head(10) %>% 
             ggplot(aes(x = ride_freq, y= reorder(start_station_name, ride_freq), fill= start_station_name)) +
             geom_col(colour="black") +
             theme(text = element_text(size = 10)) +
             labs(title = "Popular Stations in 2020", subtitle = "route taken", y="Start Station")
           
           
           # Bike preferences for Casual and Member 
           # Option 1: Successful
           Q1234_2020_cleaned1 %>% 
             group_by(rideable_type, member_casual) %>% 
             summarise(ride_freq = n(), .groups = "drop") %>% 
             arrange(ride_freq) %>% 
             ggplot(aes(reorder(rideable_type, ride_freq), ride_freq, fill=member_casual)) +
             geom_bar(stat ="identity") +
             labs(title = "Bike Preferences by customer type", 
                  x = "Bike Type", y="Ride Freq", fill="customer type") +
             theme(text= element_text(size=10)) +
             scale_y_continuous() + scale_fill_manual(values = c("casual" = "#e28743", "member" = "#2596be"))