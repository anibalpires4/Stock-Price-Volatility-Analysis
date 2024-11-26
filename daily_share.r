#################
### Libraries ###
#################

library(readxl)
library(rugarch)
library(fGarch)
library(quantmod)
library(hydrostats)
library(PerformanceAnalytics)
library(dplyr)
library(tseries)
library(forecast)

###################
### Log-returns ###
###################

# ALTRI SGPS
ALTRI_SGPS_data <- read_excel("ALTRI SGPS.xls")
ALTRI_SGPS <- apply(ALTRI_SGPS_data, 2, rev)
ALTRI_SGPS_ClosePrice <- ts(as.numeric(ALTRI_SGPS[,5]), start=1, end=199)
ALTRI_SGPS_LogReturns <- diff(log(ALTRI_SGPS_ClosePrice))
summary(ALTRI_SGPS_LogReturns)
summary(ALTRI_SGPS_ClosePrice)

# MOTA ENGIL
MOTA_ENGIL_data <- read_excel("MOTA ENGIL.xls")
MOTA_ENGIL <- apply(MOTA_ENGIL_data, 2, rev)
MOTA_ENGIL_ClosePrice <- ts(as.numeric(MOTA_ENGIL[,5]), start=1, end=199)
MOTA_ENGIL_LogReturns <- diff(log(MOTA_ENGIL_ClosePrice))
summary(MOTA_ENGIL_LogReturns)
summary(MOTA_ENGIL_ClosePrice)

# REN
REN_data <- read_excel("REN.xls")
REN <- apply(REN_data, 2, rev)
REN_ClosePrice <- ts(as.numeric(REN[,5]), start=1, end=199)
REN_LogReturns <- diff(log(REN_ClosePrice))
summary(REN_LogReturns)
summary(REN_ClosePrice)

# SONAE
SONAE_data <- read_excel("SONAE.xls")
SONAE <- apply(SONAE_data, 2, rev)
SONAE_ClosePrice <- ts(as.numeric(SONAE[,5]), start=1, end=199)
SONAE_LogReturns <- diff(log(SONAE_ClosePrice))
summary(SONAE_LogReturns)
summary(SONAE_ClosePrice)

# THE NAVIGATOR COMP
THE_NAVIGATOR_COMP_data <- read_excel("THE NAVIGATOR COMP.xls")
THE_NAVIGATOR_COMP <- apply(THE_NAVIGATOR_COMP_data, 2, rev)
THE_NAVIGATOR_COMP_ClosePrice  <- ts(as.numeric(THE_NAVIGATOR_COMP[,5]), start=1, end=199)
THE_NAVIGATOR_COMP_LogReturns <- diff(log(THE_NAVIGATOR_COMP_ClosePrice))
summary(THE_NAVIGATOR_COMP_LogReturns)
summary(THE_NAVIGATOR_COMP_ClosePrice)

#######################################
### Initial examination of the data ###
#######################################

# Checking for missing values: 0 NA
sum(is.na(ALTRI_SGPS))
sum(is.na(MOTA_ENGIL))
sum(is.na(REN))
sum(is.na(SONAE))
sum(is.na(THE_NAVIGATOR_COMP))

### Time Series Plot ###

par(mfrow=c(1,2))

# ALTRI SGPS
plot(ALTRI_SGPS_ClosePrice, mgp=c(1.8,0.5,0))
plot(ALTRI_SGPS_LogReturns, mgp=c(1.8,0.5,0))
title(main = "ALTRI SGPS", line = -2, outer = TRUE)

# MOTA ENGIL
plot(MOTA_ENGIL_ClosePrice, mgp=c(1.8,0.5,0))
plot(MOTA_ENGIL_LogReturns, mgp=c(1.8,0.5,0))
title(main = "MOTA ENGIL", line = -2, outer = TRUE)

# REN
plot(REN_ClosePrice, mgp=c(1.8,0.5,0))
plot(REN_LogReturns, mgp=c(1.8,0.5,0))
title(main = "REN", line = -2, outer = TRUE)

# SONAE
plot(SONAE_ClosePrice, mgp=c(1.8,0.5,0))
plot(SONAE_LogReturns, mgp=c(1.8,0.5,0))
title(main = "SONAE", line = -2, outer = TRUE)

