library(dplyr)
library(data.table)
library(ggplot2)
library(tidyverse)
hoftc <- read.csv("C:\\Users\\david\\Desktop\\HofTC\\HofTC_3.csv")
as.data.frame(hoftc)
hoftc_filter <- select(hoftc, Last.4, Last.Name, Transaction.Type, Date, Time, MM..)
hoftc_FOODPURCHASE <- filter(hoftc_filter, Transaction.Type == "FOOD PURCHASE")
hoftc_DD = hoftc_FOODPURCHASE %>%
  group_by(Last.4, Date) %>%
  mutate(count = n())
hoftc_Double <- filter(hoftc_DD, count >= 2)
hoftc_duplicate <- select(hoftc_Double, Last.4, Date, count, MM..)
duplicated(hoftc_duplicate)
hoftc_unduplicated <- hoftc_duplicate[!duplicated(hoftc_duplicate),]
view(hoftc_unduplicated)
write.table(hoftc_unduplicated, "C:\\Users\\david\\Desktop\\HofTC\\unduplicated_2.txt", sep="\t")

