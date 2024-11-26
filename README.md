# Stock Price Volatility Analysis Using GARCH Models

This repository contains an in-depth analysis of daily stock prices for five prominent Portuguese companies listed on Euronext Lisbon. The study leverages GARCH-type models to analyze the volatility dynamics of stock log-returns, providing valuable insights for financial forecasting and risk management.

---

## Overview

Financial markets are inherently volatile, with stock prices subject to rapid changes influenced by various factors. This study focuses on five Portuguese companies and uses GARCH models to analyze log-returns, capturing the time-varying nature of volatility and its asymmetric effects.

### Key Features
- **Companies Analyzed**:
  1. Altri-SGPS
  2. Mota Engil
  3. REN
  4. Sonae
  5. The Navigator Company
- **Data Source**: Daily closing prices from January 5, 2022, to October 12, 2022.
- **Objectives**:
  - Calculate log-returns from daily closing prices.
  - Fit and evaluate GARCH-type models to identify the best volatility model.
  - Assess volatility asymmetry and clustering using advanced diagnostics.
- **Models Used**:
  - Standard GARCH (SGARCH)
  - Integrated GARCH (IGARCH)
  - GARCH-in-Mean (GARCH-M)
  - Exponential GARCH (EGARCH)
  - Glosten-Jagannathan-Runkle GARCH (GJR-GARCH)
  - Asymmetric Power ARCH (APARCH)

---

## Methodology

### Data Preprocessing
- **Log-Returns**:
  Log-returns (\(Y_t\)) were calculated as:
  \[
  Y_t = \log\left(\frac{P_t}{P_{t-1}}\right)
  \]
  where \(P_t\) is the closing price at time \(t\).

- **Distribution Selection**:
  Based on skewness, kurtosis, and QQ-plots, the skewed t-Student distribution was used to model standardized residuals.

### GARCH Models
GARCH models capture time-varying volatility by incorporating past variances and squared residuals. The general GARCH(p, q) model is defined as:
\[
\sigma_t^2 = \omega + \sum_{i=1}^p \alpha_i X_{t-i}^2 + \sum_{j=1}^q \beta_j \sigma_{t-j}^2
\]
Where:
- \(\sigma_t^2\): Conditional variance (volatility).
- \(\alpha_i\), \(\beta_j\): Model parameters.

---

## Results and Findings

### Best Models by Company
| Company               | Best Model      | Equation                                                                 |
|-----------------------|----------------|-----------------------------------------------------------------------|
| **Altri-SGPS**        | GJR-GARCH(1,1) | \(\sigma_t^2 = 0.01(X_{t-1}^2 - 0.03I_{t-1} X_{t-1}^2) + 1.00\sigma_{t-1}^2\) |
| **Mota Engil**        | EGARCH(1,1)    | \(\ln(\sigma_t^2) = -0.55 - 0.16(|X_{t-1}| + 0.28X_{t-1}) + 0.93\ln(\sigma_{t-1}^2)\) |
| **REN**               | APARCH(1,1)    | \(\sigma_t^{0.28} = 0.01 + 0.02(|X_{t-1}| - 0.99X_{t-1})^{0.28} + 0.96\sigma_{t-1}^{0.28}\) |
| **Sonae**             | IGARCH(1,1)    | \(\sigma_t^2 = 0.10X_{t-1}^2 + 0.90\sigma_{t-1}^2\)                             |
| **The Navigator Co.** | APARCH(1,1)    | \(\sigma_t^{0.67} = 0.01 + 0.11(|X_{t-1}| + 1.00X_{t-1})^{0.67} + 0.73\sigma_{t-1}^{0.67}\) |

### Residual Diagnostics
- **Ljung-Box Test**:
  - High p-values indicated no autocorrelation in residuals.
- **ARCH-LM Test**:
  - Residuals exhibited no remaining ARCH effect.

---

## Technologies
- **Programming Language**: R
- **Libraries**:
  - `rugarch` (GARCH modelling)
  - `tseries` (Diagnostics)
  - `ggplot2` (Visualization)

---

## Usage

1. **Clone the repository**:
   ```bash
   git clone https://github.com/anibalpires4/Stock-Price-Volatility-Analysis.git

