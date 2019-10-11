library('tidyverse')

setwd("C:/Users/grund/Documents/MKTG420/CVS")

myfiles <- list.files()
for (file in myfiles){
  print(file)
  temp <- read.csv(file)
  temp <- temp %>% filter(own_title == "Private") %>% select(area_title,lq_annual_avg_emplvl,annual_avg_wkly_wage,lq_annual_avg_estabs_count,year,lq_annual_avg_wkly_wage,annual_avg_estabs_count,annual_avg_emplvl)
  temp <- dplyr::filter(temp, grepl("Statewide",area_title))
  temp <- temp %>% separate(area_title, c('area_title'), sep = '-- Statewide', remove = FALSE)
  write.csv(temp,file = paste(file,"filtered.csv"),row.names = FALSE)
}