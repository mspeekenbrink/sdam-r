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

#' Trump votes in 2016 for 51 US states
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

