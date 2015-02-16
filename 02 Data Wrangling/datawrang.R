require(tidyr)
require(dplyr)

# I basically used the Data Wrangling.R as a reference to use 

baby <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from BABY"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_wkm285', PASS='orcl_wkm285', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

baby %>% select(AGE, BWT) %>% tbl_df


#Plot 2 does smoking cause hyper tension? 
#PRETTY SURE THEYRE LYING ABOUT THEIR HYPERTENSION!! lol
baby %>% select(RACE, LWT, AGE, SMOKE, HT) %>% ggplot(aes(x=AGE, y=LWT, color= SMOKE)) + geom_point() + facet_wrap(~HT)


#Plot 3 Age vs Last weight. Is there a trend among race?
baby %>% select(RACE, AGE, LWT) %>% ggplot(aes(x=AGE, y=LWT, color= RACE)) + geom_point() 


#Plot 4 Does race/age affect who smokes?
baby %>% select(RACE, AGE, SMOKE) %>% ggplot(aes(x=RACE, y=AGE, color= SMOKE)) + geom_point() 

#Plot  Does smoking affect baby weight? 
baby %>% select(AGE, BWT, SMOKE) %>% ggplot(aes(x=AGE, y=BWT, color= SMOKE)) + geom_point()
