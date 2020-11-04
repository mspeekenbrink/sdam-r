#' Expand all contrast terms in car::Anova
#' 
#' This is an experimental function
#' 
#' @param mod A model of class lm
#' @param type SS Type (see ?car::Anova)
#' @param ... Further arguments passed to Anova
#' @return Object of class anova returned by car::Anova
#' @examples
#' data("tetris2015")
#' mod <- lm(Days_One_to_Seven_Number_of_Intrusions ~ Condition, data=tetris2015)
#' car::Anova(mod,type=3) # default type III Anova table
#' expand_Anova(mod,type=3)
#' @export
expand_Anova <- function(mod, type = c("III", "II", 3, 2), ...) {
  type <- as.character(type)
  type <- match.arg(type)
  if(!methods::is(mod,"lm")) stop("This function currently only works with lm models.")
  #aov1 <- car::Anova(mod,type=type)
  mf <- stats::model.frame(mod)
  mm <- stats::model.matrix(mod)
  if(colnames(mm)[1] == "(Intercept)") {
    colnames(mm)[1] <- "Intercept0"
  }
  pred_terms <- colnames(mm)
  resp <- stats::model.extract(mf,"response")
  resp.name <- colnames(mf)[1] # needs checking
  tdat <- as.data.frame(cbind(resp,mm))
  cn <- colnames(tdat)
  colnames(tdat)[1] <- resp.name
  mod2 <- stats::lm(stats::as.formula(paste(resp.name, " ~ ",paste(pred_terms,collapse=" + "),"-1")),data=tdat)
  aov2 <- car::Anova(mod2, type=type, ...)
  if(rownames(aov2)[1] == "Intercept0") rownames(aov2)[1] <- "(Intercept)"
  aov2
}