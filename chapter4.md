---
title: 'Understanding Outcomes'
description: 'Piecing it altogether with sensitivty and scenario analysis'
---

## Building a Business Case

```yaml
type: VideoExercise
key: ded2b868e3
lang: r
xp: 50
skills: 1
```

`@projector_key`
6f7db76a0c96d180b2eba617eb2da44a

---

## Identifying incremental costs

```yaml
type: PureMultipleChoiceExercise
key: 98768942f1
xp: 50
```

For valuing a *project* versus *company*, we want to only consider the **incremental** revenue generated and costs incurred.  Consider the Tidyverse Cafe's possible expansion into nitro coffee. Which of the following costs is **NOT** incremental (and, thus, should not be included in our model)?

`@hint`


`@possible_answers`


`@feedback`
- This cost is incremental and directly related to the proposed project.
- This cost is incremental and directly related to the proposed project.
- This is not incremental. This is an overall cost of running the business but not specifically related to the project.
- This cost is incremental and directly related to the proposed project.

---

## Cafe Model

```yaml
type: NormalExercise
key: cee611318c
xp: 100
```

Let's recall our knowledge from chapter 1 and code the business model for our proposed expansion into nitro coffee. In future exercises, we will assume this is already a function, but we want to be sure we understand everything going on "under the hood". If you're stuck, refer back to the context in the slide s.

`@instructions`
- Explore `assumptions` in the console with `head()` and `names()` to see what is included
- From the console, plot some of the assumptions to understand the trends.  Here's code to start: `ggplot(assumptions, aes(x = year, y = unit_sales_per_day)) + geom_line()`
- Fill in the blanks to complete calculations for `total_revenue`, `total_expenses`, and `operating_income`
- Make sure you understand all of the other line items and logic used in calculations

`@hint`
- The only source of `total_revenue` is `sales_revenue`
-  For calculating `total_expenses`, look what individual expenses we calculated for you
- `operating_income` is the difference between `total_revenues` and `total_expenses`

`@pre_exercise_code`
```{r}
library(dplyr)
library(ggplot2)

assumptions <- 
  data.frame(
    year = c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L),
    unit_sales_per_day = c(0L, 10L, 12L, 14L, 15L, 16L, 17L, 18L, 18L, 18L, 18L),
    capex = c(5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L),
    pct_cannibalization = c(0, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
                            0.25, 0.25),
    maintenance_cost = c(0L, 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                         250L, 250L),
    depreciation_cost = c(0L, 500L, 500L, 500L, 500L, 500L, 500L, 500L, 500L,
                          500L, 500L),
    profit_margin_per_nitro = c(3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L),
    profit_margin_per_regular = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
    labor_cost_per_hour = c(8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8),
    days_open_per_year = c(250,250,250,250,250,250,250,250,250,250,250)
  )


tax_rate <- 0.36
```

`@sample_code`
```{r}
cashflow_statement <-
  mutate( assumptions,
    sales_per_year = unit_sales_per_day * days_open_per_year,
    sales_revenue = sales_per_year * profit_margin_per_nitro,
    total_revenue = ___,
    labor_cost = days_open_per_year * 0.5 * labor_cost_per_hour,
    cannibalization_cost = sales_per_year * pct_cannibalization * profit_margin_per_regular,
    total_expense = labor_cost + ___ + maintenance_cost,
    operating_income = ___ - ___,
    nibt = operating_income - depreciation_cost,
    niat = nibt * (1 - tax_rate), 
    cashflow = niat + depreciation_cost - capex    
  )
```

`@solution`
```{r}
cashflow_statement <-
  mutate( assumptions,
    sales_per_year = unit_sales_per_day * days_open_per_year,
    sales_revenue = sales_per_year * profit_margin_per_nitro,
    total_revenue = sales_revenue,
    labor_cost = days_open_per_year * 0.5 * labor_cost_per_hour,
    cannibalization_cost = sales_per_year * pct_cannibalization * profit_margin_per_regular,
    total_expense = labor_cost + cannibalization_cost + maintenance_cost,
    operating_income = total_revenue - total_expense,
    nibt = operating_income - depreciation_cost,
    niat = nibt * (1 - tax_rate), 
    cashflow = niat + depreciation_cost - capex    
  )
```

`@sct`
```{r}
success_msg("Nice work! We have now built a complete cashflow statement and can visualize any of the line items with the code provided in the Instructions. Now let's learn something new about exploring financial model outputs.")
```

---

## Scenario Analysis with tidyr and purrr

```yaml
type: VideoExercise
key: 979e140485
xp: 50
```