# THE NAVIGATOR COMP
plot(THE_NAVIGATOR_COMP_ClosePrice, mgp=c(1.8,0.5,0))
plot(THE_NAVIGATOR_COMP_LogReturns, mgp=c(1.8,0.5,0))
title(main = "THE NAVIGATOR COMP", line = -2, outer = TRUE)

### Histograms ###

par(mfrow=c(1,1))

# ALTRI SGPS
chart.Histogram(ALTRI_SGPS_LogReturns, main = "ALTRI SGPS", xlab="Log-Returns", method = c("add.density", "add.normal"), colorset = c('cornflowerblue', 'blue', 'black'), mgp=c(2,0.5,0))
legend("topright", legend = c("Frequency", "Empirical Distribution", "Normal Distribution"), fill = c('cornflowerblue', 'blue', 'black'))
skewness(ALTRI_SGPS_LogReturns) # -0.2123261; Normal = 0; slightly longer left tail compared to a normal distribution
kurtosis(ALTRI_SGPS_LogReturns) # 7.169274; Normal = 3; heavier tails and is more peaked (leptokurtic) compared to a normal distribution

# MOTA ENGIL
chart.Histogram(MOTA_ENGIL_LogReturns, main="MOTA ENGIL", xlab="Log-Returns", method = c("add.density", "add.normal"), colorset = c('cornflowerblue', 'blue', 'black'), mgp=c(2,0.5,0))
legend("topleft", legend = c("Frequency", "Empirical Distribution", "Normal Distribution"), fill = c('cornflowerblue', 'blue', 'black'))
skewness(MOTA_ENGIL_LogReturns) # 0.1531403; Normal = 0; slightly longer right tail compared to a normal distribution
kurtosis(MOTA_ENGIL_LogReturns) # 1.531386; Normal = 3; has lighter tails and is flatter (platykurtic) compared to a normal distribution

# REN
chart.Histogram(REN_LogReturns, main="REN", xlab="Log-Returns", method = c('add.density', 'add.normal'), colorset = c('cornflowerblue', 'blue', 'black'), mgp=c(2,0.5,0))
legend("topleft", legend = c("Frequency", "Empirical Distribution", "Normal Distribution"), fill = c('cornflowerblue', 'blue', 'black'))
skewness(REN_LogReturns) # -0.2858987; Normal = 0; slightly longer left tail compared to a normal distribution
kurtosis(REN_LogReturns) # 1.446319; Normal = 3; has lighter tails and is flatter (platykurtic) compared to a normal distribution

# SONAE
chart.Histogram(SONAE_LogReturns, main="SONAE", xlab="Log-Returns", method = c("add.density", "add.normal"), colorset = c('cornflowerblue', 'blue', 'black'), mgp=c(2,0.5,0))
legend("topleft", legend = c("Frequency", "Empirical Distribution", "Normal Distribution"), fill = c('cornflowerblue', 'blue', 'black'))
skewness(SONAE_LogReturns) # -0.4387559; Normal = 0; slightly longer left tail compared to a normal distribution
kurtosis(SONAE_LogReturns) # 1.500943; Normal = 3; has lighter tails and is flatter (platykurtic) compared to a normal distribution

# THE NAVIGATOR COMP
chart.Histogram(THE_NAVIGATOR_COMP_LogReturns, main="THE NAVIGATOR COMP", xlab="Log-Returns", method = c("add.density", "add.normal"), colorset = c('cornflowerblue', 'blue', 'black'), mgp=c(2,0.5,0))
legend("topleft", legend = c("Frequency", "Empirical Distribution", "Normal Distribution"), fill = c('cornflowerblue', 'blue', 'black'))
skewness(THE_NAVIGATOR_COMP_LogReturns) # -0.2504129; Normal = 0; slightly longer left tail compared to a normal distribution
kurtosis(THE_NAVIGATOR_COMP_LogReturns) # 1.350589; Normal = 3; has lighter tails and is flatter (platykurtic) compared to a normal distribution

### ACF and PACF ###
ggtsdisplay(ALTRI_SGPS_LogReturns)
ggtsdisplay(MOTA_ENGIL_LogReturns)
ggtsdisplay(REN_LogReturns)
ggtsdisplay(SONAE_LogReturns)
ggtsdisplay(THE_NAVIGATOR_COMP_LogReturns)

