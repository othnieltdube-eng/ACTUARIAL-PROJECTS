#Portfolio Risk Model
#Author: Othniel Dube
#Measures return,volatility and Value-at-Risk for FTSE 100 portfolio
install.packages(c("quantmod"))
install.packages(c("PerformanceAnalytics"))
library(quantmod)
library(PerformanceAnalytics)
tickers<-c("HSBA.L","SHEL.L","ULVR.L","AZN.L")
#HSBC, SHELL,Unilever, AstraZenenca
getSymbols(tickers,src = "yahoo",from = "2021-01-01")
prices<- na.omit(prices)
sum(is.na(HSBA.L))
sum(is.na(prices))
#data is now clean 
returns<-na.omit(ROC(prices,type = "discrete"))
#daily % change 
annual_return<- colMeans(returns)*252
dim(prices)
class(returns)
dim(returns)
#there is a data error
rm(list = ls())
library(quantmod)
tickers <- c("HSBA.L", "SHEL.L", "ULVR.L", "AZN.L")
getSymbols(tickers, src = "yahoo", from = "2021-01-01")
dim(HSBA.L); dim(SHEL.L); dim(ULVR.L); dim(AZN.L)
prices <- merge(Ad(HSBA.L), Ad(SHEL.L), Ad(ULVR.L), Ad(AZN.L))
colnames(prices) <- tickers
prices <- na.omit(prices)
dim(prices)
tail(prices)
returns<-na.omit(ROC(prices,type="discrete"))
#daily % change
annual_return<-colMean(returns)*252
annual_return<-colMeans(returns)*252
annual_vol<-apply(returns,2,sd)*sqrt(252)
round(annual_return*100,2)
round(annual_vol*100,2)
weights<-c(0.25,0.25,0.25,0.25)
port_returns<-xts(returns %*% weights,order.by = index (returns))
colnames(port_returns)<-"portfolio"
port_vol<-sqrt(t(weights) %*% cov_matrix %*% weights)*sqrt(252)
cat("Portfolio annual volatility:", round(port_vol*100,2),"%\n")
cat("1-day 95% VaR(historical):£",round(-var_hist*portfoliio_value,2) "\n")
cat("1-day 95% VaR(historical):£",round(-var_hist*portfoliio_value,2),"\n")
portfolio_value <- 10000

var_hist  <- quantile(port_returns, 0.05)
var_param <- mean(port_returns) - 1.645 * sd(port_returns)

cat("1-day 95% VaR (historical): £", round(-var_hist * portfolio_value, 2), "\n")
cat("1-day 95% VaR (parametric): £", round(-var_param * portfolio_value, 2), "\n")
weights <- c(0.25, 0.25, 0.25, 0.25)
port_returns <- xts(returns %*% weights, order.by = index(returns))
colnames(port_returns) <- "Portfolio"
portfolio_value <- 10000
png("cumulative_returns.png", width = 900, height = 500)
chart.CumReturns(returns, legend.loc = "topleft", main = "Cumulative returns since 2021")
dev.off()
png("var_histogram.png", width = 900, height = 500)
hist(as.numeric(port_returns), breaks = 60, col = "grey",
     main = "Daily portfolio returns with 95% VaR", xlab = "Daily return")
abline(v = var_hist, col = "red", lwd = 2)
dev.off()