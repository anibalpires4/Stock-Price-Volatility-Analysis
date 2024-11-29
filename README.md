# Stock Price Volatility Analysis Using GARCH Models

This repository presents an in-depth analysis of daily stock prices for five prominent Portuguese companies listed on Euronext Lisbon. Leveraging GARCH-type models, this study explores the volatility dynamics of stock log-returns, offering insights into financial forecasting and risk management.

---

## Overview

Financial markets exhibit inherent volatility, with stock prices influenced by various factors. This project focuses on understanding and modeling the time-varying nature of volatility and its asymmetric effects using GARCH-type models. The analysis involves:

- **Companies Analyzed**: Altri-SGPS, Mota Engil, REN, Sonae, The Navigator Company
- **Data Period**: January 5, 2022, to October 12, 2022
- **Key Objectives**:
  - Calculate log-returns from daily closing prices.
  - Fit and evaluate GARCH-type models to identify the best-fit volatility model.
  - Assess volatility clustering and asymmetry.

---

## Methodology

### Data Preprocessing:
- **Log-Returns**:
  Log-returns (\(Y_t\)) were calculated as:
  \[
  Y_t = \log\left(\frac{P_t}{P_{t-1}}\right)
  \]
  where \(P_t\) is the closing price at time \(t\).
- **Distribution Selection**:
  Based on skewness, kurtosis, and QQ-plots, the skewed t-Student distribution was chosen for standardized residuals.

### GARCH Models:
The following models were applied to capture time-varying volatility and asymmetry:
- Standard GARCH (SGARCH)
- Integrated GARCH (IGARCH)
- GARCH-in-Mean (GARCH-M)
- Exponential GARCH (EGARCH)
- Glosten-Jagannathan-Runkle GARCH (GJR-GARCH)
- Asymmetric Power ARCH (APARCH)

### Model Selection:
- Based on AIC, BIC, SIC, and HQIC criteria.
- Residual diagnostics using Ljung-Box and ARCH-LM tests confirmed adequacy.

---

## Results and Findings

### Best Models by Company:
| **Company**           | **Best Model**      | **Key Insights**                                      |
|-----------------------|--------------------|-------------------------------------------------------|
| **Altri-SGPS**        | GJR-GARCH(1,1)    | Asymmetric impact of negative shocks on volatility.   |
| **Mota Engil**        | EGARCH(1,1)       | Higher impact of negative shocks, leveraging leverage effects. |
| **REN**               | APARCH(1,1)       | Significant volatility clustering and asymmetry.      |
| **Sonae**             | IGARCH(1,1)       | Persistent volatility due to unit root characteristics. |
| **The Navigator Co.** | APARCH(1,1)       | High sensitivity to positive and negative shocks.     |

### Residual Diagnostics:
- **Ljung-Box Test**:
  - High p-values indicated no autocorrelation in residuals.
- **ARCH-LM Test**:
  - Residuals exhibited no remaining ARCH effect.

### Volatility Clustering:
- All models successfully captured volatility clustering, a key characteristic of financial time series.

---

## Technologies

- **Programming Language**: R
- **Key Libraries**:
  - `rugarch` (GARCH modelling)
  - `tseries` (Diagnostics)
  - `ggplot2` (Visualization)

---

## Key Insights

1. **Volatility Dynamics**: GARCH-type models provide robust tools for analyzing time-varying volatility in financial markets.
2. **Model Selection**: AIC and SIC consistently identified the best-fit models, demonstrating their effectiveness in volatility analysis.
3. **Practical Applications**: These models are critical for stock price prediction, risk management, and portfolio optimization.

---

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/anibalpires4/Stock-Price-Volatility-Analysis.git
