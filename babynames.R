library(babynames)

colnames(babynames) <- c("Year", "Gender", "Name", "Count", "Proportion")

grouped_q6 <- aggregate(Count ~ Name + Gender, data = babynames, FUN = sum)

#sort data by Total in descending order
sorted_names <- grouped_q6[order(-grouped_q6$Count), ]

#convert to data frame to visualize better
sorted_names <- data.frame(sorted_names)

#take the top 20 baby names
top_20 <- head(sorted_names, 20)

#Plot

#first create colors by gender
selected_colors <- ifelse(top_20$Gender == "F", "darkred", "yellow")

#bar plot
barplot(top_20$Count, names.arg = paste(top_20$Name, top_20$Gender),
        xlab = "Baby Names", ylab = "Total Count", las = 2, col = selected_colors,
        main = "Top 20 Baby Names and Counts by Gender", cex.names = 0.7)

#add a legend
legend("topright", legend = c("Male", "Female"), fill = c("yellow", "darkred"), title = "Gender")