library(dslabs)
library(tidyverse)
library(NHANES)
data(NHANES)
data(murders)
#Rank the murder rate descending
rate = (murders$total/murders$population) * 1000000
murders <- mutate(murders, rank = rank(-rate), rate=rate)
#Use filter to show the top 5 states with the highest murder rates. After we add murder rate and
#rank, do not change the murders dataset, just show the result
filter(murders, rank <= 5)
#Create a table called my_states that contains rows for states satisfying both the conditions:
#it is in the Northeast or West and the murder rate is less than 10.
#Use select to show only the state name, the rate and the rank
my_states <- filter(murders, (region == "Northeast" | region == "West") & rate < 10)
select(my_states, state, rate)
