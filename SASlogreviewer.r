#SAS Log Reviewer
#Reviews all files with the extension *.log in your working directory
#   Iterates line by line and searches for the terms WARNING, ERROR, and uninitialized.
#     Iteration is used to minimize memory issues on large files.
#   Saves flagged lines to a secondard "review" log file.

setwd("")

#Looks for SAS Log files in the working directory
pathlist<-list.files( pattern = "\\.log$")

for (z in pathlist){
    #Initialize Error Tracker
    tracker <- NULL
    
    #Open file for review
    con <- file(z, "r")
    
    maxline <- length(readLines(filepath))
        for(i in 1:(maxline-2)){
        line <- readLines(con, n =1)
        #Search for Keywords eachline
        warning       <- (grepl("WARNING",paste(line,' ')))
        error         <- (grepl("ERROR",paste(line,' ')))
        uninitialized <- (grepl("uninitialized",paste(line,' ')))
        
        #if Keyword appears, print in console and save to tracker
          if (warning|error|uninitialized) {
            print(line)
            tracker<-rbind(tracker,line)
          }
        }
    close(con)
    #Saved with "Review_[log name]"
    write(tracker, file=paste("Review_",z,".txt",sep=""))
}