##################
### ALTRI SGPS ###
##################

# sGARCH(standard GARCH)
sGARCH_sstd = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="sGARCH",garchOrder=c(1,1)),distribution.model='sstd')
sGARCH_snorm = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="sGARCH",garchOrder=c(1,1)),distribution.model='snorm')

ALTRI_SGPS_sGARCH_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=sGARCH_sstd)

plot(ALTRI_SGPS_sGARCH_sstd, which='all')

print(ALTRI_SGPS_sGARCH_sstd) # -4.6379 -4.5383 -4.6397 -4.5976

# IGARCH(Integrated GARCH)
iGARCH_sstd = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="iGARCH",garchOrder=c(1,1)),distribution.model='sstd')

ALTRI_SGPS_iGARCH_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=iGARCH_sstd)

plot(ALTRI_SGPS_iGARCH_sstd, which='all') 

print(ALTRI_SGPS_iGARCH_sstd) # -4.6476 -4.5646 -4.6488 -4.6140

# GARCH-M(GARCH in mean)
GARCHM_sstd = ugarchspec(mean.model=list(include.mean=TRUE, archm=TRUE, archpow=1, armaOrder=c(0,0)), variance.model = list(model="sGARCH",garchOrder=c(1,1)),distribution.model='sstd')

ALTRI_SGPS_GARCHM_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=GARCHM_sstd)

plot(ALTRI_SGPS_GARCHM_sstd, which='all')

print(ALTRI_SGPS_GARCHM_sstd) # -4.6298 -4.5135 -4.6321 -4.5827

# EGARCH(Exponential GARCH) - Considering asymmetry 
eGARCH_sstd = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="eGARCH",garchOrder=c(1,1)),distribution.model='sstd')

ALTRI_SGPS_eGARCH_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=eGARCH_sstd)

plot(ALTRI_SGPS_eGARCH_sstd, which='all')

print(ALTRI_SGPS_eGARCH_sstd) # -4.6441 -4.5279 -4.6465 -4.5971

# GJR-GARCH(Glosten-Jagannathan-Runkle GARCH) - Exploring conditional skewness
gjrGARCH_sstd = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="gjrGARCH",garchOrder=c(1,1)),distribution.model='sstd')

ALTRI_SGPS_gjrGARCH_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=gjrGARCH_sstd)

par(mfrow=c(2,2))
plot(ALTRI_SGPS_gjrGARCH_sstd)

print(ALTRI_SGPS_gjrGARCH_sstd) # -4.6511 -4.5348 -4.6535 -4.6040

# APARCH(Asymmetric Power GARCH)
apARCH_sstd = ugarchspec(mean.model = list(armaOrder=c(0,0)), variance.model = list(model="apARCH",garchOrder=c(1,1)),distribution.model='sstd')

ALTRI_SGPS_apARCH_sstd = ugarchfit(data=ALTRI_SGPS_LogReturns, spec=apARCH_sstd)

plot(ALTRI_SGPS_apARCH_sstd, which='all')

print(ALTRI_SGPS_apARCH_sstd) # -4.6277 -4.4949 -4.6308 -4.5740

##################
### MOTA ENGIL ###
##################

# sGARCH(standard GARCH)
MOTA_ENGIL_sGARCH_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=sGARCH_sstd)
MOTA_ENGIL_sGARCH_snorm = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=sGARCH_snorm)

par(mfrow=c(1,2))
plot(MOTA_ENGIL_sGARCH_sstd)
plot(MOTA_ENGIL_sGARCH_snorm)

print(MOTA_ENGIL_sGARCH_sstd) # -5.5325 -5.4329 -5.5343 -5.4922

# IGARCH(Integrated GARCH)
MOTA_ENGIL_iGARCH_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=iGARCH_sstd)

plot(MOTA_ENGIL_iGARCH_sstd, which='all') 

print(MOTA_ENGIL_iGARCH_sstd) # -5.5424 -5.4594 -5.5437 5.5088

# GARCH-M(GARCH in mean)
MOTA_ENGIL_GARCHM_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=GARCHM_sstd)

plot(MOTA_ENGIL_GARCHM_sstd, which='all')

print(MOTA_ENGIL_GARCHM_sstd) # -5.5229 -5.4066 -5.5252 -5.4758

