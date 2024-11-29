### ALTRI-SGPS: Fitted GARCH Model ###

#### Model Selection Measures:
| Model            | AIC      | BIC      | SIC      | HQIC     |
|------------------|----------|----------|----------|----------|
| SGARCH(1,1)      | -4.6379  | -4.5383  | -4.6397  | -4.5976  |
| IGARCH(1,1)      | -4.6476  | -4.5646  | -4.6488  | -4.6140  |
| GARCH-M(1,1)     | -4.6298  | -4.5135  | -4.6321  | -4.5827  |
| EGARCH(1,1)      | -4.6441  | -4.5279  | -4.6465  | -4.5971  |
| **GJR-GARCH(1,1)** | **-4.6511** | **-4.5348** | **-4.6535** | **-4.6040** |
| APARCH(1,1)      | -4.6277  | -4.4949  | -4.6308  | -4.5740  |

#### Selected Model:
- **GJR-GARCH(1,1)** was selected based on AIC and SIC values.

#### Model Equation:
$$
\sigma_t^2 = 0.01(X_{t-1}^2 - 0.03I_{t-1} X_{t-1}^2) + 1.00\sigma_{t-1}^2
$$

- Parameters:
  - $\mu \approx 0.00$ (not significant)
  - $\omega \approx 0.00$ (not significant)
  - $\alpha_1 = 0.01$ (significant at 1%)
  - $\gamma_1 = -0.03$ (significant at 1%)
  - $\beta_1 = 1.00$ (significant at all levels)

#### Residual Diagnostics:
- **Ljung-Box Test**:
  - Standardized Residuals: $p > 0.05$ (No autocorrelation)
  - Squared Residuals: $p > 0.05$ (No remaining ARCH effects)
- **ARCH-LM Test**:
  - $p > 0.05$ (No remaining ARCH effects)

#### Key Insights:
- The model captures **volatility clustering** effectively.
- Asymmetric impact of **negative shocks** on volatility.
- Residuals are white noise and appear normal.
- The News Impact Curve suggests a **non-linear and asymmetric response** of volatility to new information.

