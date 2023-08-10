complete <- function(directory, id = 1:332){
  resulting_out <- data.frame(id = numeric(0), 
                              nobs = numeric(0))
  if(length(directory) == 1){
    for (file in id){
      file_path <- paste(getwd(), "/", directory, "/", sprintf("%03d", file), ".csv", sep = "")
      # read data on the path
      obtained_data <- read.csv(file_path)
      # we have to count needed columns separately
      df_no_na <- obtained_data[(!is.na(obtained_data$sulfate)), ]
      df_no_na <- df_no_na[(!is.na(df_no_na$nitrate)), ]
      nobs <- nrow(df_no_na)
      resulting_out <- rbind(resulting_out, data.frame(id = file, nobs = nobs))
    }  
  }
  resulting_out
}
