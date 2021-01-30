### initial distribution###
p0<-c(1,0,0)

# Transition Matrix
P<-matrix(c(0.91,0,0.09,0.09,0.73,0,0,0.27,0.91),nrow = 3,ncol=3)

x<-matrix(0,nsteps,1)

###Epidemic Spread###
states<-c("S","I","R")

#starting state
x[1]<-invtransform(p0,states)

#define mc as a markov chain
mc<-new("markovchain",state=states,transitionMatrix=P)
plot(mc)
