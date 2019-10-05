# loading the emissions and source file

emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

# Subset the Baltimore City
baltimore_city <- emissions_data[emissions_data$fips=="24510", ]

# Total emissions from 1999 to 2008
total_emissions <- with(baltimore_city,aggregate(Emissions,by=list(year), sum))

png("plot2.png")

barplot( total_emissions$x,
         names.arg=total_emissions$Group.1, 
         xlab="Years", 
         ylab="Total PM 2.5 emission",
         main="Total PM 2.5 emissions at Baltimore City various years"
)

dev.off()
