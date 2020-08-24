### Second session: Descriptive statistics ##########################

### Example data ####################################################

  # Package coming with R
  library(MASS)

  # Load data coming with MASS package
  data(birthwt)
  
  # Get help on data
  help(birthwt)
  

### Viewing data ####################################################

  # View data in console
  birthwt
  
  # Class of object
  class(birthwt) 
  
  # Overview of data
  head(birthwt)
  tail(birthwt)
  view(birthwt) # Or click in R Studio under "Environment" tab
  
  # Variable names
  names(birthwt)
  
  # Size of data set
  dim(birthwt)


### View parts of data ##############################################

  # Variable names
  birthwt$bwt # Vector
  birthwt["bwt"] # Data frame


### Descriptive statistics ##########################################

  # Mean
  mean(birthwt$bwt)
  mean(birthwt$age)
  
  # Median
  median(birthwt$bwt)
  median(birthwt$age)
  
  # Standard deviation
  sd(birthwt$bwt)
  sd(birthwt$age)
  
  # Variance
  var(birthwt$bwt)
  var(birthwt$age)
  
  # Quantiles
  quantile(birthwt$bwt)
  quantile(birthwt$age)
  
  # Summary
  summary(birthwt$bwt)
  summary(birthwt)


### Tables ##########################################################

  # Simple tables 
  table(birthwt$age)
  table(birthwt$low)
  
  # Cross tabulations
  table(birthwt$low,birthwt$smoke)
  table(birthwt$low,birthwt$smoke,dnn=c("Low","Smoke"))
  
  # Tables can be stored in objects
  tab <- table(birthwt$low,birthwt$smoke,dnn=c("Low","Smoke"))
  
  # Proportions
  prop.table(tab)
  prop.table(tab,1)
  prop.table(tab,2)


### Real example ####################################################

  # Source:
  # https://www.aeaweb.org/articles?id=10.1257/0002828042002561 
  # Also discussed in 
  # Imai, K. (2017): Quantitative Social Science.
  # Data comes from Imai's GitHub

  # Load data
  experiment <- read.csv("https://raw.githubusercontent.com/kosukeimai/qss/master/CAUSALITY/resume.csv")
  head(experiment)
  
  ### EXERCISE:
  # Create a cross-table of 'race' and 'call' with
  # relative frequencies such that the resulting
  # table allows to compare whether Black or white
  # names got more callbacks.

  ### SOLUTION:
  tab <- table(experiment$race,experiment$call,dnn=c("Race","Call"))
  prop.table(tab,1)