`@projector_key`
26a99d9e237263c3414e6fb4ee56dee4

---

## Creating scenarios

```yaml
type: NormalExercise
key: 9bfa9ef03b
xp: 100
```

Our approach to scenario analysis assumes we have one dataframe containing all of our business assumptions with a column distinguishing each scenario. Let's create such a dataframe to capture these three scenarios:

- **Realistic**: This is the "best guess" set of `assumptions` you worked with in exercise 3
- **Pessimistic**: Competition decreases sales by 20% and nitro coffee profit margins down to $1 from $3. Additionally, we find that 50% of sales are actually just cannibalization.
- **Optimistic**: Sales are 20% higher than our estimate with cannibalization only accounting for 10%. This stuff is flying off the shelves!

Our base-case `assumptions` dataset is already in your environment.

`@instructions`
- Define the `pessimist` dataframe with `unit_sales_per_day` to 80% of the base value and `profit_margin_per_nitro` fixed at $1
- Use `dplyr`'s `bind_rows()` function to combine the three scenarios to create the `scenarios` dataset
- Ensure each scenario is tagged by a `scenario` column. For base `assumptions`, set `scenario` to `"realist"`

`@hint`
- Check out `?dplyr::bind_rows` for documentation. This function essentially "stacks" dataframes on top of each other, aligining columns with the same name.

`@pre_exercise_code`
```{r}
library(dplyr)

assumptions <- 
  data.frame(
    year = c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L),
    unit_sales_per_day = c(0L, 10L, 12L, 14L, 15L, 16L, 17L, 18L, 18L, 18L, 18L),
    capex = c(5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L),
    pct_cannibalization = c(0, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
                            0.25, 0.25),
    maintenance_cost = c(0L, 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                         250L, 250L),
    depreciation_cost = c(0L, 500L, 500L, 500L, 500L, 500L, 500L, 500L, 500L,
                          500L, 500L),
    profit_margin_per_nitro = c(3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L),
    profit_margin_per_regular = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
    labor_cost_per_hour = c(8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8),
    days_open_per_year = c(250,250,250,250,250,250,250,250,250,250,250)
  )
```

`@sample_code`
```{r}
# build individual scenarios
optimist <- mutate(assumptions, unit_sales_per_day = unit_sales_per_day * 1.2, pct_cannibalization = 0.1)
pessimist <- mutate(assumptions, unit_sales_per_day = unit_sales_per_day * ___, profit_margin_per_nitro = ___)

# combine into one dataset
scenarios <-
  ___(
    mutate(pessimist, scenario = "pessimist"),
    mutate(assumptions, scenario = ___),
    mutate(optimist, scenario = "optimist")
  )
```

`@solution`
```{r}
# build individual scenarios
optimist <- mutate(assumptions, unit_sales_per_day = unit_sales_per_day * 1.2, pct_cannibalization = 0.1)
pessimist <- mutate(assumptions, unit_sales_per_day = unit_sales_per_day * 0.8, profit_margin_per_nitro = 1)

# combine into one dataset
scenarios <-
  bind_rows(
    mutate(pessimist, scenario = "pessimist"),
    mutate(assumptions, scenario = "realist"),
    mutate(optimist, scenario = "optimist")
  )
```

`@sct`
```{r}
success_msg("Nice work! This type of representation will make it much easier to rapidly analyze our results, as we will practice in the next lesson.")
```

---

## Conducting scenario analysis

```yaml
type: NormalExercise
key: 58b5496a48
xp: 100
```

In your environment is the `scenarios` dataset created in the last exercise.

Let's used the `nest`-`map` workflow to calculate NPV for each of the scenarios from the last exercise. 

In your environment is the `scenarios` dataset you create as well as two functions. `calc_model` creates a cashflow dataframe from your business inputs (as you did in exercise 3). `calc_npv_from_cashflow` is like your `calc_npv` function except it takes in the whole cashflow dataframe and also handles the step of extracting the cashflow line item.

`@instructions`
- Nest the `scenarios` dataset by `scenario`
- Create the `cashflow` variable by calling `map` to pass each set of assumptions through `calc_model`
- In `map` functions, we can pass additional arguments to the function by listing them after the function itself. Pass in a discount rate of `0.2` to `calc_npv_from_cashflow`
- Inspect the output by `select`ing the variables `scenario` and `npv` from the resulting `scenario_analysis` dataframe

`@hint`
- Remember to use the `-` sign to prevent the `scenario` variable from becoming nested

