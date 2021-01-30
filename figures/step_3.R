for (j in c(2:nsteps)){ # runs the changing state algorithm for each step
        if (x[j-1]=="S") # checks if the state is equal to S
                nrow<-1
        else { 
                if (x[j-1]=="I") { # checks if the state is equal to I
                        nrow<-2
                } else { # if the state is not S or I then it's R
                        nrow<-3
                }
        }
        x[j]<-invtransform(P[nrow,],states)  # runs the algorithm for the given probability (row vector of the transition matrix)
}

x
table(x) # n? of people
table(x)/nsteps # percentage of people
