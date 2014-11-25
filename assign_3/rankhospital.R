rankhospital <- function(state, outcome, num = "best") {
        indici<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
        ## Read outcome data
        results <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)
        ## Check that state outcome and rank are valid
        if (!(outcome %in% names(indici))){
                stop("invalid outcome")
        }
        else if (!(state %in% results$State)){
                stop("invalid state")
        }
        else if (is.character(num)& !(num=="best"| num=="worst")){
                stop("invalid rank (char)")
        }
        else if (is.numeric(num)){
                if(!(num%%1==0)){ stop("invalid rank (float)")}
        }
        rate<-indici[[outcome]]
        suppressWarnings(results[,rate]<-as.numeric(results[,rate]))
        ##Subset by State and not-NA values in the desired outcome
        sub<-subset(results, (results$State==state & !is.na(results[,rate])))
        ##Pick the Hospital name (2) and the outcome column provided            
        sub<-sub[,c(2,rate)]
        ##convert literal params in indexes
        index=if(num=="best"){1}else if (num=="worst"){length(sub[,1])}else {num}
        ##Sort the dataframe by outcome, and name
        sub<-sub[order(sub[2],sub[1]),]
        ##ranks the rows
        row.names(sub)<-1:length(sub[,1])
        final<-sub[index,1]
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        return(final)
}