`@pre_exercise_code`
```{r}
library(dplyr)
library(tidyr)
library(purrr)
library(tibble)

scenarios <-
data.frame(stringsAsFactors=FALSE,
                        year = c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L,
                                 0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L,
                                 0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L),
          unit_sales_per_day = c(0, 8, 9.6, 11.2, 12, 12.8, 13.6, 14.4, 14.4,
                                 14.4, 14.4, 0, 10, 12, 14, 15, 16, 17, 18, 18,
                                 18, 18, 0, 12, 14.4, 16.8, 18, 19.2, 20.4,
                                 21.6, 21.6, 21.6, 21.6),
                       capex = c(5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                 5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                 5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L),
         pct_cannibalization = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                                 0.5, 0.5, 0, 0.25, 0.25, 0.25, 0.25, 0.25,
                                 0.25, 0.25, 0.25, 0.25, 0.25, 0.1, 0.1, 0.1, 0.1,
                                 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1),
            maintenance_cost = c(0L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L, 0L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L, 250L, 250L, 250L, 0L, 250L,
                                 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L),
           depreciation_cost = c(0L, 500L, 500L, 500L, 500L, 500L, 500L, 500L,
                                 500L, 500L, 500L, 0L, 500L, 500L, 500L, 500L,
                                 500L, 500L, 500L, 500L, 500L, 500L, 0L, 500L,
                                 500L, 500L, 500L, 500L, 500L, 500L, 500L, 500L,
                                 500L),
     profit_margin_per_nitro = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L,
                                 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L),
   profit_margin_per_regular = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
         labor_cost_per_hour = c(8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L,
                                 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L,
                                 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L, 8L),
          days_open_per_year = c(250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                                 250L, 250L, 250L),
                    scenario = c("pessimist", "pessimist", "pessimist",
                                 "pessimist", "pessimist", "pessimist",
                                 "pessimist", "pessimist", "pessimist", "pessimist",
                                 "pessimist", "realist", "realist", "realist",
                                 "realist", "realist", "realist", "realist",
                                 "realist", "realist", "realist", "realist", "optimist",
                                 "optimist", "optimist", "optimist", "optimist",
                                 "optimist", "optimist", "optimist", "optimist",
                                 "optimist", "optimist")
) %>% as.tibble()

calc_model <- function(assumptions){
  mutate( assumptions,
    sales_per_year = unit_sales_per_day * days_open_per_year,
    sales_revenue = sales_per_year * profit_margin_per_nitro,
    total_revenue = sales_revenue,
    labor_cost = days_open_per_year * 0.5 * labor_cost_per_hour,
    cannibalization_cost = sales_per_year * pct_cannibalization * profit_margin_per_regular,
    total_expense = labor_cost + cannibalization_cost + maintenance_cost,
    operating_income = total_revenue - total_expense,
    nibt = operating_income - depreciation_cost,
    niat = nibt * (1 - 0.36), 
    cashflow = niat + depreciation_cost - capex    
  )
}

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv_from_cashflow <- function(cashflow, r){
  cashflow_line <- cashflow$cashflow
  sum(calc_pv(cashflow_line, r, 0:(length(cashflow_line)-1)))
}
```

`@sample_code`
```{r}
# calculate scenario NPVs
scenario_analysis <-
scenarios %>%
    ___(-scenario) %>%
    mutate(cashflow = ___(data, calc_model)) %>%
    mutate(npv = map_dbl(cashflow, calc_npv_from_cashflow, ___))

# inspect results
select(scenario_analysis, scenario, npv)
```

`@solution`
```{r}
# calculate scenario NPVs
scenario_analysis <-
scenarios %>%
    nest(-scenario) %>%
    mutate(cashflow = map(data, calc_model)) %>%
    mutate(npv = map_dbl(cashflow, calc_npv_from_cashflow, 0.2))

# inspect results
select(scenario_analysis, scenario, npv)
```

`@sct`
```{r}
success_msg("Good job! While these outcomes don't give us a clear sense of what's the most likely to happen in a probabilistic sense, it is helpful and informative to understand a reasonable range of potential valuations for our project.")
```

---

## Visualizing scenario analysis

```yaml
type: NormalExercise
key: 3eb3a2a390
xp: 100
```

Often, scenario analysis is depicted as  a barchart. In this exercise, we will make a barchart with the values we calculated for our optimistic, realistic, and pessimistic scenarios.  The `scenario_analysis` dataset in your environment contains results from the previous exercise.

