rankall <- function(outcome, num = "best") {
        indici<-c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
        states<-NULL
        hnames<-NULL
        ## Read outcome data
        results <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)
        ## Check that outcome and rank are valid
        if (!(outcome %in% names(indici))){
                stop("invalid outcome")
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
        sub<-subset(results, (!is.na(results[,rate])))
        ##Pick the Hospital name (2) the State (7)and the outcome column provided            
        sub<-sub[,c(2,7,rate)]
        ##Order the dataframe by State, Outcome and name0
        sub<-sub[order(sub[2],sub[3],sub[1]),]
        ##Split the Dataframe by state
        all<-split(sub,sub$State)
        ##for every element of all list extract the desired rank element
        for (i in seq_along(all)) {
                Curr<-all[[i]]
                index=if(num=="best"){1}else if (num=="worst"){nrow(Curr)}else {num}
                hnames<-append(hnames,Curr[index,1])
                states<-append(states,Curr[1,2])
                
        }
        final<-data.frame(hnames,states)
        colnames(final)<-c("hospital","state")
        row.names(final)<-final$state ##not sure why but it's for compliance with the assignement text
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        return(final)
}