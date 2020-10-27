#' Predictions by Paul the Octopus in the 2008 UEFA Cup.
#'
#' A dataset containing the predictions and outcomes of matches
#' in the 2008 UEFA European Cup.
#'
#' @format A data frame with 6 rows and 4 variables:
#' \describe{
#'   \item{Match}{countries playing}
#'   \item{Prediction}{country predicted to win}
#'   \item{Result}{score at the end of the match}
#'   \item{Outcome}{whether Paul was correct or incorrect}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Paul_the_Octopus}
"uefa2008"

#' Predictions by Paul the Octopus in the 2010 Fifa World Cup.
#'
#' A dataset containing the predictions and outcomes of matches
#' in the 2010 FIFA European Cup.
#'
#' @format A data frame with 8 rows and 4 variables:
#' \describe{
#'   \item{Match}{countries playing}
#'   \item{Prediction}{country predicted to win}
#'   \item{Result}{score at the end of the match}
#'   \item{Outcome}{whether Paul was correct or incorrect}
#' }
#' @source \url{https://en.wikipedia.org/wiki/Paul_the_Octopus}
"fifa2010"

#' FIFA 2010 team statistics
#' 
#' Statistics for all teams playing in the 2010 FIFA world cup.
#' 
#' @format A data frame with 11 variables and 32 rows
#' \describe{
#'   \item{nr}{Unique numeric identifier for each team}
#'   \item{team}{Name of the team (i.e. country)}
#'   \item{matches_played}{Number of matches played}
#'   \item{goals_for}{Total goals counted against their opponents}
#'   \item{goals_scored}{Total goals scored against their opponents}
#'   \item{goals_against}{Goals counted against the team}
#'   \item{penalty_goal}{Number of penalty goals scored}
#'   \item{own_goals_for}{Number of own goals}
#'   \item{yellow_cards}{Number of yellow cards}
#'   \item{indirect_red_cards}{Number of indirect red cards}
#'   \item{direct_red_cards}{Number of direct red cards}
#' }
#' @source FIFA website. \url{https://www.fifa.com/worldcup/archive/southafrica2010/statistics/teams/goal-scored} and \url{https://www.fifa.com/worldcup/archive/southafrica2010/statistics/teams/disciplinary}
"fifa2010teams"

#' Anchoring
#'
#' Numerical judgments of the height of the Mount Everest after a low or high anchor.
#' This dataset comes from the ManyLabs 1 study
#'
#' @format A data frame with 4632 rows and 5 variables:
#' \describe{
#'   \item{session_id}{Unique identifier for participants}
#'   \item{sex}{Sex of participant (f = female, m = male)}
#'   \item{age}{Age of participant in years}
#'   \item{citizenship}{Country code of citizenship}
#'   \item{referrer}{Location of data collection. Site abbreviations used here can be matched up to the full site name in the online supplement \url{https://osf.io/wx7ck/}}
#'   \item{us_or_international}{Was the study conducted on a US sample or international sample?}
#'   \item{lab_or_online}{Was the study conducted online or in-lab?}
#'   \item{anchor}{anchor, whether high or low}
#'   \item{everest_feet}{judged height of Mount Everest in feet. Converted from meters if given in meters.}
#'   \item{everest_meters}{judged height of Mount Everest in meters. Only contains values when judgment was actually given in meters.}
#' }
#' @source  \url{https://osf.io/pqf9r/}. See also Klein, R. A., Ratliff, K. A., Vianello, M., Adams, R. B., Jr., Bahník, Š., Bernstein, M. J., . . ., Nosek, B. A. (2014). Investigating variation in replicability: A "many labs" replication project. Social Psychology, 45(3), 142-152. \url{http://dx.doi.org/10.1027/1864-9335/a000178}
"anchoring"

#' Trump votes in 2016 for 50 US states and the District of Columbia
#'
#'
#' @format A data frame with 4632 rows and 5 variables:
#' \describe{
#'   \item{state}{Name of the state}
#'   \item{hate_groups}{Number of hate groups in the state in 2016 as reported by the Southern Poverty Law Center (\url{https://www.splcenter.org/hate-map})}
#'   \item{population}{Number of citizens in the state in 2016}
#'   \item{hate_groups_per_million}{Number of hate groups per million citizens}
#'   \item{percent_bachelors_degree_or_higher}{Percentage of citizens with a bachelor's degree of higher}
#'   \item{percent_in_poverty}{Percentage of citizens below the poverty threshold}
#'   \item{percent_Trump_votes}{Percentage of votes for Trump in the 2016 elections}
#' }
#' @source CSI Without Dead Bodies "Hate Groups and Trump's Vote%: Predictive effect present when education and poverty are considered" \url{https://www.csiwithoutdeadbodies.com/2017/02/hate-groups-and-trumps-vote-predictive.html}
"trump2016"

