  powr <- read.table("power.txt", sep=";", header=T,  na.strings="?")
  powr$Date <- as.Date(powr$Date, format="%d/%m/%Y")
