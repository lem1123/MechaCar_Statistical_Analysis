### Module 15 Challenge - MechaCarChallenge

## Deliverable 1 

# Use the library() function to load the dplyr package.

library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe.

MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 as the data parameter.

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

## Deliverable 2 

# Import and read in the Suspension_Coil.csv file as a table.

Mecha_suspension <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors = F)

# Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.

total_summary <- Mecha_suspension %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),VAR_PSI=var(PSI), Std_Dev_PSI=sd(PSI),Num_Coil=n(), .groups = 'keep')

# Create a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.

lot_summary <- Mecha_suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI),VAR_PSI=var(PSI), Std_Dev_PSI=sd(PSI),Num_Coil=n(), .groups = 'keep')

## Deliverable 3 

# Create t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.

t.test(Mecha_suspension$PSI,mu=1500)

# Create three more t.test() functions and their subset() arguments to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

lot1 <- subset(Mecha_suspension, Manufacturing_Lot=='Lot1')

lot2 <- subset(Mecha_suspension, Manufacturing_Lot=='Lot2')

lot3 <- subset(Mecha_suspension, Manufacturing_Lot=='Lot3')

t.test(lot1$PSI,mu=1500)

t.test(lot2$PSI,mu=1500)

t.test(lot3$PSI,mu=1500)