`@instructions`
In the following `ggplot2` code:
- Inside `geom_bar`, specify `stat = "identity"`. This makes sure the barchart bases its value on the `y` variable versus the default (counting the number of rows)
- Specify the `label` for the `y` axis  as `scales::dollar` to automatically add dollar signs to the `y` axis
- Specify `fill = FALSE` within the `guides` function to remove the legend. It's redundant since labels are on the `x` axis.

`@hint`
In the blanks, all you need to type is
- `"identity"`
-  `scales::dollar`
- `fill`

`@pre_exercise_code`
```{r}
library(ggplot2)
library(tibble)

scenario_analysis <-
tribble(
  ~scenario,    ~npv,
  "pessimist", -5176L,
    "realist", 17284L,
   "optimist", 24260L
  )
```

`@sample_code`
```{r}
# scenario analysis bar chart
ggplot(data = scenario_analysis, 
       aes(x = scenario, y = npv, fill = scenario)) + 
    geom_bar(stat = ___) +
    scale_y_continuous(label = ___) +
	labs(title = "NPV Scenario Analysis of Nitro Coffee Expansion") +
	guides(___ = FALSE)
```

`@solution`
```{r}
# scenario analysis bar chart
ggplot(data = scenario_analysis, 
       aes(x = scenario, y = npv, fill = scenario)) + 
    geom_bar(stat = "identity") +
    scale_y_continuous(label = scales::dollar) +
	labs(title = "NPV Scenario Analysis of Nitro Coffee Expansion") +
	guides(fill = FALSE)
```

`@sct`
```{r}
success_msg("Looking good! Visually, we can notice that our possible upside is much greater than the potential downside of the pessimistic outcome. Of course, if the pessimistic scenario was 90% likely and the optimistic and realistic scenarios were each only 5% likely, our venture still might seem questionable. Here, we don't have a sense of relative likelihood, but in real life we hopefully would.")
```

---

## Sensitivity analysis

```yaml
type: VideoExercise
key: 91b81cdfc2
lang: r
xp: 50
skills: 1
```

`@projector_key`
cc585348c7c492f2259def88f71efbf0

---

## Calculating univariate sensitivities

```yaml
type: NormalExercise
key: a4c9b13a2d
xp: 100
```

Sensitivity analysis can help us understand how resilient our model is to changes in assumptions or diagnose unexpected dynamics. Here, we will take our base `assumptions` dataset and calculate the `sensitivity` dataset. Specifically, we will see how NPV changes when each of `profit_margin_per_nitro`, `labor_cost_per_hour`, `pct_cannibalization`, and `unit_sales_per_day` is allowed to (one at a time) range from 50% to 150% of our best guess forecast.

`@instructions`
- Complete the definition of the `factor_data` function so that the returned `data` object has its `metric` column multiplied by the provided `factor`
- Use `purrr`'s `crossing` function to create all combinations of `factor` and `metric` that we list out
- Call `purrr`'s `map2` function to pass both `metric` and `factor` into `factor_data`

`@hint`
- Curious what the `~` does before `factor_data`? Essentially this let's us define a new "anonymous" (unnamed) function on the fly. For us, we're going ahead and passing in the `assumptions` dataset.

`@pre_exercise_code`
```{r}
library(dplyr)
library(purrr)

assumptions <- 
  data.frame(
    year = c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L),
    unit_sales_per_day = c(0L, 10L, 12L, 14L, 15L, 16L, 17L, 18L, 18L, 18L, 18L),
    capex = c(5000L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L),
    pct_cannibalization = c(0, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25,
                            0.25, 0.25),
    maintenance_cost = c(0L, 250L, 250L, 250L, 250L, 250L, 250L, 250L, 250L,
                         250L, 250L),
    depreciation_cost = c(0L, 500L, 500L, 500L, 500L, 500L, 500L, 500L, 500L,
                          500L, 500L),
    profit_margin_per_nitro = c(3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L),
    profit_margin_per_regular = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
    labor_cost_per_hour = c(8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8),
    days_open_per_year = c(250,250,250,250,250,250,250,250,250,250,250)
  )

calc_model <- function(assumptions){
  mutate( assumptions,
          sales_per_year = unit_sales_per_day * days_open_per_year,
          sales_revenue = sales_per_year * profit_margin_per_nitro,
          total_revenue = sales_revenue,
          labor_cost = days_open_per_year * 0.5 * labor_cost_per_hour,
          cannibalization_cost = sales_per_year * pct_cannibalization * profit_margin_per_regular,
          total_expense = labor_cost + cannibalization_cost + maintenance_cost,
          operating_income = total_revenue - total_expense,
          nibt = operating_income - depreciation_cost,
          niat = nibt * (1 - 0.36), 
          cashflow = niat + depreciation_cost - capex    
  )
}

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv_from_cashflow <- function(cashflow, r){
  cashflow_line <- cashflow$cashflow
  sum(calc_pv(cashflow_line, r, 0:(length(cashflow_line)-1)))
}
```

