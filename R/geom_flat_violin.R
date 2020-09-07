# somewhat hackish solution to:
# https://twitter.com/EamonCaddigan/status/646759751242620928
# based mostly on copy/pasting from ggplot2 geom_violin source:
# https://github.com/hadley/ggplot2/blob/master/R/geom-violin.r

#library(ggplot2)
#library(dplyr)

"%||%" <- function(a, b) {
  if (!is.null(a)) a else b
}

#' Half violin plot
#' 
#' @source url{https://gist.github.com/dgrtwo/eb7750e74997891d7c20}
#' 
#' @param mapping The mapping
#' @param data data.frame
#' @param stat statistic (don't change)
#' @param position position dodge
#' @param trim Logical
#' @param scale Scale (don't change)
#' @param show.legend Logical
#' @param inherit.aes Logical
#' @param ... other arguments
#' 
#' @examples 
#' library(ggplot2)
#' data(diamonds)
#' ggplot(diamonds, aes(cut, carat)) + geom_flat_violin() + coord_flip()
#' @export

geom_flat_violin <- function(mapping = NULL, data = NULL, stat = "ydensity",
                             position = "dodge", trim = TRUE, scale = "area",
                             show.legend = NA, inherit.aes = TRUE, ...) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomFlatViolin,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      trim = trim,
      scale = scale,
      ...
    )
  )
}

#' Flat violin geometry
#' 
#' @aliases GeomFlatViolin
#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
GeomFlatViolin <-
  ggplot2::ggproto("GeomFlatViolin", ggplot2::Geom,
          setup_data = function(data, params) {
            data$width <- data$width %||%
              params$width %||% (ggplot2::resolution(data$x, FALSE) * 0.9)
            
            # ymin, ymax, xmin, and xmax define the bounding rectangle for each group
              dplyr::mutate(dplyr::group_by(data,group),
                            ymin = min(y),
                           ymax = max(y),
                           xmin = x,
                           xmax = x + width / 2)
          },
  
  draw_group = function(data, panel_scales, coord) {
    # Find the points for the line to go all the way around
    data <- transform(data, xminv = x,
                      xmaxv = x + violinwidth * (xmax - x))
    
    # Make sure it's sorted properly to draw the outline
    newdata <- rbind(dplyr::arrange(transform(data, x = xminv), y),
                     dplyr::arrange(transform(data, x = xmaxv), -y))
    
    # Close the polygon: set first and last point the same
    # Needed for coord_polar and such
    newdata <- rbind(newdata, newdata[1,])
    
    ggplot2:::ggname("geom_flat_violin", ggplot2::GeomPolygon$draw_panel(newdata, panel_scales, coord))
  },
  
  draw_key = ggplot2::draw_key_polygon,
  
  default_aes = ggplot2::aes(weight = 1, colour = "grey20", fill = "white", size = 0.5,
                    alpha = NA, linetype = "solid"),
  
  required_aes = c("x", "y")
)