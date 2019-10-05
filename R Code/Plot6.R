#load the library
library(ggplot2)

# loading the emissions and source file
emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", source_file$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- source_file[vehicles,]$SCC
vehiclesNEI <- emissions_data[emissions_data$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
vehiclesBaltimore <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBaltimore$city <- "Baltimore City"

vehiclesLA <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLA$city <- "Los Angeles County"

# Combine the two subsets with city name into one data frame
bothCities <- rbind(vehiclesBaltimore,vehiclesLA)

png("plot6.png")

plot6_viz <- ggplot(bothCities, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    guides(fill=FALSE) + theme_bw() +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(plot6_viz)

dev.off()
