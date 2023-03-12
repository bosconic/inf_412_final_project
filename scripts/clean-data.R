#data.businesses basic clean
library(janitor)
basic.businesses_clean <-
  clean_names(data.businesses)

# check using head for results in cleaning
head(basic.businesses_clean)

write_csv(
  x = basic.businesses_clean,
  file = "data.businesses.csv"
)

read_csv(
  file =  "data.businesses.csv",
  show_col_types = FALSE
)

# More cleaning may be needed for data, but this is to get our feet wet
# now repeat basic clean process for each other data set


#data.dispensaries
basic.dispensaries_clean <-
  clean_names(data.dispensaries)
head(basic.dispensaries_clean)



write_csv(
  x = basic.dispensaries_clean,
  file = "data.dispensaries.csv"
)

read_csv(
  file = "data.dispensaries.csv",
  show_col_types = FALSE
)

#data.neighbourhoods
basic.neighbourhoods_clean <-
  clean_names(data.neighbourhoods) |>
  #dropping parent area id, it was a empty column
  select(
    id,
    area_id,
    area_attr_id,
    area_short_code,
    area_long_code,
    area_name,
    area_desc,
    classification,
    classification_code,
    objectid,
    geometry
    
  )
head(basic.neighbourhoods_clean)
# Idea for extra cleaning is to assign dummy variables to classification code to make it easier to graph
# We can also just drop classification as it doesnt have data we can easily move into a model

write_csv(
  x = basic.neighbourhoods_clean,
  file = "data.neighbourhoods.csv"
)

read_csv(
  file = "data.neighbourhoods.csv",
  show_col_types = FALSE
)


#data.postal_codes
basic.postal_codes_clean <-
  clean_names(data.postal_codes) |>
  #dropping timezone
  select(
    postal_code,
    city,
    province_abbr,
    latitude,
    longitude
    
  ) |>
  # We can filter all of the non ontario dispensaries
  filter(
    province_abbr == "ON"
  )

write_csv(
  x = basic.postal_codes_clean,
  file = "data.postalcodes.csv"
)

read_csv(
  file = "data.postalcodes.csv",
  show_col_types = FALSE
)