df <- data.frame()
files <- c("CAULFIELD", "CHADSTONE", "BRUNSWICK", "NORTHCOTE", "COBURG", "SEDDON", "SUNSHINE", "HADFIELD", "PASCOE_VALE", "RESERVOIR", "CLAYTON", "BOX_HILL", "SUNBURY", "PRESTON", "FAWKNER", "BROADMEADOWS", "DANDENONG")
for (f in files) {
  df <- rbind(df, read.csv(paste("./crime/", f, ".csv", sep = ""), sep = "\t"))
}

offence_divisions <- c()
division <- unique(df[,"Offence.Division"])
num_of_divisions <- length(division)
for (i in 1:num_of_divisions) {
  offence_divisions <- c(offence_divisions, levels(division)[i])
}
offence_divisions <- sort(offence_divisions)

offence_subdivisions <- c()
subdivision <- unique(df[,"Offence.Subdivision"])
num_of_subdivisions <- length(subdivision)
for (i in 1:num_of_subdivisions) {
  offence_subdivisions <- c(offence_subdivisions, levels(subdivision)[i])
}
offence_subdivisions <- sort(offence_subdivisions)

suburbs <- c()
suburb_names <- unique(df[,"Suburb.Town.Name"])
num_of_suburbs <- length(suburb_names)
for (i in 1:num_of_suburbs) {
  suburbs <- c(suburbs, levels(suburb_names)[i])
}
suburbs <- sort(suburbs)


