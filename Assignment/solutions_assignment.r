### 1a ########################################################################

  # SOEP data can be downloaded here:
  # https://www.diw.de/documents/dokumentenarchiv/17/diw_01.c.412698.de/soep_lebensz_en.zip

  # To load Stata data
  library(foreign)

  # Read file
  file <- "D:/soep_lebensz_en.dta"
  soep <- read.dta(file,convert.factors=F)
  
  
### 1b ########################################################################

  # Number of unique IDs
  length(unique(soep$id))
  

### 1c ########################################################################
  
  # Tabulate number of obs per year
  table(soep$year)
  # For example, there are 3198 obs for 2000
  
  
### 1d ########################################################################
  
  # Load tidyverse
  library(tidyverse)
  
  # Restrict data
  soep_2004 <- soep %>% filter(year==2004)
  
  # Restrict data, base R alternative, not run
  # soep_2004 <- subset(soep,subset=year==2004)
  
  # Simple check whether it worked
  table(soep_2004$year)
  
  # Proportion of females
  table(soep_2004$sex) %>% prop.table()
  # About 54% are female  
  
  # Average satisfaction by sex (tidyverse variant)
  soep_2004 %>% group_by(sex) %>% summarize(mean=mean(health_org))
  
  # Average satisfaction by sex (base R)
  by(soep_2004$health_org,soep_2004$sex,mean)
  # Females are slightly less satisfied 
  
  
### 2a ########################################################################
  
  # Package to conveniently load HMD data
  # install.packages(HMDHFDplus)
  library(HMDHFDplus)
  
  # Needed for HMDHFDplus
  #pw <- "password" # Put your HMD password here
  #us <- "username" # Put your HMD username here
  
  # Load Swedish data
  e0swe <- readHMDweb(CNTRY="SWE",item="E0per",
                      username=us,password=pw)
  
  # Plot using ggplot
  ggplot(data=e0swe)+
    geom_line(aes(x=Year,y=Female,color="red"))+
    geom_line(aes(x=Year,y=Male,color="blue"))+
    labs(x="Year",y="e0",
         title="Life expectancy in Sweden",
         caption="Source: HMD")+
    scale_color_manual(labels=c("Men", "Women"), 
                       values = c("blue", "red"),
                       name="Gender")
 
  # Basic plot for females (base R variant)
  plot(e0swe$Year,e0swe$Female,type="l",
       xlab="Year",ylab="e0",
       panel.first=grid(),col="red",
       main="Life expectancy in Sweden")
  # Adding males
  lines(e0swe$Year,e0swe$Male,col="blue")
  # Adding legend
  legend(x=1750,y=80,lty=1,
         col=c("red","blue"),
         legend=c("Females","Males"))
  
  
### 2b ########################################################################
  
  # Calculate gender gap
  e0swe <- e0swe %>% mutate(gendergap=Female-Male)

  # Plot
  plot(e0swe$Year,e0swe$gendergap,type="l",
       xlab="Year",ylab="Female e0-male e0",
       panel.first=grid(),col="red",
       main="Gender gap in life expectancy in Sweden",
       ylim=c(-1,7))
  abline(h=0)
  # I include the range from -1 to 7 for the y-axis in the plot
  # as this allows to include a reference line at zero.
  # For values below that line males are doing better and
  # values above the reference line mean that women are doing better.
  # This makes reading the figure a bit easier: You can immediately see
  # that women in Sweden have always been doing better than men
  
  
