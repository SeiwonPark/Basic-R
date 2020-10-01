# Load file
readfile <- read.csv("feeds.csv")
#interveningTime <- as.Date(readfile$created_at)
entry <- as.numeric(readfile$entry_id)
temperature <- as.numeric(readfile$field1)
humidity <- as.numeric(readfile$field2)
pressure <- as.numeric(readfile$field3)

# Process Data
#refined_interveningTime <- gsub('[KST]', '', interveningTime)
#refined_interveningTime <- gsub(' +$', '', refined_interveningTime)
#refined_interveningTime
df <- data.frame(Entry=entry, Temperature=temperature, Humidity=humidity, Pressure=pressure)

# Plot
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)
theme_set(theme_bw())

gg1 <- ggplot(df, aes(x=Entry, y=Temperature)) +
  geom_point(aes(col=Temperature)) +
  scale_color_gradient(low="yellow", high="red") +
  geom_smooth(method = lm, formula = y ~ splines::bs(x, 8), se=T, color="red")

gg2 <- ggplot(df, aes(x=Entry, y=Humidity)) +
  geom_point(aes(col=Humidity)) +
  scale_color_gradient(low="skyblue", high="blue") +
  #scale_colour_gradientn(colours = rainbow(100)) +
  geom_smooth(method = lm, formula = y ~ splines::bs(x, 8), se=T)

gg3 <- ggplot(df, aes(x=Entry, y=Pressure)) +
  geom_point(aes(col=Pressure)) +
  scale_color_gradient(low="white", high="black") +
  geom_smooth(method = lm, formula = y ~ splines::bs(x, 8), se=T)

grid.arrange(gg1, gg2, gg3, nrow=3)
