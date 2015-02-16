require(tidyr)
require(dplyr)

# I basically used the Data Wrangling.R as a reference to use 

baby <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from BABY"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_wkm285', PASS='orcl_wkm285', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

baby %>% select(AGE, BWT) %>% tbl_df

#BWT are in grams.
baby %>% group_by(RACE) %>% summarise(mean = mean(BWT), n = n()) %>% ggplot(aes(x = RACE, y = mean)) + geom_point()



tbl_df(baby)
baby %>% group_by(RACE) %>% select(SMOKE, RACE, PTL) %>% filter(SMOKE == "yes")  %>% tbl_df


#Plot 4 Does race/age affect who smokes?
baby %>% select(RACE, AGE, SMOKE) %>% ggplot(aes(x=RACE, y=AGE, color= SMOKE)) + geom_point() 

#Plot  Does smoking affect baby weight? 
baby %>% select(AGE, BWT, SMOKE) %>% ggplot(aes(x=AGE, y=BWT, color= SMOKE)) + geom_point()
