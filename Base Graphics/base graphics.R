##BASE GRAPHICS


#The GDP of Chennai over 1999 to 2007 : scatterplot

subdata <-  data[which(data$Description == "GDP (in Rs. Cr.)"),
                 names(data) %in% 
                   c("Year","Chennai")]
year <- sample(subdata$Year)

chennai <- round(data$Chennai)

plot.default(year,subdata$Chennai,
     type = 'p',
     col = "blue",
     axes = FALSE,
     main = " The GDP of Chennai(State Capital)")
axis(side = 1, at = as.numeric(subdata$Year), labels = subdata$Year)
axis(side=2, at=subdata$Chennai, labels = round(subdata$Chennai))



#The Comparison of GDP between two cites - Coimbatore and Erode : Bar Plot

subdata <-  data[which(data$Description == "GDP (in Rs. Cr.)"),
                 names(data) %in% 
                   c("Year","Coimbatore", "Erode")]

cities <- as.matrix(cbind(subdata$Coimbatore, subdata$Erode))
colnames(cities) <- c('Coimbatore', 'Erode')
rownames(cities) <- subdata$Year

max = max(subdata$Coimbatore)
barplot(t(cities),
        beside = T,
        col = viridis(2, begin = 1, end = 0,direction = 1),
        ylim = c(0, max),
        xlab = "Years",
        ylab = "GDP (in Rs. Cr.)",
        main = "Comparison of GDP between Coimbatore and Erode")
legend("topleft",
       colnames(cities),
       fill = viridis(2, begin = 1, end = 0,direction = 1),
       cex = 0.7,
       xjust = 1)




##GDP comparison for 4 cities : Line Chart

subdata1 <-data[which(data$Description == "GDP (in Rs. Cr.)"),
                names(data) %in% 
                  c("Year","Chennai","Coimbatore", "Erode", "Madurai")]
cities <- as.matrix(cbind(subdata1$Coimbatore, subdata1$Erode, subdata1$Chennai,subdata1$Madurai))
rownames(cities) <- subdata$Year
colnames(cities) <- c('Coimbatore', 'Erode', 'Chennai', 'Madurai')

matplot(cities,
        type = "o",
        pch = 1,
        col =  magma(4, begin = 1, end = 0,direction = 1),
        lwd = 2,
        lty = 1,
        main = "GDP comparison for 4 cities",
        ylab = "GDP (in Rs. Cr.) "
        )

legend("topleft",
       colnames(cities),
       fill = magma(4, begin = 1, end = 0,direction = 1),
       cex = 0.7,
       xjust = 1)


## GDP comparison of all the cities : Pie Chart
subdata2 <- subset(data, 
                   Year == '2000-01' & Description == "GDP (in Rs. Cr.)",
                   select = -c(Year,Description))
subdata2 <- as.matrix(subdata2)
lbls <-  colnames(subdata2)
pct <- round(subdata2/sum(subdata2)*100)
lbls <- paste(paste(lbls,round(pct),"%",sep=" "))

pie(subdata2, 
    labels = lbls, 
    main = "The GDP of Cities in 2000-01",
    col = rainbow(length(lbls)))


## density of GDP of Salem over the year : Density Plot

salem <- density(data$Salem)

plot(salem, 
     main = "Density of GDP of Salem",
     col = "blue")

## Distribution of GDP of cities in terms of five number summary (“minimum”, first quartile (Q1), median, third quartile (Q3), and “maximum”) : Box Plot
subdata <-  subset(data, 
                   Description == "GDP (in Rs. Cr.)",
                   select = -c(Year,Description))

year <- data[which(data$Description == "GDP (in Rs. Cr.)"),
             names(data) %in% 
               c("Year")]
rownames(subdata) <- year

boxplot(subdata,
        col = c(rainbow(7),magma(10),viridis(10),"chocolate","pink","purple"),
        ylim = c(500,19500),
        main = "Distribution of GDP",
        xlab = "cities",
        ylab = "GDP over 4 cities"
        )

legend("topright",
       colnames(subdata),
       fill = c(rainbow(7),magma(10),viridis(10),"chocolate","pink","purple"),
       cex = 0.6,
       ncol = 3)

##frequency of GDP : Histogram
hist(as.matrix(subdata),
     xlab = "GDP",
     main = "frequency of GDP",
     breaks = 30,
     xlim = c(0,10000),
     col = "chocolate")
