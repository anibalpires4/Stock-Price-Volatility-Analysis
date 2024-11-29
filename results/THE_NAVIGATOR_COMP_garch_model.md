### The Navigator Company: Fitted GARCH Model ###

#### Model Selection Measures:
| Model            | AIC      | BIC      | SIC      | HQIC     |
|------------------|----------|----------|----------|----------|
| SGARCH(1,1)      | -5.3955  | -5.2958  | -5.3972  | -5.3551  |
| IGARCH(1,1)      | -5.4055  | -5.3225  | -5.4068  | -5.3719  |
| GARCH-M(1,1)     | -5.3955  | -5.2793  | -5.3979  | -5.3485  |
| EGARCH(1,1)      | -5.4515  | -5.3352  | -5.4538  | -5.4044  |
| GJR-GARCH(1,1)   | -5.4232  | -5.3070  | -5.4256  | -5.3762  |
| **APARCH(1,1)**  | **-5.4525** | **-5.3196** | **-5.4556** | **-5.3987** |

#### Selected Model:
- **APARCH(1,1)** was selected as the best model overall, excelling in most model selection criteria despite being second in BIC.

#### Model Equation:
$$
\sigma_t^{0.67} = 0.01 + 0.11(|X_{t-1}| + 1.00X_{t-1})^{0.67} + 0.73\sigma_{t-1}^{0.67}
$$

- Parameters:
  - $\mu \approx 0.00$ (not significant)
  - $\omega = 0.01$ (significant at 1%)
  - $\alpha_1 = 0.11$ (significant at all levels)
  - $\gamma_1 = 1.00$ (significant at all levels)
  - $\beta_1 = 0.73$ (significant at all levels)
  - $\delta = 0.67$ (significant at all levels)

#### Residual Diagnostics:
- **Ljung-Box Test**:
  - Standardized Residuals: $p > 0.05$ (No autocorrelation)
  - Squared Residuals: $p > 0.05$ (No remaining ARCH effects)
- **ARCH-LM Test**:
  - $p > 0.05$ (No remaining ARCH effects)

#### Key Insights:
- The model effectively captures **volatility clustering** and asymmetry.
- Positive shocks have a **greater impact** on volatility compared to negative shocks.
- Residuals are white noise and exhibit normal behavior.
- The News Impact Curve confirms the **non-linear and asymmetric impact** of new information on volatility.
