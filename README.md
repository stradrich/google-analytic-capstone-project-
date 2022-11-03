# google-analytic-capstone-project-

You can check out my portfolio here too, https://sites.google.com/view/aldrich-pinso/home?authuser=0

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

R Attempt 1 (Trying to merge Data from 2013 to 2022, failed)

https://github.com/stradrich/google-analytic-capstone-project-/blob/afa32abd17e031b4ed6c7af614fe0cdd805d3d78/Screenshot%202022-10-13%20at%201.11.11%20PM.png

https://github.com/stradrich/google-analytic-capstone-project-/blob/afa32abd17e031b4ed6c7af614fe0cdd805d3d78/Screenshot%202022-10-13%20at%201.20.19%20PM.png


# PROCESS

I have chosen R programming as my main tool for many reasons. Personally, I'd love to be able to go into Data Science area, other than python, R is more intuitive to code and decipher complexity. For this case study, I want to avoid data overloading and crashing, R can handle that swiftly. I will also use SQL to confirm some of my findings here.  

In this section, I will merge data, change data type, create new columns, etc.

This is part of my workflow. I will be displaying the data types and internal structure as a reference to identify anomalies or commonalities vice versa.

For SQL exploration through Google bigquery sandbox, please use this link

https://github.com/stradrich/google-analytic-capstone-project-/blob/8faaa1b92453f8169bc2b6d6394e94c1461fed8d/SQL

Excel/ Googlesheet Attempt 1 (file too large, failed to upload)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-01%20at%201.03.53%20AM.png

SQL Attempt 1 (file too large, failed to upload)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-01%20at%201.00.09%20AM.png

SQL Attempt 2 (file too large, failed to upload)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%207.33.19%20PM.png

SQL Attempt 3 (trying to merge all 2020 files, code failed)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%207.36.08%20PM.png

SQL Attempt 4 (calculate Q1 docked bike usage)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%208.50.23%20PM.png


SQL Attempt 5 (Total stations)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%208.51.56%20PM.png

SQL Attempt 6 (casual population in Q1)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%208.59.32%20PM.png

SQL Attempt 7 (member population in Q1)

https://github.com/stradrich/google-analytic-capstone-project-/blob/8d65edb31f0c0d7cbfec0d8f6513d7f330a4dc57/Screenshot%202022-10-26%20at%208.59.38%20PM.png


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

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot.png

Casual VS Member weekly bike usage

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot01.png

Casual VS Member monthly bike usage

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot02.png

Popular Riding Hours

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot%20Time.png

Popular Routes

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot03.png

Bike preferences by Casual and Member

https://github.com/stradrich/google-analytic-capstone-project-/blob/2eaec0d26be32b5929bf70bc1891965092cc1210/Rplot04.png

Tableau Attempt 1 (Cleaned Data from R failed to upload on Tableau for further visualisation)

https://github.com/stradrich/google-analytic-capstone-project-/blob/afa32abd17e031b4ed6c7af614fe0cdd805d3d78/Screenshot%202022-10-30%20at%2011.10.51%20PM.png

https://github.com/stradrich/google-analytic-capstone-project-/blob/afa32abd17e031b4ed6c7af614fe0cdd805d3d78/Screenshot%202022-10-30%20at%2011.11.03%20PM.png

https://github.com/stradrich/google-analytic-capstone-project-/blob/afa32abd17e031b4ed6c7af614fe0cdd805d3d78/Screenshot%202022-10-30%20at%2011.11.18%20PM.png

# ACT

* Financial incentives for casual riders during working days, a campaign is needed to entice casual riders opting for healthier and cost effective lifestyle. They can even save time avoiding unnecessary slow traffic. 
* Automatic upgrade to membership for free, casual riders exceeding a certain number of usage could enjoy this.
* A weekly pass, monthly pass, annual pass should be priced so that the option with longer usage become cheapest, this might entice and allow money conscious casual riders to gear towards better options.
* More perks should be given to members, such as getting discounted coffee or breakfast at popular routes.
* Social media is a great tool, influencer on YouTube, Instagram, Facebook, could be featured to promote better lifestyle through bike share