# EGARCH(Exponential GARCH) - Considering asymmetry
MOTA_ENGIL_eGARCH_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=eGARCH_sstd)

par(mfrow=c(2,2))
plot(MOTA_ENGIL_eGARCH_sstd) 

print(MOTA_ENGIL_eGARCH_sstd) # -5.5548 -5.4386 -5.5572 -5.5078

# GJR-GARCH(Glosten-Jagannathan-Runkle GARCH) - Exploring conditional skewness
MOTA_ENGIL_gjrGARCH_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=gjrGARCH_sstd)

plot(MOTA_ENGIL_gjrGARCH_sstd, which='all')

print(MOTA_ENGIL_gjrGARCH_sstd) # -5.5567 -5.4404 -5.5591 -5.5096

# APARCH(Asymmetric Power GARCH)
MOTA_ENGIL_apARCH_sstd = ugarchfit(data=MOTA_ENGIL_LogReturns, spec=apARCH_sstd)

plot(MOTA_ENGIL_apARCH_sstd, which='all') 

print(MOTA_ENGIL_apARCH_sstd) # -5.5468 -5.4140 -5.5499 -5.4931

###########
### REN ###
###########

# sGARCH(standard GARCH)
REN_sGARCH_sstd = ugarchfit(data=REN_LogReturns, spec=sGARCH_sstd)
REN_sGARCH_snorm = ugarchfit(data=REN_LogReturns, spec=sGARCH_snorm)

par(mfrow=c(1,2))
plot(REN_sGARCH_sstd) 
plot(REN_sGARCH_snorm) 

print(REN_sGARCH_sstd) # -6.1618 -6.0621 -6.1635 -6.1214

# IGARCH(Integrated GARCH)
REN_iGARCH_sstd = ugarchfit(data=REN_LogReturns, spec=iGARCH_sstd)

plot(REN_iGARCH_sstd, which='all') 

print(REN_iGARCH_sstd) # -6.1670 -6.0840 -6.1683 -6.1334

# GARCH-M(GARCH in mean)
REN_GARCHM_sstd = ugarchfit(data=REN_LogReturns, spec=GARCHM_sstd)

plot(REN_GARCHM_sstd, which='all')

print(REN_GARCHM_sstd) # -6.1537 -6.0375 -6.1561 -6.1067

# EGARCH(Exponential GARCH) - Considering asymmetry
REN_eGARCH_sstd = ugarchfit(data=REN_LogReturns, spec=eGARCH_sstd)

plot(REN_eGARCH_sstd, which='all')

print(REN_eGARCH_sstd) # -6.1613 -6.0451 -6.1637 -6.1142

# GJR-GARCH - Exploring conditional skewness
REN_gjrGARCH_sstd = ugarchfit(data=REN_LogReturns, spec=gjrGARCH_sstd)

plot(REN_gjrGARCH_sstd, which='all')

print(REN_gjrGARCH_sstd) # -6.1517 -6.0354 -6.1541 -6.1046

# APARCH(Asymmetric Power GARCH)
REN_apARCH_sstd = ugarchfit(data=REN_LogReturns, spec=apARCH_sstd)

par(mfrow=c(2,2))
plot(REN_apARCH_sstd)

print(REN_apARCH_sstd) # -6.1754 -6.0425 -6.1785 -6.1216

#############
### SONAE ###
#############

# sGARCH(standard GARCH)
SONAE_sGARCH_sstd = ugarchfit(data=SONAE_LogReturns, spec=sGARCH_sstd)
SONAE_sGARCH_snorm = ugarchfit(data=SONAE_LogReturns, spec=sGARCH_snorm)

par(mfrow=c(1,2))
plot(SONAE_sGARCH_sstd)
plot(SONAE_sGARCH_snorm)

print(SONAE_sGARCH_sstd) # -5.4771 -5.3775 -5.4789 -5.4368

# IGARCH(Integrated GARCH)
SONAE_iGARCH_sstd = ugarchfit(data=SONAE_LogReturns, spec=iGARCH_sstd)

par(mfrow=c(2,2))
plot(SONAE_iGARCH_sstd)

print(SONAE_iGARCH_sstd) # -5.4768 -5.3938 -5.4781 -5.4432

