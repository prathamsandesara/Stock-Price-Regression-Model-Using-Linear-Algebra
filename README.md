# 📈 Stock‑Price Regression Models (MATLAB)
*A Linear‑Algebra‑First approach to forecasting*

[![Made with MATLAB](https://img.shields.io/badge/MATLAB-R2021a%2B-orange)](#)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](#)

## Table of Contents  
1. [Project Overview](#project-overview)  
2. [Key Features](#key-features)  
3. [Methodology](#methodology)  
4. [Results](#results)  
5. [File Structure](#file-structure)  
6. [Getting Started](#getting-started)  
7. [Usage](#usage)  
8. [Limitations](#limitations)  
9. [Future Work](#future-work)  
10. [License](#license)  
11. [Contact](#contact)  

---

## 📌 Project Overview <a name="project-overview"></a>
This ENR112 Linear Algebra Laboratory project models and predicts stock prices using **linear, quadratic, and cubic regression** implemented entirely in **one MATLAB file**.  
The emphasis is on pure linear‑algebra techniques (Normal Equation) rather than black‑box machine‑learning toolboxes.  
**Goal:** Identify the simplest model that produces reliable short‑term forecasts.

---

## 🛠️ Key Features <a name="key-features"></a>
- **Single‑file implementation** (`stock_price_regression.m`) for easy sharing and reproducibility.  
- Generates a **synthetic dataset** with realistic noise to mimic market fluctuations.  
- Implements **three regression models** (linear | quadratic | cubic) solved analytically—*no iterative optimization required*.  
- Calculates **MSE** & **R²** to compare model performance.  
- Produces clear MATLAB plots of actual vs. predicted prices and future forecasts.

---

## 🔬 Methodology <a name="methodology"></a>
1. **Data Simulation**  
   - 30 days of stock prices = base price + linear trend + quadratic curvature + Gaussian noise.

2. **Design Matrices**  
   - *Linear*: `[1, x]`  
   - *Quadratic*: `[1, x, x.^2]`  
   - *Cubic*: `[1, x, x.^2, x.^3]`

3. **Parameter Estimation**  
   Normal Equation:  
   \[
     \boldsymbol{\theta} = (X^\top X)^{-1} X^\top y
   \]

4. **Evaluation Metrics**  
   - **Mean Squared Error (MSE)**  
   - **Coefficient of Determination (R²)**  

5. **Model Selection**  
   - Choose the model with the **lowest MSE** (highest R²).  

6. **Forecasting**  
   - Extend the best‑fit model to predict prices for the next **10 days**.

---

## 📊 Results <a name="results"></a>

| Model     | MSE   | R²     | Verdict      |
|-----------|-------|--------|--------------|
| Linear    | 22.56 | 0.8123 | Under‑fits   |
| Quadratic | 12.45 | 0.9287 | Better       |
| **Cubic** | **10.32** | **0.9532** | **Best fit** |

**10‑Day Forecast (Cubic Model)**  
Day 31 → 218.56
Day 32 → 231.78
…
Day 40 → 298.12

## 📂 File Structure <a name="file-structure"></a>

🔮 Future Work <a name="future-work"></a>
Replace synthetic prices with real market data via CSV import or API integration.

Add exogenous variables such as inflation rate, trading volume, or macroeconomic indicators.

Compare this method with advanced time‑series models like LSTM, Prophet, and ARIMA.

Implement cross‑validation and regularization to improve generalization.

📜 License <a name="license"></a>
This project is licensed under the MIT License.
See the LICENSE file for more information.

📬 Contact <a name="contact"></a>
Pratham Sandesara
✉️ pratham.sandesara@example.com
🔗 GitHub: https://github.com/YourUsername/stock-price-regression
