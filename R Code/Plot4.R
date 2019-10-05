#load the library
library(ggplot2)

# loading the emissions and source file
emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

# To find how have emissions from coal combustion-related sources changed from 1999-2008
# Find word 'coal'

source_file.sub <- source_file[grepl("Coal" , source_file$Short.Name), ]
emissions_data.sub <- emissions_data[emissions_data$SCC %in% source_file.sub$SCC, ]

png("Plot4.png")

plot4_viz <- ggplot(emissions_data.sub, aes(x = factor(year), y = Emissions, fill =type)) + 
    geom_bar(stat= "identity", width = .4) + xlab("Year") +
    ylab("Coal-Related PM2.5 Emissions") + 
    ggtitle("Total Coal-Related PM2.5 Emissions")

print(plot4_viz)

dev.off()