`@sample_code`
```{r}
# define sensitivity factor function
factor_data <- function(data, metric, factor){
    data[[metric]] <- data[[metric]] * ___
    data
}

# create sensitivity analysis
sensitivity <-
  ___(
    factor = seq(0.5,1.5,0.1), 
    metric = c("profit_margin_per_nitro", "labor_cost_per_hour", "pct_cannibalization", "unit_sales_per_day")) %>%
  mutate(scenario = ___(metric, factor, ~factor_data(assumptions, .x, .y))) %>%
  mutate(cashflow = map(scenario, calc_model)) %>% 
  mutate(npv = map_dbl(cashflow, calc_npv_from_cashflow, r = 0.2))
```

`@solution`
```{r}
# define sensitivity factor function
factor_data <- function(data, metric, factor){
    data[[metric]] <- data[[metric]] * factor
    data
}

# create sensitivity analysis
sensitivity <-
  expand.grid(
    factor = seq(0.5,1.5,0.1), 
    metric = c("profit_margin_per_nitro", "labor_cost_per_hour", "pct_cannibalization", "unit_sales_per_day")) %>%
  mutate(scenario = map2(metric, factor, ~factor_data(assumptions, .x, .y))) %>%
  mutate(cashflow = map(scenario, calc_model)) %>% 
  mutate(npv = map_dbl(cashflow, calc_npv_from_cashflow, r = 0.2))
```

`@sct`
```{r}
success_msg("Nice work conducting sensitivity analysis! You can examine the top of your output using head(sensitivity). However, you may notice the output is a dataframe that is a bit dense. To see just how big it is, run nrow(sensitivity). In the next exercise, we will plot our results for a more immediately interpretable view.")
```

---

## Plotting univariate sensitivity

```yaml
type: NormalExercise
key: 9126f2524e
xp: 100
```

Your contains the `sensitivity` dataframe created in the last exercise.  With 44 combinations of metrics and factors considered, this is a lot to digest in a table! Instead, we will plot the results using `ggplot2`

`@instructions`
- Specify the appropriate `x` and `y` dimensions within `aes`. Refer back to the slides to recall how the plot should look (or see the labels in `labs()` for a hint!)
- Complete the instructions for `scale_x_continuous` and `scale_y_continuous`. Recall that these simply label our axes according to the type of values they represent. You will use `scales::dollar` and `scales::percent` once each
- Once the plot is run, be sure to understand how the argumnets in `labs()` impacted the final plot

`@hint`
- The `x` axis should plot the `factor` which is a *percent* relative to the base assumption
- The `y` axis should plot NPV for that sensitivity which is a *dollar* value

`@pre_exercise_code`
```{r}
library(ggplot2)

sensitivity <-
data.frame(stringsAsFactors=FALSE,
      factor = c(0.5, 0.5, 0.5, 0.5, 0.6, 0.6, 0.6, 0.6, 0.7, 0.7, 0.7, 0.7,
                 0.8, 0.8, 0.8, 0.8, 0.9, 0.9, 0.9, 0.9, 1, 1, 1, 1, 1.1, 1.1,
                 1.1, 1.1, 1.2, 1.2, 1.2, 1.2, 1.3, 1.3, 1.3, 1.3, 1.4, 1.4, 1.4,
                 1.4, 1.5, 1.5, 1.5, 1.5),
      metric = c("labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day",
                 "labor_cost_per_hour", "pct_cannibalization", "profit_margin_per_nitro",
                 "unit_sales_per_day", "labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day",
                 "labor_cost_per_hour", "pct_cannibalization", "profit_margin_per_nitro",
                 "unit_sales_per_day", "labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day",
                 "labor_cost_per_hour", "pct_cannibalization", "profit_margin_per_nitro",
                 "unit_sales_per_day", "labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day",
                 "labor_cost_per_hour", "pct_cannibalization", "profit_margin_per_nitro",
                 "unit_sales_per_day", "labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day",
                 "labor_cost_per_hour", "pct_cannibalization", "profit_margin_per_nitro",
                 "unit_sales_per_day", "labor_cost_per_hour", "pct_cannibalization",
                 "profit_margin_per_nitro", "unit_sales_per_day"),
         npv = c(18987.86258, 18477.82209, 2947.77847, 4142.39721, 18646.93073,
                 18238.89834, 5814.863446, 6770.558438, 18305.99889,
                 17999.9746, 8681.948423, 9398.719667, 17965.06704, 17761.05085,
                 11549.0334, 12026.8809, 17624.1352, 17522.1271, 14416.11838, 14655.04212,
                 17283.20335, 17283.20335, 17283.20335, 17283.20335, 16942.27151,
                 17044.2796, 20150.28833, 19911.36458, 16601.33966, 16805.35586,
                 23017.37331, 22539.52581, 16260.40782, 16566.43211,
                 25884.45828, 25167.68704, 15919.47597, 16327.50836, 28751.54326,
                 27795.84827, 15578.54413, 16088.58461, 31618.62824, 30424.0095)
)
```