#' Legacy motives and pro-environmental behaviour
#' 
#' 
#' @format A data frame with 245 rows and 9 variables:
#' \describe{
#'   \item{id}{(numeric) ID variable relating to the original dataset}
#'   \item{sex}{(character) biological sex of participant (male or female)}
#'   \item{age}{(numeric) age in years}
#'   \item{legacy}{(numeric) Sverage of 8 items reflecting legacy motivation, on a scale from 1 (Not at all) to 6 (A great amount)}
#'   \item{belief}{(numeric) average of 5 items reflecting belief in climate change, on a scale from 1 (Strongly Disagree) to 7 (Strongly Agree)}
#'   \item{intention}{(numeric) average of 8 items reflecting intention to act in a pro-environmental way, on a scale from 1 (Never) to 6 (All the time)}
#'   \item{education}{(numeric) Level of education, 1 = 8th grade or less, 2 = Some high school, 3 = Graduated high school, 4 = Some college or technical school, 5 = Graduated college or technical school, 6 = Post-graduate}
#'   \item{income}{(numeric) Approximate household income, 1 = less than $20K, 2 = $20K-$35K, 3 = $35K-$50K 4 = $50K-$75K, 5 = $75K-100K, 6 = more than 100K}
#'   \item{donation}{(numeric) Donation of possible bonus payment, between $0 and $10}
#' }
#' 
#' @examples
#' \dontrun{
#'  # this dataset was processed from the raw data as follows:
#'  tdat <- read.csv("legacy study - pilot_data.csv")
#`  dat <- data.frame(
#`   id = tdat$id,
#`   sex = ifelse(tdat$Male,"male","female"),
#`   age = 2015 - tdat$YOB,
#`   legacy = rowMeans(tdat[,3:10]),
#`   belief = rowMeans(tdat[,12:16]),
#`   intention = rowMeans(tdat[,17:23]),
#`   education = as.numeric(tdat$educ),
#`   income = tdat$Income,
#`   donation = tdat$donate_dv_1)
#`  dat$legacy <- round(dat$legacy,2)
#`  dat$belief <- round(dat$belief,2)
#`  dat$intention <- round(dat$intention,2)
#`  dat <- dat[!is.na(rowSums(dat[,4:9])),]
#`  legacy2015 <- dat
#' }
#' @source Harvard DataVerse \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/27740&version=1.0}
"legacy2015"

#' Speed dating
#' 
#' A subset of cases (wave 6-9) and variables (see below) from an experiment on speed dating. 
#' by Columbia Business School professors Ray Fisman and Sheena Iyengar for their paper 
#' Gender Differences in Mate Selection: Evidence From a Speed Dating Experiment.
#' 
#' @format A data frame with 1562 rows and 32 variables:
#' \describe{
#'   \item{iid}{(numeric) unique ID variable of participant}
#'   \item{pid}{(numeric) unique ID variable of date partner}
#'   \item{gender}{(character) gender of participant (male or female)}
#'   \item{age}{(numeric) age in years}
#'   \item{date_like}{(numeric) how much they like their date partner in general (between  1 and 10)}
#'   \item{other_like}{(numeric) how much their date partner likes them (between  1 and 10)}
#'   \item{date_want}{do they want to go on another date with their date partner? (1 = yes, 0 = no)}
#'   \item{other_want}{does their date partner want to go on another date with them? (1 = yes, 0 = no)}
#'   \item{match}{do they both want to go on another date with each other? (1 = yes, 0 = no)}
#'   \item{self_attr}{how attractive do they think they are? (between 1 and 10)}
#'   \item{self_sinc}{how sincere do they think they are? (between 1 and 10)}
#'   \item{self_intel}{how intelligent do they think they are? (between 1 and 10)}
#'   \item{self_fun}{how much fun do they think they are? (between  1 and 10)}
#'   \item{self_amb}{how ambitious do they think they are? (between 1 and 10)}
#'   \item{other_attr,other_sinc,other_intel,other_fun,other_amb}{how attractive etc does their date partner think they are? (between  1 and 10)}
#'   \item{other_shar}{how much does their date partner think they share hobbies and interests? (between 1 and 10)}
#'   \item{date_attr,date_sinc,date_intel,date_fun,date_amb,date_shar}{how do they rate their date partner's attractiveness etc? (between 1 and 10)}
#'   \item{self_imp_attr,self_imp_sinc,self_imp_intel,self_imp_fun,self_imp_amb,self_imp_shar}{how important do they find attractiveness etc in a partner? (between 1 and 10)}
#'   \item{other_imp_attr,other_imp_sinc,other_imp_intel,other_imp_fun,other_imp_amb,other_imp_shar}{how important does their date partner find attractiveness etc? (between 1 and 10)}
#' }
#' @source Kaggle \url{https://www.kaggle.com/annavictoria/speed-dating-experiment}
"speeddate"

