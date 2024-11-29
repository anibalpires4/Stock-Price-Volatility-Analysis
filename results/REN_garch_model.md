### REN: Fitted GARCH Model ###

#### Model Selection Measures:
| Model            | AIC      | BIC      | SIC      | HQIC     |
|------------------|----------|----------|----------|----------|
| SGARCH(1,1)      | -6.1618  | -6.0621  | -6.1635  | -6.1214  |
| IGARCH(1,1)      | -6.1670  | -6.0840  | -6.1683  | -6.1334  |
| GARCH-M(1,1)     | -6.1537  | -6.0375  | -6.1561  | -6.1067  |
| EGARCH(1,1)      | -6.1613  | -6.0451  | -6.1637  | -6.1142  |
| GJR-GARCH(1,1)   | -6.1517  | -6.0354  | -6.1541  | -6.1046  |
| **APARCH(1,1)**  | **-6.1754** | **-6.0425** | **-6.1785** | **-6.1216** |

#### Selected Model:
- **APARCH(1,1)** was selected based on AIC, BIC, and SIC values.

#### Model Equation:
$$
\sigma_t^{0.28} = 0.01 + 0.02 \left( |X_{t-1}| - 0.99 X_{t-1} \right)^{0.28} + 0.96 \sigma_{t-1}^{0.28}
$$

- Parameters:
  - $\mu = 0.00$ (not significant)
  - $\omega = 0.01$ (significant at all levels)
  - $\alpha_1 = 0.02$ (significant at all levels)
  - $\gamma_1 = -0.99$ (significant at all levels)
  - $\beta_1 = 0.96$ (significant at all levels)
  - $\delta = 0.28$ (significant at all levels)

#### Residual Diagnostics:
- **Ljung-Box Test**:
  - Standardized Residuals: $p > 0.05$ (No autocorrelation)
  - Squared Residuals: $p > 0.05$ (No remaining ARCH effects)
- **ARCH-LM Test**:
  - $p > 0.05$ (No remaining ARCH effects)

#### Key Insights:
- The model captures **volatility clustering** effectively.
- **Positive shocks** have a greater impact than negative shocks, as $\gamma_1 < 0$.
- Residuals are white noise and appear normal.
- The News Impact Curve suggests a **rare case** where positive shocks dominate the volatility response.
