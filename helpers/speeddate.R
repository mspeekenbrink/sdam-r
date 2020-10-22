library(dplyr)

tdat <- read.csv("helpers/Speed Dating Data.csv")
tdat <- subset(tdat,wave %in% 6:9)
dat <- tdat %>% group_by(iid, pid) %>% summarise(
  gender = first(ifelse(gender == 1, "male", "female")),
  age = first(age),

  self_like = mean(like, na.rm = TRUE),
  other_like = mean(like_o, na.rm = TRUE),
  self_want = mean(dec, na.rm = TRUE),
  other_want = mean(dec_o, na.rm = TRUE),

  match = mean(match, na.rm = TRUE),
  
  self_attr = first(attr3_1),
  self_sinc = first(sinc3_1),
  self_intel = first(intel3_1),
  self_fun = first(fun3_1),
  self_amb = first(amb3_1),
  #self_shar = mean(shar3_1),
  
  other_attr = mean(attr_o, na.rm = TRUE),
  other_sinc = mean(sinc_o, na.rm = TRUE),
  other_intel = mean(intel_o, na.rm = TRUE),
  other_fun = mean(fun_o, na.rm = TRUE),
  other_amb = mean(amb_o, na.rm = TRUE),
  other_shar = mean(shar_o, na.rm = TRUE),
  
  date_attr = mean(attr, na.rm = TRUE),
  date_sinc = mean(sinc, na.rm = TRUE),
  date_intel = mean(intel, na.rm = TRUE),
  date_fun= mean(fun, na.rm = TRUE),
  date_amb = mean(amb, na.rm = TRUE),
  date_shar = mean(shar, na.rm = TRUE),
  
  self_imp_attr = first(attr1_1),
  self_imp_sinc = first(sinc1_1),
  self_imp_intel = first(intel1_1),
  self_imp_fun = first(fun1_1),
  self_imp_amb = first(amb1_1),
  self_imp_shar = first(shar1_1),
  
  other_imp_attr = mean(pf_o_att, na.rm=TRUE),
  other_imp_sinc = mean(pf_o_sin, na.rm=TRUE),
  other_imp_intel = mean(pf_o_int, na.rm = TRUE),
  other_imp_fun = mean(pf_o_fun, na.rm = TRUE),
  other_imp_amb = mean(pf_o_amb, na.rm = TRUE),
  other_imp_shar = mean(pf_o_sha, na.rm = TRUE)
  
) %>% 
  mutate_all(funs(ifelse(is.nan(.), NA, .)))

speeddate <- as.data.frame(dat)

save(speeddate, file="data/speeddate.rda")