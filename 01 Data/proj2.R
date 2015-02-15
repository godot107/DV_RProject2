require(tidyr)
require(dplyr)

baby <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from BABY"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_wkm285', PASS='orcl_wkm285', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

head(baby)

#PLOT 1
ggplot(baby, aes(x=AGE, y=BWT)) + geom_point() +  facet_wrap(~RACE)
#Plot 2 (Mother smoking)
ggplot(baby, aes(x=AGE, y=BWT)) + geom_point() +  facet_wrap(~SMOKE)

#Plot 3 (separate based on race. Check for smoke)
ggplot(baby, aes(x=AGE, y=BWT)) + geom_point(aes(color = as.factor(SMOKE))) + facet_wrap(~RACE)

#Plot4 Does doctor visits affect baby weight?
ggplot(baby, aes(x=FTV, y=BWT)) + geom_point(aes(color = as.factor(RACE)))

#Plot 5 race vs age
ggplot(baby, aes(x=RACE, y=AGE)) + geom_point(aes(color = as.factor(SMOKE)))
