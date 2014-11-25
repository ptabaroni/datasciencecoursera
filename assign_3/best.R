best <- function(state, outcome) {
        indici<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
        ## Read outcome data
        results <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)
        ## Check that state and outcome are valid
        if (!(outcome %in% names(indici))){
                stop("invalid outcome")
        }
        else if (!(state %in% results$State)){
                stop("invalid state")
        }
        rate<-indici[[outcome]]
        suppressWarnings(results[,rate]<-as.numeric(results[,rate]))
        
        ##Subset by State and not-NA values in the desired outcome
        sub<-subset(results, (results$State==state & !is.na(results[,rate])))
        ##Pick the Hospital name (2)and the outcome column provided            
        sub<-sub[,c(2,rate)]
        vmin<-min(sub[,2])
        candidate<-which(sub[,2]==vmin)
        #Sort alphabetically just in case
        final<-sort(sub[candidate,1])
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        return(final)
}