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

#' Redistribution of wealth
#' 
#' It is generally found that wealthy people tend to be more opposed to policies to reduce wealth inequalities. This may be unsurprising from a classical economic standpoint, because the material burden of the redistribution of wealth will fall on wealthier people. Wealthier people are also more likely than poorer people to adopt political ideologies that oppose redistribution policies. Dawtry, Sutton, and Sibley (2015) investigated whether, in addition to such factors, “social-sampling processes” lead wealthier people to oppose redistribution policies. Social sampling is the idea that people (partly) base inferences on their social surroundings. Wealthier people tend to live in more affluent areas and move in wealthier social circles. This may bias their view of the world, where wealthier people estimate the general population to be wealthier (with less of a gap between the wealthy and the poor) than it really is.
#' 
#' In Experiment 1a of Dawtry, Sutton, and Sibley (2015), they assessed income and opinions for n=305 online U.S. participants recruited via Amazon’s Mechanical Turk.
#' 
#' @format A data frame with 305 rows and 12 variables: 
#' \describe{
#'   \item{id}{unique ID number for each participant}
#'   \item{gender}{only "male" or "female" could be answered by the looks of it}
#'   \item{age}{participant age in years}
#'   \item{income}{yearly household income (in units of $1,000)}
#'   \item{pol_att}{political leaning from 1="Extremely Liberal" to 9="Extremely Conservative"}
#'   \item{PD_mean}{estimate average household income in the general US population}
#'   \item{PD_gini}{GINI index computed for a subjective distribution of wealth in the general US population. The GINI index is a measure of wealth inequality; higher numbers mean more inequality}
#'   \item{PD_fair}{Answer to the question "To what extent do you feel that household incomes are fairly--unfairly distributed across the US population?" on a scale from 1="Extremely Fair" to 9 = "Extremely Unfair".}
#'   \item{PD_sat}{Answer to the question "How satisfied--dissatisfied are you with the way in which household incomes are distributed across the US population?" on a scale from 1="Extremely satisfied" to 9="Extremely dissatisfied".}
#'   \item{SC_mean}{estimate average household income in the participant's social circles}
#'   \item{SC_gini}{(subjective) inequality in the participant's social circles}
#'   \item{redist}{support for wealth redistribution policies (average of four items, higher scores indicate stronger support).}
#' }
#' @source  \url{https://osf.io/3mftr/}. See also Dawtry, Rael J., Robbie M. Sutton, and Chris G. Sibley. 2015. “Why Wealthier People Think People Are Wealthier, and Why It Matters: From Social Sampling to Attitudes to Redistribution.” Psychological Science 26 (9): 1389–1400. \url{https://doi.org/10.1177/0956797615586560}.
"redist2015"

