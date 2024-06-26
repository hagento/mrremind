#' Floor space in buildings
#'
#' Residential, commercial and total floor space from EDGE-B. Set
#'
#' @author Antoine Levesque, Robin Hasse
#'
#' @param onlyTotal boolean, only give total instead of sub-sectoral floor space
#' @return MAgPIE object with buildings floor space
#'
#' @export
#'
calcFloorspace <- function(onlyTotal = FALSE) {

  data <- readSource("EdgeBuildings", subtype = "Floorspace")

  if (onlyTotal) {
    # data <- collapseNames(data[, , "buildings"])
    data <- data[, , "buildings"]
    data <- collapseDim(data, dim = "variable")
  }

  return(list(x = data,
              weight = NULL,
              unit = "million m2",
              description = "Buildings floor space"))
}
