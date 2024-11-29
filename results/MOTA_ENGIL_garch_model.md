### Mota-Engil: Fitted GARCH Model ###

#### Model Selection Measures:
| Model            | AIC      | BIC      | SIC      | HQIC     |
|------------------|----------|----------|----------|----------|
| SGARCH(1,1)      | -5.5325  | -5.4329  | -5.5343  | -5.4922  |
| IGARCH(1,1)      | -5.5424  | -5.4594  | -5.5437  | -5.5088  |
| GARCH-M(1,1)     | -5.5229  | -5.4066  | -5.5252  | -5.4758  |
| EGARCH(1,1)      | **-5.5548** | **-5.4386** | **-5.5572** | **-5.5078** |
| GJR-GARCH(1,1)   | -5.5567  | -5.4404  | -5.4404  | -5.4404  |
| APARCH(1,1)      | -5.5468  | -5.4140  | -5.5499  | -5.4931  |

#### Selected Model:
- The **GJR-GARCH(1,1)** has the best AIC value, but due to non-significant parameters, the **EGARCH(1,1)** was chosen as the best model.

#### Model Equation:
$$
\ln(\sigma_t^2) = -0.55 - 0.16(|X_{t-1}| + 0.28X_{t-1}) + 0.93 \ln(\sigma_{t-1}^2)
$$

- Parameters:
  - $\mu \approx 0.00$ (not significant)
  - $\omega = -0.55$ (significant at all levels)
  - $\alpha_1 = -0.16$ (significant at all levels)
  - $\gamma_1 = 0.28$ (significant at all levels)
  - $\beta_1 = 0.93$ (significant at all levels)

#### Residual Diagnostics:
- **Ljung-Box Test**:
  - Standardized Residuals: $p > 0.05$ (No autocorrelation)
  - Squared Residuals: $p > 0.05$ (No remaining ARCH effects)
- **ARCH-LM Test**:
  - $p > 0.05$ (No remaining ARCH effects)

#### Key Insights:
- The model captures **volatility clustering** effectively.
- Negative shocks have a **bigger impact** than positive shocks.
- Residuals are white noise and appear normal.
- The News Impact Curve suggests **asymmetric responses** to new information, consistent with financial time series behavior.
