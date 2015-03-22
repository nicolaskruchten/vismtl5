
library(ggplot2)

mps = read.csv("mps.csv")

mps$Province = factor(mps$Province, levels=c("British Columbia", "Alberta", "Saskatchewan",
    "Manitoba", "Territories", "Ontario", "Quebec", "New Brunswick", "Prince Edward Island", 
    "Nova Scotia", "Newfoundland and Labrador"))
levels(mps$Province) = c("BC", "AB", "SK", "MB", "YK/NT/NU", "ON", "QC", "NB", "PE", "NS", "NL")

mps$Party = factor(mps$Party, levels=c("Conservative", "NDP", "Liberal", "Bloc Quebecois", "Green"))
levels(mps$Party) = c("CON", "NDP", "LIB", "BLQ", "GRN")

ggplot(subset(mps, !is.na(Age)), aes(x=Age, fill=factor(Gender), color=factor(Gender))) +
  geom_dotplot(stackgroups = TRUE, binwidth=5, method="histodot") +
  facet_grid(Party~Province, space="free_y", scales="free_y") +
  scale_y_continuous(breaks = NULL) +
  theme(legend.position="bottom", legend.title=element_blank())  + 
  labs(y="", x="Age in bins of 5 years", color="", fill="", title = expression(atop(
    "Canadian Members of Parliament in 2012 by Province, Party, Age & Gender", 
     atop(italic("each dot represents one MP; 3 are missing due to unknown birthdates"), ""))))

ggsave(file="dotplot.png", width=11, height=8.5, units="in")



