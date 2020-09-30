### Solution for the exercise for session 3


# Loading packages 

  library(MASS)
  library(ggplot2)

# Load data
  
  data(birthwt)

# Create basic barplot of subjective health
  
  plot <- ggplot(data=birthwt,
                 mapping=aes(race))+
          geom_bar()
  plot # To look at it

# Nicer version
  
  plot <- ggplot(data=birthwt,
                 mapping=aes(x=race))+
          geom_bar(stat="count",
                   color="black",
                   fill="steelblue") +
          labs(x="Ethnicity",y="Absolute counts",
               title="Barplot using birthwt")+
          scale_x_discrete(limits=c("White","Black",
                              "Other"))
  plot
