library(stats)
library(markovchain)
library(igraph)

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
###initial distribution###
p0<-c(1,0,0)

x<-matrix(0,nsteps,1)

###Epidemic Spread###
states<-c("S","I","R")

#starting state
x[1]<-invtransform(p0,states)

#define mc as a markov chain
mc<-new("markovchain",state=states,transitionMatrix=P)
plot(mc)

#rappresentation of the markov chain with igraph
mcgraph<-as(mc, "igraph")
V(mcgraph)["S"]$color<-"dark blue"
V(mcgraph)["I"]$color<-"dark red"
V(mcgraph)["R"]$color<-"dark green"
plot(mcgraph, vertex.color=V(mcgraph)$color, vertex.size=20, vertex.label.cex=1.5, vertex.label.dist=3, edge.arrow.size=0.2, edge.label=E(mcgraph)$prob, edge.curve=0.2)

#evolution
P<-matrix(c(0.91,0,0.09,0.09,0.73,0,0,0.27,0.91),nrow = 3,ncol=3)

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
table(x) # n° of people
table(x)/nsteps # percentage of people
