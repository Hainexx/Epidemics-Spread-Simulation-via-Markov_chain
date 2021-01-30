invtransform<-function(p,s){
        #generate a random number in the states s, 
        #with discrete distribution p with the method of
        #the inverse transform
        
        #s=vector of states
        #p=probability of each state. Vector of the same length as s
        n<-length(p)
        cs<-cumsum(p) # vector of the cumulative sums
        u<-runif(1,min = 0,max = 1) # generate a random number
        d<-cs-u # difference between all the values of the vector and the random value
        i<-min(which(d>0)) # algorithm to change the state based on the given probability
        s[i] # returns the right states, picked from the vector containing the possible states
}

###n. of simulated steps###
nsteps<-10000