`@sample_code`
```{r}
ggplot(sensitivity,
       aes(x = ___, y = ___, col = metric)
       ) +
  geom_line() +
  scale_x_continuous(labels = ___) +
  scale_y_continuous(labels = ___) +
  labs(
    title = "Sensivity Analysis",
    x = "Factor on Original Assumption",
    y = "Projected NPV",
    col = "Metric"
  )
```

`@solution`
```{r}
ggplot(sensitivity,
       aes(x = factor, y = npv, col = metric)
       ) +
  geom_line() +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::dollar) +
  labs(
    title = "Sensivity Analysis",
    x = "Factor on Original Assumption",
    y = "Projected NPV",
    col = "Metric"
  )
```

`@sct`
```{r}
success_msg("Good job! What do you notice in the resulting plot? Which assumptions seem to have the most influence on our overall value? (The ones with the steeper slope)")
```

---

## Communicating Cashflow Concepts

```yaml
type: VideoExercise
key: b983bd8833
xp: 50
```

`@projector_key`
f800fe038bb53b5a16c899f43a4417db

---

## Tidying a cashflow

```yaml
type: NormalExercise
key: baa7e53f38
lang: r
xp: 100
skills: 1
```

The finance department has sent you a cashflow statement (in the standard "wide" financial format), which you have loaded to your environment as `cashflow`. In this exercise, we will tidy it up to make it easier to explore in R.

`@instructions`
- Call `cashflow` to view the current structure of the cashflow data
- Use the `library()` function to load the `tidyr` package
- Use the `gather()` function to create `Month` and `Value` columns, and assign the results to a variable `long_cashflow`
- Use the `spread()` function to create separate fields for each value in `Metric` and assign the results to a variable `tidy_cashflow`

`@hint`
- In your `gather()` function, did you remember to tell it not to `gather` the `Metric` field (`-Metric`)?
- In your `spread()` function, did you correctly input `long_cashflow` (not the original `cashflow`)?

`@pre_exercise_code`
```{r}
library(tidyr)

cashflow <- 
spread(
data.frame(stringsAsFactors=FALSE,
           Metric = c("Received", "Received", "Received", "Received", "Received",
                      "Received", "Spent", "Spent", "Spent", "Spent", "Spent",
                      "Spent"),
           Month = c(1L, 2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L),
           Value = c(100L, 200L, 300L, 400L, 500L, 500L, 150L, 175L, 200L, 225L,
                     250L, 250L)
) ,
key = Month, value = Value)
```

`@sample_code`
```{r}
# examine current cashflow strucutre
cashflow

# load tidyr
library(___)

# create long_cashflow with gather
long_cashflow <- ___(___, key = Month, value = Value, -Metric)

# create tidy_cashflow with spread
tidy_cashflow <- ___(___, key = Metric, value = Value)

# examine results
tidy_cashflow
```

`@solution`
```{r}
# examine current cashflow strucutre
cashflow

# load tidyr
library(tidyr)

# create long_cashflow with gather
long_cashflow <- gather(cashflow, key = Month, value = Value, -Metric)

# create tidy_cashflow with spread
tidy_cashflow <- spread(long_cashflow, key = Metric, value = Value)

# examine results
tidy_cashflow
```

`@sct`
```{r}
success_msg("Great job! That's one tidy cashflow. Bear in mind, though, that real-life cashflows can start out much messier than this. Some good packages to learn about when confronted with more challenging cases are tidyxl and unpivotr.")
```

---

## Untidying a cashflow

```yaml
type: NormalExercise
key: 2c6f7b1353
lang: r
xp: 100
skills: 1
```

While data scientists may prefer tidy data, you may have a hard time convincing to the finance department to start looking at everything "sideways". Inevitably, if you produce results for them, they will want to go back to the standard ("wide") cashflow format. 

