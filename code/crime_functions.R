zero_missing_suburb_division <- function (df, year) {
  df$Offence.Subdivision <- NULL
  df$Postcode <- NULL
  for (suburb in suburbs) {
    for (div in offence_divisions) {
      df <- rbind(df, data.frame(Incidents.Recorded = 0, Offence.Division = div, Suburb.Town.Name = suburb, Year.ending.December = year))
    }
  }
  df
}

zero_missing_suburb_subdivision <- function (df, year) {
  df$Offence.Division <- NULL
  df$Postcode <- NULL
  for (suburb in suburbs) {
    for (subdiv in offence_subdivisions) {
      df <- rbind(df, data.frame(Incidents.Recorded = 0, Offence.Subdivision = subdiv, Suburb.Town.Name = suburb, Year.ending.December = year))
    }
  }
  df
}

