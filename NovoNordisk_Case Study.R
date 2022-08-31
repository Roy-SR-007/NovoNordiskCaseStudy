# install.packages("nlme")
# install.packages("JWileymisc")
# library(JWileymisc)

n = 376 # Total number of data points

set.seed(69)

# Markers involved in the study
# SBP, DBP, WC, HDLC, LDLC, TC, TG, BMI and BW

# We consider the same sets of individuals or subjects across
# the three visits over Treatment A as well as Treatment B.

# Simulating gender and age (>=65 (1) & <65(0))

age = rbinom(n,1,0.5)

gen = rbinom(n,1,0.5)


# Treatment A -------------------------------------------------------------

# Simulating data for Visit 1

# The mean and standard deviations for the markers are given

m.A_v1 = c(139.2,83,121,47.5,105.2,184.9,243.9,36.4,107.4)
sd.A_v1 = c(17.07,10.85,15.02,13.08,37.72,47.85,188.58,6.79,22.58)

v1.A = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v1.A[,i] = rnorm(n,m.A_v1[i],sd.A_v1[i])
}

v1.A = cbind(cbind(cbind(rep(1,n),v1.A),gen),age)

# Simulating data for Visit 2

# The mean and standard deviations for the markers are given

m.A_v2 = c(135.5,82.1,117.6,47.3,100.5,176.3,213.6,33.9,90.3)
sd.A_v2 = c(14.89,10.8,14.77,12.99,30.89,45.18,145.33,6.73,20.31)

v2.A = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v2.A[,i] = rnorm(n,m.A_v2[i],sd.A_v2[i])
}

v2.A = cbind(cbind(cbind(rep(2,n),v2.A),gen),age)

# Simulating data for Visit 3

# The mean and standard deviations for the markers are given

m.A_v3 = c(137.4,82.3,116,47,96.3,167.7,197,28.5,81.7)
sd.A_v3 = c(16.2,10.7,15.54,12.34,34.8,42.73,129.94,6.03,18.88)

v3.A = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v3.A[,i] = rnorm(n,m.A_v3[i],sd.A_v3[i])
}

v3.A = cbind(cbind(cbind(rep(3,n),v3.A),gen),age)

# Data for Treatment A

tA = rbind(rbind(v1.A,v2.A),v3.A)

tA = cbind(rep("A",n*3),tA)


# Treatment B -------------------------------------------------------------

# Simulating data for Visit 1

# The mean and standard deviations for the markers are given

m.B_v1 = c(135.1,83.4,111.8,45.6,95.4,172.7,170.7,38.2,109.8)
sd.B_v1 = c(14.26,9.12,13.32,11.22,34.71,41.03,91.5,5.92,23.45)
  
v1.B = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v1.B[,i] = rnorm(n,m.B_v1[i],sd.B_v1[i])
}

v1.B = cbind(cbind(cbind(rep(1,n),v1.B),age),gen)

# Simulating data for Visit 2

# The mean and standard deviations for the markers are given

m.B_v2 = c(136.1,78.8,108.8,46.3,90.9,163.5,159.1,34.7,94.4)
sd.B_v2 = c(14.89,8.68,13.1,12.44,33.23,439.87,83.77,5.43,20.11)

v2.B = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v2.B[,i] = rnorm(n,m.B_v2[i],sd.B_v2[i])
}

v2.B = cbind(cbind(cbind(rep(2,n),v2.B),age),gen)

# Simulating data for Visit 3

# The mean and standard deviations for the markers are given

m.B_v3 = c(140.6,78.2,107.6,48.1,82.5,157,143.9,29.3,85.9)
sd.B_v3 = c(17.94,7.54,13.57,28.64,31.85,37.77,71.93,5.02,19.85)

v3.B = matrix(0,nrow=n,ncol=9)

for(i in 1:9)
{
  v3.B[,i] = rnorm(n,m.B_v3[i],sd.B_v3[i])
}

v3.B = cbind(cbind(cbind(rep(3,n),v3.B),gen),age)

# Data for Treatment B

tB = rbind(rbind(v1.B,v2.B),v3.B)

tB = cbind(rep("B",n*3),tB)


# The merged data set.

d = rbind(tA,tB)
write.csv(d,"C:/Users/somji/OneDrive/Desktop/novodata.csv")



# -------------------------------------------------------------------------

d = read.csv("C:/Users/somji/OneDrive/Desktop/novodata.csv")

# EDA ------------------------------------------------------------

# We will present few EDAs towards the analysis based on the 
# given objectives



