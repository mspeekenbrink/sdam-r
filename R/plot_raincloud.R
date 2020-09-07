#' Create a raincloud plot
#' 
#' @param data Data.frame (or tibble)
#' @param y The unquoted name of the variable in data for which to create the raincloud plot
#' @param horizontal (logical) change the orientation of the plot
#' @param groups An unquoted name of grouping variable in data (ideally a factor)
#' @param ... Other arguments, passed to ggplot(aes(...))
#' @source  Allen M, Poggiali D, Whitaker K et al. Raincloud plots: a multi-platform tool for robust data visualization. Wellcome Open Res 2019, 4:63 (\url{https://doi.org/10.12688/wellcomeopenres.15191.1})  
#' @examples
#' data(anchoring)
#' plot_raincloud(anchoring,y=everest_feet)
#' plot_raincloud(anchoring,y=everest_feet,groups=anchor)
#' plot_raincloud(anchoring,y=everest_feet,groups=anchor) + 
#'     facet_wrap(~us_or_international) + 
#'     ylab("How high is Mount Everest (in feet)?")
#' @export
plot_raincloud <- function(data,y,horizontal=FALSE,groups,...) {
  y <- dplyr::enquo(y)
  if(!missing(groups)) groups <- dplyr::enquo(groups) else groups <- NULL
  
  # Trying to be clever about the jittered points
  #max_nequal <- max(table(dplyr::select(data,!!y)))
  
  if(is.null(groups)) {
    p <- ggplot2::ggplot(data, ggplot2::aes(x="", y=!!y, ...)) + 
      geom_flat_violin(position=ggplot2::position_nudge(x=.05,y=0), adjust = 2, trim = TRUE) +
      ggplot2::geom_point(position = position_jitternudge(jitter.width = .25, nudge.x = -.175), size = .25, alpha = .5) +
      ggplot2::geom_boxplot(outlier.shape = NA, alpha = 1, width = .1, colour = "BLACK") +
      ggplot2::stat_summary(fun="mean", colour = "BLACK") +
      ggplot2::xlab("")
      #ggplot2::coord_flip()
  } else {
    p <- ggplot2::ggplot(data, ggplot2::aes(x=!!groups,y=!!y, fill = !!groups, colour = !!groups)) +
      geom_flat_violin(position=ggplot2::position_nudge(x=.05,y=0), adjust =2, trim = TRUE) +
      ggplot2::geom_point(position = position_jitternudge(jitter.width = .25, nudge.x = -.175), size = .5) +
      ggplot2::geom_boxplot(outlier.shape = NA, alpha = 1, width = .1, colour = "BLACK") +
      ggplot2::guides(fill = FALSE, colour = FALSE) +
      ggplot2::stat_summary(fun="mean", colour = "BLACK")
      #ggplot2::scale_colour_brewer(palette = "Dark2") +
      #ggplot2::scale_fill_brewer(palette = "Dark2")
  }
  if(horizontal) p <- p + ggplot2::coord_flip()
  return(p)
}