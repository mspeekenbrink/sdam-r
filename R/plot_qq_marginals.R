# adapted from http://www.stat.wisc.edu/~deepayan/771/esplot.R; 
# see also http://www.stat.wisc.edu/~deepayan/771/rgraphics.pdf
# use as e.g. myQQplot(rnorm(100))
# to run this you will need the grid package; you can install
#   this with e.g. install.packages("grid"")

#' A Q-Q plot with histograms in the marginals
#' 
#' @param x A numeric vector
#' @param breaks How to compute breakpoints for the histogram. See ?hist
#' @param newpage (logical) Should the plot be plotted on a new page?
#' @param xlab Label for x-axis
#' @param ylab Label for y-axis
#' @param xlim Range of x values shown
#' @param ylim Range of y values shown
#' @param main Main title
#' @param sub Subtitle
#' @param axes (logical) Draw axes?
#' @param border (logical) Draw a border?
#' @param ... Further arguments
#' @examples
#' data(anchoring)
#' plot_qq_marginals(anchoring$everest_feet)
#' @export
plot_qq_marginals <- function(x,
                     breaks = "Sturges",
                     newpage = TRUE,
                     xlab = "Observed Quantiles",
                     ylab = "Theoretical quantiles",
                     xlim = grDevices::extendrange(c(min(x),max(x))),
                     ylim = NULL,
                     main = NULL,
                     sub = NULL,
                     axes = TRUE,
                     border = TRUE,
                     ...) {
  #stopifnot(require(grid))
  # 24/10/2017: use extendrange instead of extend
  #extend <- function(rng) rng + c(- 0.2, 0.1) * diff(rng)
  
  x <- x[order(x)]
  mx <- mean(x)
  sx <- stats::sd(x)
  
  nx <- length(x)
  y <- stats::qnorm(seq(0,1,length=nx),mean=mx,sd=sx)
  if(is.null(ylim)) ylim <- grDevices::extendrange(c(y[2],y[length(x)-1]))
  
  layout.widths <- list(x = c(ylab = if (is.null(ylab)) 0 else 2,
                              axis = if (axes) 3 else 1,
                              panel = 1,
                              density = 0.1),
                        units = c(ylab = if (is.null(ylab)) "null" else "strheight",
                                  axis = "grobwidth",
                                  panel = "null",
                                  density = "snpc"),
                        data = list(ylab = ylab,
                                    axis = grid::textGrob(format(pretty(y)), 0, 0),
                                    panel = NULL,
                                    density = NULL))
  iw <- c(ylab = 1, axis = 2, panel = 3, density = 4)
  
  layout.heights <-
    list(x = c(main = if (is.null(main)) 0 else 2,
               density = 0.1,
               panel = 1,
               axis = if (axes) 3 else 1,
               xlab = if (is.null(xlab)) 0 else 2,
               sub = if (is.null(sub)) 0 else 2),
         units = c(main = if (is.null(main)) "null" else "strheight",
                   density = "snpc",
                   panel = "null",
                   axis = "lines",
                   xlab = if (is.null(xlab)) "null" else "strheight",
                   sub = if (is.null(sub)) "null" else "strheight"),
         data = list(main = main,
                     density = NULL,
                     panel = NULL,
                     axis = NULL,
                     xlab = xlab,
                     sub = sub))
  ih <- c(main = 1, density = 2, panel = 3, axis = 4, xlab = 5, sub = 6)
  
  my.layout <- grid::grid.layout(nrow = length(ih),
                           ncol = length(iw),
                           heights = do.call(grid::unit, layout.heights),
                           widths = do.call(grid::unit, layout.widths))
  
  if(newpage) grid::grid.newpage()
  
  grid::pushViewport(grid::viewport(layout = my.layout))
  
  ## panel
  grid::pushViewport(grid::viewport(layout.pos.row = ih["panel"],
                        layout.pos.col = iw["panel"],
                        xscale = xlim,
                        yscale = ylim))
  if(border) grid::grid.rect()
  
  grid::grid.points(x = x, y = y,default.units = "native")
  
  
  ## axes
  if(axes) {
    grid::grid.xaxis()
    grid::grid.yaxis()
  }
  
  ## rug
  grid::grid.segments(x0 = grid::unit(x, "native"),
                y0 = grid::unit(0, "npc"),
                x1 = grid::unit(x, "native"),
                y1 = grid::unit(0.03, "npc"),
                gp = grid::gpar(col = "grey"))
  grid::grid.segments(y0 = grid::unit(y, "native"),
                x0 = grid::unit(0, "npc"),
                y1 = grid::unit(y, "native"),
                x1 = grid::unit(0.03, "npc"),
                gp = grid::gpar(col = "grey"))
  grid::upViewport(1)
  
  grid::pushViewport(grid::viewport(layout.pos.row = ih["panel"],
                        layout.pos.col = iw["panel"],
                        xscale = xlim,
                        yscale = ylim,
                        clip="on"))
  grid::grid.abline()
  grid::upViewport(1)
  
  
  ## histogram
  hist <- hist(x,breaks=breaks,plot=FALSE)
  # 24/10/2017: intensities disappeared; use density
  hist$intensities <- hist$density
  maxh <- max(hist$intensities)
  grid::pushViewport(grid::viewport(layout.pos.row = ih["density"],
                        layout.pos.col = iw["panel"],
                        clip = "on",
                        xscale = xlim,
                        yscale = c(-0.05, 1.05) * maxh))
  nb <- length(hist$breaks)
  grid::grid.rect(x = hist$breaks[-nb], y = rep(0,nb-1), height = hist$intensities[-nb], width = diff(hist$breaks),
            gp=grid::gpar(col = "black",fill = "grey"), just = c("left", "bottom"),default.units = "native")
  grid::upViewport(1)
  
  ## Normal density
  xdens <- stats::density(y)
  maxh <- max(xdens$y)
  grid::pushViewport(grid::viewport(layout.pos.row = ih["panel"],
                        layout.pos.col = iw["density"],
                        clip = "on",
                        yscale = ylim,
                        xscale = c(-0.05, 1.05) * maxh))
  grid::grid.polygon(y = xdens$x, x = xdens$y,
               gp = grid::gpar(col = "transparent",fill = "grey"),
               default.units = "native")
  grid::upViewport(1)
  
  ## ylab
  if(!is.null(ylab)) {
    grid::pushViewport(grid::viewport(layout.pos.row = ih["panel"],layout.pos.col = iw["ylab"]))
    grid::grid.text(ylab, rot = 90)
    grid::upViewport(1)
  }
  
  ## xlab
  if(!is.null(xlab)) {
    grid::pushViewport(grid::viewport(layout.pos.row = ih["xlab"],layout.pos.col = iw["panel"]))
    grid::grid.text(xlab)
    grid::upViewport(1)
  }
  ## main
  if(!is.null(main)) {
    grid::pushViewport(grid::viewport(layout.pos.row = ih["main"],layout.pos.col = iw["panel"]))
    grid::grid.text(main)
    grid::upViewport(1)
  }
  ## sub
  if(!is.null(sub)) {
    grid::pushViewport(grid::viewport(layout.pos.row = ih["sub"],layout.pos.col = iw["panel"]))
    grid::grid.text(sub)
    grid::upViewport(1)
  }
  invisible()
}