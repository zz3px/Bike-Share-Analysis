trip <- read.csv("C:/Users/sony/Desktop/2016fall/Stat3250/project/trip.csv", stringsAsFactors = F, header = T, na.strings = "", quote = "")
libray(data.table)
weather <- fread("C:/Users/sony/Desktop/2016fall/Stat3250/project/weather.csv", stringsAsFactors = F, header = T, na.strings = "")
station <- fread("C:/Users/sony/Desktop/2016fall/Stat3250/project/station.csv", stringsAsFactors = F, header = T, na.strings = "")

trip$starttime <- mdy_hm(trip$starttime)

trip %>% group_by(month) %>% summarise(mean.rides = mean(tripduration, na.rm = T)) %>%
  plot_ly(x = ~month, y = ~mean.rides, type = "scatter", mode = "markers+lines", 
marker = list(size = 10, color = "red"), line = list(size = 5, color = "blue")) %>% 
  layout(title = "Trip duration in a particular month")