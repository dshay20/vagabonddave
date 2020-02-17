library(tidyverse)
library(dplyr)
recipes <- data.frame(
 row.names = c()
 food_type = c()
 cooking_time = c()
 preparation_time = c()
 list_ingredients = c()
)
grocery_stores <- data.frame(
  stores = c("Publix_1", "Amigos-Latin-Grocery", "Kroger_1", "Publix_2", "Walmart-Neighborhood-Market", "Food-Lion", "Kroger-Marketplace", "Asia-Market", "Whole-Foods-Market", "Kroger_2"),
  address = c("5500 Abercorn St Ste 2", "12333 Largo Drive", "7 Diamond Causeway", "11701 Abercorn Street", "10530 Abercorn Street", "8914 White Bluff Road", "318 Mall Blvd", "117 E. Montgomery Crossroads", "1815 E Victory Drive", "1900 E Victory Drive"),
  drive_time = c(10L, 10L, 7L, 12L, 7L, 7L, 8L, 5L, 13L, 13L),
  stringsAsFactors = FALSE
)
view(grocery_stores)
colnames_gs <- as.data.frame(t(grocery_stores))
view(colnames_gs)
print(grocery_stores[])

items_in_season <- data.frame(
  months = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"),
  apples = c(F, F, F, F, F, F, F, T, T, T, T, F),
  arugula = c(F, F, F, T, T, T, F, F, F, F, F, F),
  asparagus = c(F, F, F, T, T, T, F, F, F, F, F, F),
  basil = c(F, F, F, F, T, T, T, T, T, F, F, F),
  beans = c(F, F, F, F, T, T, T, T, T, T, F, F),
  beets = c(F, F, F, T, T, T, F, F, F, F, F, F),
  blueberries = c(F, F, F, F, T, T, T, T, F, F, F, F),
  bok_choy = c(T, T, T, T, T, T, F, F, F, T, T, T),
  broccoli = c(F, F, F, F, T, T, F, F, F, T, T, T),
  brussels_sprouts = c(T, T, F, F, F, F, F, F, F, F, T, T),
  cabbage = c(T, T, T, T, T, F, F, F, F, T, T, T),
  cantaloupes = c(F, F, F, F, F, T, T, T, F, F, F, F),
  carrots = c(T, T, T, T, T, F, F, F, F, T, T, T),
  cauliflower = c(F, F, F, F, F, F, F, F, F, T, T, T),
  celery = c(T, T, F, F, F, F, F, F, F, T, T, T),
  chard = c(T, T, T, T, T, F, F, F, F, T, T, T),
  collard_greens = c(T, T, T, T, T, T, F, F, F, T, T, T),
  corn = c(F, F, F, F, F, T, T, F, F, F, F, F),
  cucumbers = c(F, F, F, F, F, T, T, T, F, F, F, F),
  edamame = c(F, F, F, F, F, T, T, T, T, F, F, F),
  eggplant = c(F, F, F, F, F, T, T, T, T, T, F, F),
  figs = c(F, F, F, F, F, F, T, T, F, F, F, F),
  garlic = c(F, F, F, F, T, T, T, T, T, T, F, F),
  green_garlic = c(F, F, T, T, T, F, F, F, F, F, F, F),
  grapes = c(F, F, F, F, F, F, T, T, T, T, F, F),
  kale = c(T, T, T, T, T, F, F, F, F, T, T, T),
  leeks = c(T, T, T, T, T, F, F, F, F, T, T, T),
  lettuce = c(T, T, T, T, T, T, F, F, T, T, T, T),
  melons = c(F, F, F, F, F, T, T, T, T, F, F, F),
  mushrooms = c(T, T, T, T, T, T, T, T, T, T, T, T),
  okra = c(F, F, F, F, T, T, T, T, T, T, F, F),
  onions = c(F, F, T, T, T, T, T, T, T, T, T, F),
  parsnips = c(F, F, F, F, F, F, F, F, F, T, T, T),
  peaches = c(F, F, F, F, T, T, T, T, F, F, F, F),
  peas = c(F, T, T, T, T, F, F, F, F, F, F, F),
  pecans = c(F, F, F, F, F, F, F, F, T, T, T, T),
  peppers = c(F, F, F, F, F, T, T, T, T, F, F, F),
  persimmons = c(F, F, F, F, F, F, F, F, T, T, T, F),
  plums = c(F, F, F, F, T, T, T, F, F, F, F, F),
  pluots = c(F, F, F, F, T, T, T, F, F, F, F, F),
  potatotes = c(F, F, F, F, T, T, T, T, F, F, F, F),
  radishes = c(F, F, T, T, T, T, F, F, F, F, F, F),
  spinach = c(T, T, T, T, T, F, F, F, F, F, T, T),
  squash_summer = c(F, F, F, F, T, T, T, T, T, T, F, F),
  squash_winter = c(F, F, F, F, F, F, F, T, T, T, T, T),
  strawberries = c(F, F, F, T, T, T, F, F, F, F, F, F),
  sweet_onions = c(F, F, F, F, T, T, F, F, F, F, F, F),
  sweet_potatoes = c(T, T, F, F, F, F, F, T, T, T, T, T),
  tomatoes = c(F, F, F, F, F, T, T, T, T, T, F, F),
  turnips = c(T, T, T, T, F, F, F, F, F, T, T, T),
  watermelons = c(F, F, F, F, F, T, T, T, T, F, F, F),
  zucchini = c(F, F, F, F, T, T, T, T, T, T, F, F),
  stringsasFactors= FALSE
)
# useful in searching the number of months "produce" is in season
table(items_in_season$apples)["TRUE"]
# useful in searching which produce is available in "month"
colnames <- as.data.frame(t(items_in_season))
view(colnames)
# useful in calculating quantity of items available in "month"
table(colnames$V12)["TRUE"]


