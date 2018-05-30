lookup_ssc_code <- function(suburb_name) {
  f <- gsub("_", " ", suburb_name)
  code <- paste("SSC", unique(ssc_codes[ssc_codes$STATE_NAME_2016 == "Victoria" & ssc_codes$SSC_NAME_2016 == f, 2]), sep = "")
  if (code == "SSC") {
    f_vic <- paste(f, "(VIC.)")
    code <- paste("SSC", unique(ssc_codes[ssc_codes$STATE_NAME_2016 == "Victoria" & ssc_codes$SSC_NAME_2016 == f_vic, 2]), sep = "")
  }
  code
}

lookup_suburb_area <- function(suburb_name) {
  f <- gsub("_", " ", suburb_name)
  area <- sum(ssc_codes[ssc_codes$STATE_NAME_2016 == "Victoria" & ssc_codes$SSC_NAME_2016 == f, 6])
  if (area == 0) {
    f_vic <- paste(f, "(VIC.)")
    area <- sum(ssc_codes[ssc_codes$STATE_NAME_2016 == "Victoria" & ssc_codes$SSC_NAME_2016 == f_vic, 6])
  }
  area
}

lookup_suburb_name_by_ssc_code <- function(code) {
  code <- as.character(code)
  if (startsWith(code, "SSC")) {
    code <- substr(code, 4, 8)
  }
  unique(ssc_codes[ssc_codes$SSC_CODE_2016 == code, "SSC_NAME_2016"])
}

library(dplyr)
ssc_codes <- read.csv("./census2016/SSC_2016_AUST.csv") %>% mutate(SSC_NAME_2016 = toupper(SSC_NAME_2016))
