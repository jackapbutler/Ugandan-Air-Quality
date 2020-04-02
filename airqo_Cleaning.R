data <- read.csv('C:/Users/jacka/Desktop/Air Quality/airqo_metadata.csv', header = T)
library(cluster)
library(dplyr)
data <- select(data, -c(location))
data

# view missing data
library(mice)
md.pattern(data)

library(VIM)
aggr_plot <- aggr(data, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, 
                  labels=names(data), cex.axis=.7, gap=3, 
                  ylab=c("Histogram of missing data","Pattern"))
 
# cleaning data
clean_data <- mice(data, m = 500, meth='pmm')
clean_data$imp$dist_primary
clean_data$imp$dist_primary > 5000
