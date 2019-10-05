#load the library
library(ggplot2)

# loading the emissions and source file
emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

# Subset the Baltimore City
baltimore_city <- emissions_data[emissions_data$fips=="24510", ]

png("Plot3.png")

plot3_viz <- ggplot(baltimore_city,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(plot3_viz)

dev.off()
