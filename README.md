##hurricane-baby-names
====================
### Analysis of baby name popularity after a landfalling named hurricane
====================
#### Data:

####1. `hurricanes.csv` - created from spreadsheet published with Jung et al. paper "Female hurricanes are deadlier than male hurricanes" http://www.pnas.org/content/early/2014/05/29/1402786111.abstract
#### Note : Data for Hurricane Katrina was not included in this data set. I added it separately. 

#### 2. Baby name data from `babynames` R package. https://github.com/hadley/data-baby-names
====================
#### Code: 

#### 1. `babyname.R` - defines two funtions. 1) `name_ts` - generates a time series plot of usage of a particular baby name using the `babynames` package. 2) name_rank - returns the rank of a particular baby name in a specified year.
#### 2. `babycanes.R` - calculates the change in baby name usage before and after each hurricane in the `hurricanes.csv` data set. Calculates the difference (after - before) for each name.
#### 3. `diff.vs.fatalities.R` - plots the change in baby name usage vs the fatalities for each hurricane in the hurricane dataset. Also plots linear regression line and 95% confidence area.
