#load the library
library(ggplot2)

# loading the emissions and source file
emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

# To have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City

baltimore_city_vehicle <- emissions_data[emissions_data$fips=="24510" & emissions_data$type=="ON-ROAD", ]

png("Plot5.png")

plot5_viz <- ggplot(baltimore_city_vehicle,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 From Motor Vehicle Sources"))

print(plot5_viz)

dev.off()
