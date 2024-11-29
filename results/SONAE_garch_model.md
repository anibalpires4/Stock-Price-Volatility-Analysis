### Sonae: Fitted GARCH Model ###

#### Model Selection Measures:
| Model            | AIC      | BIC      | SIC      | HQIC     |
|------------------|----------|----------|----------|----------|
| SGARCH(1,1)      | -5.4771  | -5.3775  | -5.4789  | -5.4368  |
| IGARCH(1,1)      | -5.4768  | -5.3938  | -5.4781  | -5.4432  |
| GARCH-M(1,1)     | -5.4903  | -5.3740  | -5.4927  | -5.4432  |
| EGARCH(1,1)      | -5.4688  | -5.3525  | -5.4712  | -5.4217  |
| GJR-GARCH(1,1)   | -5.4766  | -5.3604  | -5.4790  | -5.4296  |
| APARCH(1,1)      | -5.4624  | -5.3296  | -5.4655  | -5.4086  |

#### Selected Model:
- **IGARCH(1,1)** was selected despite GARCH-M(1,1) being the best in terms of AIC. This decision was made due to the lack of statistical significance of parameters in GARCH-M(1,1).

#### Model Equation:
$$
\sigma_t^2 = 0.10 X_{t-1}^2 + 0.90 \sigma_{t-1}^2
$$

- Parameters:
  - $\alpha_1 = 0.10$ (significant at all levels)
  - $\beta_1 = 0.90$ (significant at all levels)
  - $\mu$ and $\omega$ were not statistically significant in GARCH-M(1,1), leading to the selection of IGARCH(1,1).

#### Residual Diagnostics:
- **Ljung-Box Test**:
  - Standardized Residuals: $p > 0.05$ (No autocorrelation)
  - Squared Residuals: $p > 0.05$ (No remaining ARCH effects)
- **ARCH-LM Test**:
  - $p > 0.05$ (No remaining ARCH effects)

#### Key Insights:
- Residuals are white noise and appear normal.
- None of the bars in the ACF plots are above the dashed red line, indicating no autocorrelation.
- The empirical density of standardized residuals is more concentrated around zero and matches the expected normal distribution.
- The selected model effectively captures **volatility clustering**, a key characteristic of financial time series.