Assume `tidyr` has already been loaded and that the `tidy_cashflow` you made in the last exercise is still in the environment. Let's turn it back into a standard cashflow for our colleauges in finance.

`@instructions`
- Call `tidy_cashflow` to view the current structure of the cashflow data
- Use the `gather()` function to create `Metric` and `Value` columns, and assign the results to a variable `long_cashflow`
- Use the `spread()` function to create separate fields for each value in `Month` and assign the results to a variable `untidy_cashflow`

`@hint`
- In your `gather()` function, did you remember to tell it not to `gather` the `Month` field (`-Month`)?
- In your `spread()` function, did you correctly input `long_cashflow` (not the original `tidy_cashflow`)?

`@pre_exercise_code`
```{r}
library(tidyr)

tidy_cashflow <- 
spread(
data.frame(stringsAsFactors=FALSE,
           Metric = c("Received", "Received", "Received", "Received", "Received",
                      "Received", "Spent", "Spent", "Spent", "Spent", "Spent",
                      "Spent"),
           Month = c(1L, 2L, 3L, 4L, 5L, 6L, 1L, 2L, 3L, 4L, 5L, 6L),
           Value = c(100L, 200L, 300L, 400L, 500L, 500L, 150L, 175L, 200L, 225L,
                     250L, 250L)
) ,
key = Metric, value = Value)
```

`@sample_code`
```{r}
# examine current cashflow strucutre
___

# create long_cashflow with gather
___ <- ___(___, key = Metric, value = Value, -Month)

# create untidy_cashflow with spread
___ <- ___(___, key = Month, value = Value)

# examine results
untidy_cashflow
```

`@solution`
```{r}
# examine current cashflow strucutre
tidy_cashflow

# create long_cashflow with gather
long_cashflow <- gather(tidy_cashflow, key = Metric, value = Value, -Month)

# create untidy_cashflow with spread
untidy_cashflow <- spread(long_cashflow, key = Month, value = Value)

# examine results
untidy_cashflow
```

`@sct`
```{r}
success_msg("Nice work! It's important to be flexible and wrangle data into different formats - especially when working on cross-disciplinary teams.")
```

---

## Waterfall diagrams

```yaml
type: TabExercise
key: 65961460c9
xp: 100
```

We discussed how waterfall diagrams are a popular way to visualize different line items on a cashflow. For better or worse, these are also a good opportunity to practice some *serious* data wrangling. Precisely what wrangling is needed will vary by exactly what you are trying  to show.  In this exercise, we will begin to explore projected cashflow for the Tidyverse Cafe's product line expansion.  We will work  step-by-step through the process of making a waterfall diagram depicting the components of net income. 

The `income_stmt_summary` dataset has been provided for you with the data already partially summarized. Each line item is summed across all statements into a single entry, including the correct sign (+ for revenue, - for expenses.)

`@pre_exercise_code`
```{r}
library(ggplot2)
library(dplyr)

income_stmt_summary <-
data.frame(stringsAsFactors=FALSE,
      Metric = c("Sales Revenue", "Keg Cost", "Cannibalization Cost", "Labor Cost", "Maintenance Cost"),
      Value = c(187200L, -78240L, -31200L, -10000L, -2500L)
)

# compute min and maxes for each line item
waterfall_items <-
  mutate(income_stmt_summary,
         end = cumsum(Value), 
         start = lag(cumsum(Value),1,default = 0))

# compute totals row for waterfall metrics
waterfall_summary <- 
  data.frame(Metric = "Net Income", 
             end = sum(income_stmt_summary$Value), 
             start = 0)

# combine line items with summary row
waterfall_data <-
  bind_rows(waterfall_items, waterfall_summary) %>%
  mutate(row_num = row_number(), 
         Metric = factor(Metric, levels = .$Metric))
```

`@sample_code`
```{r}

```

***

```yaml
type: NormalExercise
key: 4625e0ad1e
xp: 35
```

`@instructions`
Although we have already aggregated  `income_stmt_summary` for you, some more wrangling is needed.

- Use  `head(income_stmt_summary)` and `unique(income_stmt_summary$Metric)` to explore the dataset
- Complete the definition of `waterfall_items` where `end` is the `cumsum()` of `Value` and the `start` is the `lag` of `cumsum(Value)`
- Complete the definition of `waterfall_summary` where `end` (representing Net Income) is the `sum()` of all of the `Value`s in `income_stmt_summary`

