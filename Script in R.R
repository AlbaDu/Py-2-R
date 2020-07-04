#importing and printing of the csv files as DF
population <- data.frame(read.csv("C:\\Users\\34609\\Documents\\DataTB\\4.R\\Trans Py2R\\state-population.csv", 
                       header = TRUE, na.strings = c("","NA"), sep = ",")) #na.strings make sure NAs are not read as empty strings
areas <- data.frame(read.csv("C:\\Users\\34609\\Documents\\DataTB\\4.R\\Trans Py2R\\state-areas.csv",
                  header = TRUE, na.strings = c("","NA"), sep = ","))
abbrev <- data.frame(read.csv("C:\\Users\\34609\\Documents\\DataTB\\4.R\\Trans Py2R\\state-abbrevs.csv", 
                   header = TRUE, na.strings = c("","NA"), sep = ","))

colnames(population)[1] = "R"
colnames(abbrev)[2] = "abbrev"
head(population)
head(areas)
head(abbrev)

#putting together the info of population & areas DF by merge function
merged <- merge(population, abbrev, all = TRUE) 
merged$R <- NULL #elimination of duplicated data w/ different column names
head(merged)
dim(merged)

summary(merged) #similar to .describe in Py but also gives the null
null <- is.na(merged$population)
dim(merged)
clean_merged <- na.omit(merged) #elimination of rows with null values
dim(clean_merged)

#putting together the again DFs clean_merged with areas
final <- merge(clean_merged, areas, by = "state", all.x = TRUE)
head(final)

#importing and printing as DF the survey csv file 
survey <- data.frame(read.csv("C:\\Users\\34609\\Documents\\DataTB\\4.R\\Trans Py2R\\fcc_2016_coder_survey_subset.csv", 
                              header = TRUE, na.strings = c("","NA"), sep = ","))
colnames(survey)
survey_coder <- subset(survey, select = c(ID.x, EmploymentField, Age, Income))
head(survey_coder)
summary(survey_coder)
unique(survey_coder$EmploymentField) #show the different EmploymentField present in the survey

#binnarization of the data into age-ranges of 10 years
survey_coder$Age_bin <- c(round((survey_coder$Age)/10))
head(survey_coder)

#
