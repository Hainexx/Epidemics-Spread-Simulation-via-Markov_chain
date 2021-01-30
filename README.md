# Markov Chain Assignement Report

Consider the stochastic process of spread of an epidemics in a population composed by N individuals.
Assume that each individual at each time step can be in one of the following 3 states:
- S = susceptible = not infected and not immune (then s/he can be infected)
- I = infected
- R = removed = recovered and immune, or dead

Assume also that at each time step each susceptible individual becomes infected with probability 0.09, each infected individual is removed with probability 0.27 and each removed individual returns back to be susceptible with probability 0.09.
Represent the evolution of the epidemics as a Markov chain and write the transition matrix.
Imagine now that the number N of individuals in the population is N = 10000.
If is it possible, find what will be the number of individuals in the three states S,I,R in the long run, after many time steps.

