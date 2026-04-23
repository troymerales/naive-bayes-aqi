# Air Quality and Health Case Prediction (Naive Bayes)

This project analyzes the relationship between daily air quality pollutants and the occurrence of health cases in the Philippines. We use a Naive Bayes classifier to predict the probability of a new health case based on the dataset.

## Dataset and References
* **Dataset:** [Thinking Machines - Project CCHAIN](https://thinkingmachines.github.io/project-cchain/)
* **Guidelines:** [WHO Global Air Quality Guidelines 2021](https://www.who.int/publications/i/item/9789240034228)

## Classification Logic
Raw pollutant data was categorized into variants using the **WHO 2021 Interim Targets (IT)** and **Air Quality Guidelines (AQG)**. This ensures the model's features are grounded in established health thresholds.

### PM2.5 Thresholds
| Category | Range ($\mu g/m^3$) | Description |
| :--- | :--- | :--- |
| **AQG** | $0 - 15$ | WHO Recommended Limit |
| **IT4** | $16 - 25$ | Interim Target 4 |
| **IT3** | $26 - 37.5$ | Interim Target 3 |
| **IT2** | $37.6 - 75$ | Interim Target 2 |
| **IT1** | $> 75$ | Interim Target 1 |

*Note: Similar logic is applied to NO2, SO2, and CO using 24-hour safety thresholds.*

## Model: Naive Bayes
The model calculates the posterior probability of a health case using the following formula:

$$P(y \mid x_1, \dots, x_n) \propto P(y) \prod_{i=1}^{n} P(x_i \mid y)$$

* **Prior Probability $P(y)$:** The general frequency of cases in the dataset.
* **Likelihood $\prod P(x_i \mid y)$:** The probability of observing specific pollutant levels on days when cases occurred.

## Repository Structure
* `eda.ipynb`: Exploratory Data Analysis and data distribution charts.
* `cleaned_data.csv`: The dataset after applying categorical labels.
* `manual_calc.md`: Step-by-step mathematical trace of the Bayes calculation to verify the model.
* `database/`: Original source files.
