pollutantmean <- function(directory, pollutant, id = 1:332){
      if(length(directory) == 1){
          if(pollutant == "sulfate" || pollutant == "nitrate"){
                pollutant_values <- numeric()
                for(file in id){
                    file_path <- paste(getwd(), "/", directory, "/", sprintf("%03d", file), ".csv", sep = "")
                    # read data on the path
                    obtained_data <- read.csv(file_path)
                    # read data on the pollutant
                    data_on_pollutant <- obtained_data[[pollutant]]
                    # all the data about pollutant write to the vector
                    pollutant_values <- c(pollutant_values, 
                                         data_on_pollutant[!is.na(data_on_pollutant)])
                }
                # mean on all the values
                mean(pollutant_values)  
          } else { 
                paste("No entered pollution type", pollutant)}
      } else {
          paste("Entered directory ", directory, "does not exist!")
      }
}
