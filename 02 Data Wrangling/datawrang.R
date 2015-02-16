require(tidyr)
require(dplyr)

# I basically used the Data Wrangling.R as a reference to use 

baby <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from BABY"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_wkm285', PASS='orcl_wkm285', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))


<<<<<<< HEAD
#DATA WRANGLE 1
baby %>% select(AGE, BWT, SMOKE) %>% tbl_df
baby %>% select(AGE, BWT, SMOKE) %>% ggplot(aes(x = AGE, y = BWT)) + geom_point() + facet_wrap(~SMOKE)

#BWT are in grams. trying to fix this one.
diamonds %>% group_by(cut,color, clarity) %>% summarise(mean_carat = mean(carat)) #yields 4 columns

baby %>% group_by (LOW,LWT,UI) %>% summarise (mean_bwt = mean(BWT))

diamonds %>% select(cut, clarity) %>% filter(cut %in% c("Good", "Fair")) %>% tbl_df
=======
#BWT are in grams.
baby %>% group_by(RACE) %>% summarise(mean = mean(BWT), n = n()) %>% ggplot(aes(x = RACE, y = mean)) + geom_point()



tbl_df(baby)
baby %>% group_by(RACE) %>% select(SMOKE, RACE, PTL) %>% filter(SMOKE == "yes")  %>% tbl_df


#Plot 4 Does race/age affect who smokes?
baby %>% select(RACE, AGE, SMOKE) %>% ggplot(aes(x=RACE, y=AGE, color= SMOKE)) + geom_point() 

#Plot  Does smoking affect baby weight? 
baby %>% select(AGE, BWT, SMOKE) %>% ggplot(aes(x=AGE, y=BWT, color= SMOKE)) + geom_point()
>>>>>>> 0b14993abf6f7e7a7ffec4f7136f0f5e21e025aa