`@hint`
- The `default = ` option in the `lag()` function tells R what to do when there is no previous value to take
- Extract the `Value` column of `income_stmt_summary` using R's `$` operator (e.g. `dataset$column`)

`@sample_code`
```{r}
# compute min and maxes for each line item
waterfall_items <-
  mutate(income_stmt_summary,
         end = ___(Value), 
         start = ___(cumsum(Value),1,default = 0))

# compute totals row for waterfall metrics
waterfall_summary <- 
  data.frame(Metric = "Net Income", 
             end = sum(___), 
             start = 0)
```

`@solution`
```{r}
# compute min and maxes for each line item
waterfall_items <-
  mutate(income_stmt_summary,
         end = cumsum(Value), 
         start = lag(cumsum(Value),1,default = 0))

# compute totals row for waterfall metrics
waterfall_summary <- 
  data.frame(Metric = "Net Income", 
             end = sum(income_stmt_summary$Value), 
             start = 0)
```

`@sct`
```{r}
success_msg("Alright! Now we have everything that we need. Time to start putting the pieces together.")
```

***

```yaml
type: NormalExercise
key: 51db95beec
xp: 35
```

`@instructions`
Now that you've created `waterfall_items` and `waterfall_summary`, let's combine them to get the final dataframe we need for our plot.

- Use `dplyr`'s `bind_rows()` function to combine `waterfall_items` and `waterfall_summary`
- Note how we are defining `row_num` and converting `Metric` to a factor for convenience when plotting

`@hint`
- Note that unlike base R's `rbind()` function, `dplyr::bind_rows()` will match based on variable name and allow us to combine `waterfall_items` and `waterfall_summary` despite their different numbers of columns.
- To turn metric into a factor, we need to specify that it's `levels` are aligned with it's current values/order (accessible with `.$Metric`)

`@sample_code`
```{r}
# combine line items with summary row
waterfall_data <-
  ___(waterfall_items, waterfall_summary) %>%
  mutate(row_num = row_number(), 
         Metric = factor(Metric, levels = .$Metric))
```

`@solution`
```{r}
# combine line items with summary row
waterfall_data <-
  bind_rows(waterfall_items, waterfall_summary) %>%
  mutate(row_num = row_number(), 
         Metric = factor(Metric, levels = .$Metric))
```

`@sct`
```{r}
success_msg("Now that we have our wrangled dataset, onto the plot!")
```

***

```yaml
type: NormalExercise
key: ea69fe6769
xp: 30
```

`@instructions`
Finally -- it's time to plot the `waterfall_data` dataframe! We've provided a lot of the styling for you, but it's up to you to set up the core plot. 

- Set `ymin` equal to the `start` value we calculated and `ymax` equal `end` value
-  Use `geom_hline` to draw a horizontal line on our plot fixed with a y intercept of 0.

`@hint`
- Check `?ggplot::geom_rect` and `?ggplot2::geom_hline` documentation to refresh your memory
- The argument name needed for `geom_hline` is `yintercept`

`@sample_code`
```{r}
# plot waterfall diagram
ggplot(waterfall_data, aes(fill = (end > start))) +
  geom_rect(aes(x = Metric, xmin = row_num, xmax = row_num + 0.5, 
                ymin = ___, ymax = ___)) +
  geom_hline(___ = 0) +
# styling provided for you - check out a ggplot course for more information!
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank()) +
  scale_y_continuous(labels = scales::dollar) +
  guides(fill = FALSE) +
  labs(
    title = "Income Statement for Proposed Nitro Coffee Expansion",
    subtitle = "Based on pro forma 10-year Income Statement forecast"
  )
```

`@solution`
```{r}
# plot waterfall diagram
ggplot(waterfall_data, aes(fill = (end > start))) +
  geom_rect(aes(x = Metric, xmin = row_num, xmax = row_num + 0.5, 
                ymin = start, ymax = end)) +
  geom_hline(yintercept = 0) +
# styling provided for you - check out a ggplot course for more information!
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.title.x = element_blank()) +
  scale_y_continuous(labels = scales::dollar) +
  guides(fill = FALSE) +
  labs(
    title = "Income Statement for Proposed Nitro Coffee Expansion",
    subtitle = "Based on pro forma 10-year Income Statement forecast"
  )
```

`@sct`
```{r}
success_msg("Nice work! Now you can take all your hard work and big ideas to that board meeting.")
```

---

## Advanced Topics in Cashflow Modeling

```yaml
type: VideoExercise
key: 7168d531a7
lang: r
xp: 50
skills: 1
```

`@projector_key`
fc6bf7780740ee20fb1cbf8c11c33f89
