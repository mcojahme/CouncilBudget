#Analysis for 2016 City Council Budget Data
library(dplyr)
library(ggplot2)

raw.df <- read.csv('data/2016CityCouncilBudgetandExpensesDetailedandSummary_Councillors.csv', skip=3, nrows=10)
str(raw.df)

df <- raw.df %>%
  transmute(Councillor = Councillor, Expenses = Total.Councillors.Expenses) %>% 
  mutate(Expenses = as.numeric(gsub("[$|,]", "", Expenses))) %>% 
  transform(Councillor = reorder(Councillor, Expenses))

plot <- ggplot(df) + 
  geom_bar(aes(x=Councillor, y=Expenses), stat="identity") +
  xlab("") + ylab("Total Expenses (Dollars)") + coord_flip()
print(plot)