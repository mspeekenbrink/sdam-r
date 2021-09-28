#' Create a raincloud plot
#' 
#' @param data Data.frame (or tibble)
#' @param y The unquoted name of the variable in data for which to create the raincloud plot
#' @param horizontal (logical) change the orientation of the plot
#' @param groups An unquoted name of grouping variable in data (ideally a factor)
#' @param point_size Size of the jittered points
#' @param ... Other arguments, passed to ggplot(aes(...))
#' @description \code{plot_raincloud} creates a raincloud plot to display the distribution of data by a combination of a a boxplot, a kernel density plot, and a scatterplot. The boxplot includes the median (displayed as a horizontal line) and the mean (displayed as a point). It does not indicate potential outliers, as these can be seen in the scatter plot. The kernel density plot provides a nonparametric estimate of the distribution. The scatterplot depicts all values in \code{y} with random jittering on the x-axis. The data can be grouped by supplying a grouping factor in the \code{groups} argument, in which case multiple raincloud plots are shown side by side. As \code{plot_raincloud} provides a \code{ggplot2::ggplot} object, it can be combined with further layers and functionality from the \code{ggplot2} package.
#' @return An object of class \code{gg}, i.e. a \code{ggplot} object from the \code{ggplot2} package
#' @seealso [ggplot2::ggplot()] for information about ggplot objects, [ggplot2::theme()] for information about changing various aspects of the plot, and [ggplot2::facet_wrap()] and [ggplot2::facet_grid()] for creating multiple raincloud plots for different levels of grouping factors beyond those specified in \code{groups}. 
#' @source  Allen M, Poggiali D, Whitaker K et al. Raincloud plots: a multi-platform tool for robust data visualization. Wellcome Open Res 2019, 4:63 (\doi{10.12688/wellcomeopenres.15191.1})
#' @examples
#' data(anchoring)
#' plot_raincloud(anchoring,y=everest_feet)
#' plot_raincloud(anchoring,y=everest_feet,groups=anchor)
#' plot_raincloud(anchoring,y=everest_feet,groups=anchor) + 
#'     ggplot2::facet_wrap(~us_or_international) + 
#'     ggplot2::ylab("How high is Mount Everest (in feet)?")
#' @export
plot_raincloud <- function(data,y,horizontal=FALSE,groups,point_size=.5,...) {
  y <- dplyr::enquo(y)
  if(!missing(groups)) groups <- dplyr::enquo(groups) else groups <- NULL
  
  # Trying to be clever about the jittered points
  #max_nequal <- max(table(dplyr::select(data,!!y)))
  
  if(is.null(groups)) {
    p <- ggplot2::ggplot(data, ggplot2::aes(x="", y=!!y, ...)) + 
      geom_flat_violin(position=ggplot2::position_nudge(x=.05,y=0), adjust = 2, trim = TRUE) +
      ggplot2::geom_point(position = position_jitternudge(jitter.width = .25, nudge.x = -.175), size = point_size, alpha = .5) +
      ggplot2::geom_boxplot(outlier.shape = NA, alpha = 1, width = .1, colour = "BLACK") +
      ggplot2::stat_summary(fun="mean", colour = "BLACK") +
      ggplot2::xlab("")
      #ggplot2::coord_flip()
  } else {
    p <- ggplot2::ggplot(data, ggplot2::aes(x=!!groups,y=!!y, fill = !!groups, colour = !!groups)) +
      geom_flat_violin(position=ggplot2::position_nudge(x=.05,y=0), adjust =2, trim = TRUE) +
      ggplot2::geom_point(position = position_jitternudge(jitter.width = .25, nudge.x = -.175), size = point_size) +
      ggplot2::geom_boxplot(outlier.shape = NA, alpha = 1, width = .1, colour = "BLACK") +
      ggplot2::guides(fill = FALSE, colour = FALSE) +
      ggplot2::stat_summary(fun="mean", colour = "BLACK")
      #ggplot2::scale_colour_brewer(palette = "Dark2") +
      #ggplot2::scale_fill_brewer(palette = "Dark2")
  }
  if(horizontal) p <- p + ggplot2::coord_flip()
  return(p)
}