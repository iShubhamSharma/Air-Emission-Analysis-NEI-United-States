# loading the emissions and source file

emissions_data <- readRDS("summarySCC_PM25.rds")
source_file <- readRDS("Source_Classification_Code.rds")

# Total emissions from 1999 to 2008
total_emissions <- with(emissions_data,aggregate(Emissions,by=list(year), sum))


# Creating a png Plot
png(filename = "plot1.png")

barplot(total_emissions$x ,
         names.arg=total_emissions$Group.1, 
         xlab="Years", 
         ylab="Total PM 2.5 emission",
         main="Total PM 2.5 emissions at various years"
)
dev.off()