# GARCH-M(GARCH in mean)
solver.control = list(trace = TRUE, REPORT = 1, reltol = 1e-8)
SONAE_GARCHM_sstd = ugarchfit(data = SONAE_LogReturns, spec = GARCHM_sstd, solver = "hybrid", control = solver.control)

plot(SONAE_GARCHM_sstd, which='all')

print(SONAE_GARCHM_sstd) # -5.4903 -5.3740 -5.4927 -5.4432

# EGARCH(Exponential GARCH) - Considering asymmetry
SONAE_eGARCH_sstd = ugarchfit(data=SONAE_LogReturns, spec=eGARCH_sstd)

plot(SONAE_eGARCH_sstd, which='all')

print(SONAE_eGARCH_sstd) # -5.4688 -5.3525 -5.4712 -5.4217

# GJR-GARCH - Exploring conditional skewness
SONAE_gjrGARCH_sstd = ugarchfit(data=SONAE_LogReturns, spec=gjrGARCH_sstd)

plot(SONAE_gjrGARCH_sstd, which='all') 

print(SONAE_gjrGARCH_sstd) # -5.4766 -5.3604 -5.4790 -5.4296

# APARCH(Asymmetric Power GARCH)
SONAE_apARCH_sstd = ugarchfit(data=SONAE_LogReturns, spec=apARCH_sstd)

plot(SONAE_apARCH_sstd, which='all')

print(SONAE_apARCH_sstd) # -5.4624 -5.3296 -5.4655 -5.4086

##########################
### THE NAVIGATOR COMP ###
##########################

# sGARCH(standard GARCH)
THE_NAVIGATOR_COMP_sGARCH_sstd = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=sGARCH_sstd)
THE_NAVIGATOR_COMP_sGARCH_snorm = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=sGARCH_snorm)

par(mfrow=c(1,2))
plot(THE_NAVIGATOR_COMP_sGARCH_sstd) 
plot(THE_NAVIGATOR_COMP_sGARCH_snorm) 

print(THE_NAVIGATOR_COMP_sGARCH_sstd) # -5.3955 -5.2958 -5.3972 -5.3551

# IGARCH(Integrated GARCH)
THE_NAVIGATOR_COMP_iGARCH_sstd = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=iGARCH_sstd)

plot(THE_NAVIGATOR_COMP_iGARCH_sstd, which='all')

print(THE_NAVIGATOR_COMP_iGARCH_sstd) # -5.4055 -5.3225 -5.4068 -5.3719

# GARCH-M(GARCH in mean)
solver.control = list(trace = TRUE, REPORT = 1, reltol = 1e-8)
THE_NAVIGATOR_COMP_GARCHM_sstd = ugarchfit(data = THE_NAVIGATOR_COMP_LogReturns, spec = GARCHM_sstd, solver = "hybrid", control = solver.control)

plot(THE_NAVIGATOR_COMP_GARCHM_sstd, which='all')

print(THE_NAVIGATOR_COMP_GARCHM_sstd) # -5.3955 -5.2793 -5.3979 -5.3485

# EGARCH(Exponential GARCH) - Considering asymmetry
THE_NAVIGATOR_COMP_eGARCH_sstd = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=eGARCH_sstd)

plot(THE_NAVIGATOR_COMP_eGARCH_sstd, which='all') 

print(THE_NAVIGATOR_COMP_eGARCH_sstd) # -5.4515 -5.3352 -5.4538 -5.4044

# GJR-GARCH - Exploring conditional skewness
THE_NAVIGATOR_COMP_gjrGARCH_sstd = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=gjrGARCH_sstd)

plot(THE_NAVIGATOR_COMP_gjrGARCH_sstd, which='all')

print(THE_NAVIGATOR_COMP_gjrGARCH_sstd) # -5.4232 -5.3070 -5.4256 -5.3762

# APARCH(Asymmetric Power GARCH)
THE_NAVIGATOR_COMP_apARCH_sstd = ugarchfit(data=THE_NAVIGATOR_COMP_LogReturns, spec=apARCH_sstd)

par(mfrow=c(2,2))
plot(THE_NAVIGATOR_COMP_apARCH_sstd) 

print(THE_NAVIGATOR_COMP_apARCH_sstd) # -5.4525 -5.3196 -5.4556 -5.3987
 