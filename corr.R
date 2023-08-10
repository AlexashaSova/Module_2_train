corr <- function(directory, threshold = 0) {
  # some vector to store threshold
  correlation_vector <- numeric(0)
  
  # complete rows of the DF
  comp_cases <- complete(directory)
  comp_cases <- comp_cases[comp_cases$nobs >= threshold, ]
  
  if(nrow(comp_cases) > 0){
    for(file in comp_cases$id){
        file_path <- paste(getwd(), "/", directory, "/", sprintf("%03d", file), ".csv", sep = "")
        # read data on the path
        obtained_data <- read.csv(file_path)
        df_no_na <- obtained_data[(!is.na(obtained_data$sulfate)), ]
        df_no_na <- df_no_na[(!is.na(df_no_na$nitrate)), ]
        sulfate_df <- df_no_na["sulfate"]
        nitrate_df <- df_no_na["nitrate"]
        correlation_vector <- c(correlation_vector, 
                                cor(sulfate_df, nitrate_df))
    }
  } 
  # return threshold vector
  correlation_vector
}