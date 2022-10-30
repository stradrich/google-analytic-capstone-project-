# google-analytic-capstone-project-


# ASK

Introduction
This is part of Google Data Analytics capstone project, sponsored by *Grow with Google Malaysia*. By solving real life situation, I'm able to experience the work of a data analyst and at the same time building a career portfolio.

In this case study, we need to answer business questions posed by Cyclistic bike-share company. I'm assigned to work with the director of marketing and analytics, Lily Moreno and Cyclistic marketing analytics team. To confirm Madam Moreno's hypothesis, which is to maximize the number of annual membership, more data driven insights are required. A new design for marketing strategy, which is to convert casual riders into annual memberships, can only commence after achieving positive approval by Cyclisitc executives team.

As of 2016, Cyclistic bike-share program features more than 5,824 bicycles and 692 docking station, we are able to accurately pinpoint these fleet of asset with geotracking devices, it comes with different types of bike, reclining bikes, hand tricycles, and cargo bikes, offering better quality of life to the people in Chicago city.

Backed by Cyclistic's finance analyst, annual members are more profitable than casual rides. Currently, its pricing flexibility helps Cyclisitc to attract more customers, however for future growth, Madam Moreno believes in maximising existing casual riders which is fammiliar with the program that full fill their mobility needs. 

Asking the right questions:
* Who are the controlled group?
* What is profitable and what isn't?
* How to convert casual riders into signing up as member?
* What is the future growth of Cyclistics bike-share?

# PREPARE
Read and understand the terms and condition from the provided  [Divvy Bike Data License Agreement](https://ride.divvybikes.com/data-license-agreement)

Data is split into pre-pandemic (2014-2018); pandemic (2019); towards post-pandemic (2020-present). By looking at the historical data in this way, it makes more sense to me, because we get to compare the impact of such crisis.

Please note that this timeline is just a reference. WHO hasn't publicly announced the end of Covid-19 pandemic, although most countries are vaccinated now and people start moving freely again.

Due to time constraint and minimizing the chances of data overloading and crashing, I will only analyse the year of 2020.


# PROCESS

I have chosen R programming as my main tool for many reasons. Personally, I'd love to be able to go into Data Science area, other than python, R is more intuitive to code and decipher complexity. For this case study, I want to avoid data overloading and crashing, R can handle that swiftly. I will also use SQL to confirm some of my findings here.  

In this section, I will merge data, change data type, create new columns, etc.

This is part of my workflow. I will be displaying the data types and internal structure as a reference to identify anomalies or commonalities vice versa. 

For SQL exploration, please use this [https://github.com/stradrich/google-analytic-capstone-project-/blob/8faaa1b92453f8169bc2b6d6394e94c1461fed8d/SQL]


# ANALYZE
Overall population stastistic (such as mean, midpoint, average, min, max)                            
Total population (calculate mean, midpoint, average, min, max)
Ride duration statistics
Rideable type statistic
Rideable type population
Customer rideable preferences
Find the population for casuals (calculate mean, midpoint, average, min, max)

# SHARE
Plot distribution total population (Membership VS Casual)
Casual VS Member weekly bike usage
Casual VS Member monthly bike usage
Popular Riding Hours
Popular Routes
Bike preferences by Casual and Member

# ACT

* Financial incentives for casual riders during working days, a campaign is needed to entice casual riders opting for healthier and cost effective lifestyle. They can even save time avoiding unnecessary slow traffic. 
* Automatic upgrade to membership for free, casual riders exceeding a certain number of usage could enjoy this.
* A weekly pass, monthly pass, annual pass should be priced so that the option with longer usage become cheapest, this might entice and allow money conscious casual riders to gear towards better options.
* More perks should be given to members, such as getting discounted coffee or breakfast at popular routes.
* Social media is a great tool, influencer on YouTube, Instagram, Facebook, could be featured to promote better lifestyle through bike share
