#' Compute the sample standard deviation
#' 
#' @param x Numeric vector
#' @param na.rm (logical) Should missing values be removed?
#' @examples
#' data(anchoring)
#' sample_sd(anchoring$everest_feet)
#' @export
sample_sd <- function(x, na.rm = FALSE) {
  sqrt(sample_var(x,na.rm=na.rm))
}