#' Tetris and intrusive memories
#' 
#' 
#' @format A data frame with 72 rows and 28 variables: 
#' \describe{
#'   \item{Condition}{(factor) Condition: Control, Tetris_Reactivation, Tetris, or Reactivation}
#'   \item{Time_of_Day}{Time of day participant commenced experiment, either "morning” or “afternoon”}
#'   \item{BDI_II}{Beck Depression Inventory-II (BDI-II): Total score}
#'   \item{STAI_T}{Spielberger State-Trait Anxiety Trait scale (STAI): Total score}
#'   \item{pre_film_VAS_Sad}{Self-rated level of Sadness: Pre-film VAS mood. VAS = visual analogue scale. All VAS mood scales anchored from “not at all” to “extremely” in response to the question “Right at this very moment I am feeling”. Composite for pre-film mood calculated by summing the six pre-film VAS mood ratings}
#'   \item{pre_film_VAS_Hopeless}{Self-rated level of Hopelessness: Pre-film VAS mood}
#'   \item{pre_film_VAS_Depressed}{Self-rated level of Depressed: Pre-film VAS mood}
#'   \item{pre_film_VAS_Fear}{Self-rated level of Fear: Pre-film VAS mood}
#'   \item{pre_film_VAS_Horror}{Self-rated level of Horror: Pre-film VAS mood}
#'   \item{pre_film_VAS_Anxious}{Self-rated level of Anxiousness: Pre-film VAS mood}
#'   \item{post_film_VAS_Sad}{Self-rated level of Sadness: Post-film VAS mood. omposite for post-film mood calculated by summing the six post-film VAS mood ratings}
#'   \item{post_film_VAS_Hopeless}{Self-rated level of Hopelessness: Post-film VAS mood}
#'   \item{post_film_VAS_Depressed}{Self-rated level of Depressed: Post-film VAS mood}
#'   \item{post_film_VAS_Fear}{Self-rated level of Fear: Post-film VAS mood}
#'   \item{post_film_VAS_Horror}{Self-rated level of Horror: Post-film VAS mood}
#'   \item{post_film_VAS_Anxious}{Self-rated level of Anxious: Post-film VAS mood}
#'   \item{Attention_Paid_to_Film}{Attention paid to the film rating: How much attention did you pay to the film from 0-not at all to 10-extremely}
#'   \item{Post_film_Distress}{Post film distress rating: How distressing did you find the film from 0-not at all to 10-extremely}
#'   \item{Day_Zero_Number_of_Intrusions}{Day 0: Number of image-based intrusive memories in the Intrusion Diary (pre-intervention)}
#'   \item{Days_One_to_Seven_Number_of_Intrusions}{Days 1-7: Number of image-based intrusive memories in the Intrusion Diary (post-intervention)}
#'   \item{Visual_Recognition_Memory_Test}{Visual recognition memory test score: Number of correct responses (out of 22)}
#'   \item{Verbal_Recognition_Memory_Test}{Verbal recognition memory test score: Number of correct responses (out of 32)}
#'   \item{Number_of_Provocation_Task_Intrusions}{Intrusion Provocation Task (IPT):  Number of image-based intrusive memories during 2min laboratory task on Day 7}
#'   \item{Diary_Compliance}{Diary compliance rating - indicate how accurate you think your diary is from 1 - not at all accurate to 10 extremely}
#'   \item{IES_R_Intrusion_subscale}{Impact of Event Scale-Revised (IES-R): Intrusion Subscale}
#'   \item{Tetris_Total_Score}{Tetris game play computer score total - cumulative (sum of all games). Only participants who played Tetris have data relating to Tetris_Total_Score}
#'   \item{Self_Rated_Tetris_Performance}{Self-rated Tetris performance: How difficult or easy did you find the game you just played. Only participants who played Tetris have data relating to Self_Rated_Tetris_Performance.}
#'   \item{Tetris_Demand_Rating}{Demand rating: How much did you think Tetris after a distressing film would increase or decrease intrusive memories of the film: -10: extremely decrease, to +10: extremely increase}
#' }
#' @source  \url{https://osf.io/ideta/}. See also James et al., ‘Computer Game Play Reduces Intrusive Memories of Experimental Trauma via Reconsolidation-Update Mechanisms’.
"tetris2015"

#` The role of experimenter belief in social priming
#' 
#' Data from Experiment 5 of Gilder, T. S. E., & Heerey, E. A. (2018). The Role of Experimenter Belief in Social Priming. Psychological Science, 29(3), 403–417.
#' 
#' \@format A data frame with 400 observations of 16 variables:
#' \describe{
#'    \item{pid}{Participant ID}
#'    \item{exptrNum}{Experimenter Number}
#'    \item{age}{Participant age in years}
#'    \item{gender}{Participant self-reported gender}
#'    \item{yearInUni}{Year in University}
#'    \item{ethnicity}{Self-reported ethnicity}
#'    \item{englishFluency}{Self-reported English fluency (1=beginner; 7=native language)}
#'    \item{experimenterBelief}{Experimenter Belief (H: High or L: Low)}
#'    \item{primeCond}{Actual Prime Condition (HPP: High-power prime or LPP: low-power prime)}
#'    \item{powerPRE}{Self-reported power BEFORE the manipulation}
#'    \item{powerPOST}{Self-reported power AFTER the manipulation}
#'    \item{ApproachAdvantage}{Approach advantage (Avoid RT - Approach RT; see manuscript)}
#'    \item{attractive}{Rating of experimenter ATTRACTIVENESS}
#'    \item{competent}{Rating of experimenter COMPETENCE}
#'    \item{friendly}{Rating of experimenter FRIENDLINESS}
#'    \item{trustworthy}{Rating of experimenter TRUSTWORTHINESS}
#' }
#' @source  \url{https://osf.io/un4h6/}. See also Gilder, T. S. E., & Heerey, E. A. (2018). The Role of Experimenter Belief in Social Priming. Psychological Science, 29(3), 403–417. \url{https://doi.org/10.1177/0956797617737128}.
"expBelief"




