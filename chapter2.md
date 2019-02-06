---
title: 'Time is Money (Key Financial Concepts)'
description: 'An overview of time-value of money and related concepts'
attachments:
    slides_link: 'https://s3.amazonaws.com/assets.datacamp.com/development/course_5555/slides/chapter2.pdf'
---

## The Time Value of Money

```yaml
type: VideoExercise
key: 914a515259
lang: r
xp: 50
skills: 1
```

`@projector_key`
45e2e5d84c406807e36be938c5597438

---

## Calculating PV

```yaml
type: NormalExercise
key: 1e9448baae
lang: r
xp: 100
skills: 1
```

Congratulations! You are going to receive $100 at some point in the future. Assume the discount rate is 8%. Let's explore how much the present value of this future cashflow varies by when you receive the cashflow.

`@instructions`
- Assign `fv` and `r` to be the future value ($100) and the discount rate (8%), respectively
- Use the present value formula to calculate `pv_1` and `pv_5` (the present value of the cashflow if you will receive it's future value in 1 or 5 years, respectively)
- Subtract `pv_5` from `pv_1` to see how much value is lost by delaying receipt of the cashflow for 4 years

`@hint`
- Did you set `fv` to 100 and `r` to 0.08 (**not** 8!)
- Recall our present value formula is `pv <- fv / (1 + r)^n`

`@pre_exercise_code`
```{r}

```

`@sample_code`
```{r}
# Assign input variables
fv <- ___
r <- ___

# Calculate PV if receive FV in 1 year
pv_1 <- ___
pv_1

# Calculate PV if receive FV in 5 years
pv_5 <- ___
pv_5

# Calculate difference
pv_1 - pv_5
```

`@solution`
```{r}
# Assign input variables
fv <- 100
r <- 0.08

# Calculate PV if receive FV in 1 year
pv_1 <- fv / (1 + r)
pv_1

# Calculate PV if receive FV in 5 years
pv_5 <- fv / (1 + r)^5
pv_5

# Calculate difference
pv_1 - pv_5
```

`@sct`
```{r}
success_msg("Nice work! Isn't it amazing how fast that value declined?")
```

---

## Writing a PV function

```yaml
type: NormalExercise
key: eff730f1d6
lang: r
xp: 100
skills: 1
```

Since we need to calculate present value (pv) frequently, it's helpful to write a function.

Below, we define a `calc_pv` function which takes as arguments the future value `fv`, the discount rate `r`, and the number of statements `n` in the future at which the future value will be received. 

Inside the curly brackets, we need to tell our function what to assign the the present value `pv`. Once that is in place, the last line of our function definition returns this computed present value.

After you define your function, we can test it out on both a *single* set of parameters and also a *vector* of parameters. To see this, we will calculate `pv_range`, which will show us the present value of a fixed future receipt discounted over a range of time periods.

`@instructions`
- We have provided the function header for `calc_pv()`. Fill out the body with the PV formula we learned. As in the video:
- Try out your function for a future value of 100, a discount rate of 8%, and 1 time period in the future
- Test out your funcion on a vector of different time periods by defining `n_range` as the sequence of numbers from 1 to 10 (using syntax `min:max`) and then calling `calc_pv()` replacing `n` with `n_range`

`@hint`
Make sure `calc_pv` is returning `pv` and not just assigning it (as in provided sample code)

`@pre_exercise_code`
```{r}

```

`@sample_code`
```{r}
# Define PV function
calc_pv <- function(fv, r, n){
    pv <-
    pv
}

# Use PV function for 1 input
calc_pv(100, 0.08, _)

# Use PV function for range of inputs
n_range <-
pv_range <- calc_pv(100, 0.08, ___)
pv_range
```

`@solution`
```{r}
# Define PV function
calc_pv <- function(fv, r, n){
  pv <- fv / (1+r)^n
  pv
}

# Use PV function for 1 input
calc_pv(100, 0.08, 5)

# Use PV function for range of inputs
n_range <- 1:10
pv_range <- calc_pv(100, 0.08, n_range)
pv_range
```

`@sct`
```{r}
success_msg("Good job! We will be calculating PV a lot, so having a function will make our lives so much easier!")
```

---

## Visualizing PV by Time Delay

```yaml
type: NormalExercise
key: 63448466a5
lang: r
xp: 100
skills: 1
```

Value decreases quickly as cashflows are delayed further into the future! Let's visualize this relationship using `ggplot2`. 

To use `ggplot2`, it will be easier for us to do all our calculations within a dataframe. To do this, we will build us the `present_values` dataframe which will contain columns for `n`, the number of time periods into the future when we will receive $100, and `pv`, the present value of that $100 at an 8% interest rate.

`dplyr`, `ggplot2`, and your `calc_pv()` function have already been loaded to the environment.

`@instructions`
- `dplyr::mutate()` will add a new column to our dataset. Complete the definition of a new `pv` column where `fv` is the future value of $100, `r` is the discount rate of 8%, and `n` is the column created by `data.frame( n = 1:10 )`
- Complete the code for the `aes()` parameter of `ggplot()`. To plot present value versus time, specify `x` to be the number of periods and `y` to be the present value

`@hint`
- You can reference column `n` just like `n_range` in the last exercise
- Be sure to check your parantheses are balanced!

`@pre_exercise_code`
```{r}
library(dplyr)
library(ggplot2)

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}
```

`@sample_code`
```{r}
# Calculate present values in dataframe
present_values <- data.frame( n = 1:10 ) %>% mutate(pv = ___ )

# Plot relationship between time periods versus present value
ggplot(present_values, 
       aes(x = ___, y = ___ )) + # ADD CODE HERE
  geom_line() +
  geom_label(aes(label = paste0("$",round(pv,0)))) +
  ylim(0,100) +
  labs(
    title = "Discounted Value of $100 by Year Received",
    x = "Number of Years in the Future",
    y = "Present Value ($)"
  )
```

`@solution`
```{r}
# Calculate present values in dataframe
present_values <- data.frame( n = 1:10 ) %>% mutate(pv = calc_pv(100, 0.08, n))
         
# Plot relationship between time periods versus present value
ggplot(present_values, 
       aes(x = n, y = pv)) +
  geom_line() +
  geom_label(aes(label = paste0("$",round(pv,0)))) +
  ylim(0,100) +
  labs(
    title = "Discounted Value of $100 by Year Received",
    x = "Number of Years in the Future",
    y = "Present Value ($)"
  )
```

`@sct`
```{r}
success_msg("Very interesting! It's good to remember that the effect of discounting is definitely not linear.")
```

---

## Effect of Time on Discounting

```yaml
type: PureMultipleChoiceExercise
key: 51cbb3c5d6
xp: 50
skills: 1
```

Based on our present value formula and the plot you just made, which of the following is true?:

`@hint`
- Recall the shape of the plot you just made. It was curved like the first half of the letter "U"

`@possible_answers`


`@feedback`
success_msg("Good job! We can definitely see why companies would be interested in getting cash sooner rather than later")

---

## Using Different Discount Rates

```yaml
type: VideoExercise
key: ae5b4f62cc
lang: r
xp: 50
skills: 1
```

`@projector_key`
5863fcc2cd5a5ce956980c15e4d42ad2

---

## PV by Discount Rate and Time Delay

```yaml
type: NormalExercise
key: d662c3df67
lang: r
xp: 100
skills: 1
```

We just saw how cashflows respond to discounting over different time periods. Let's now explore how they respond to different discount rates.

Again, we will create a `present_values` dataframe containing PVs for different combinations of inputs. First, we will use `expand.grid()` to create combinations of time periods (`n`) ranging from 1:10 and discount rates (`r`) ranging from 5% to 12% by 1% increments. Then, we will make a similar plot as before, but now with a separate trend line for each discount rae.

`dplyr`, `ggplot2`, and your `calc_pv` function have already been loaded.

`@instructions`
- Use `expand.grid()` to create all possible combinations of the time periods and rates (already filled in for you)
- Use `mutate()` and your `calc_pv()` function to calculate the present value of $100 for each combination
- To your plot's `aes()` argument, specify that the color of each line (`col = `) should be based on discretized discount rate (`factor(r)`)

`@hint`
- `expand.grid()` can take multiple vectors as inputs. It then creates a `data.frame` with one row per combination
- You can pass `factor(r)` directly into the `aes()` function

`@pre_exercise_code`
```{r}
library(dplyr)
library(ggplot2)

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}
```

`@sample_code`
```{r}
# Calculate present values over range of time periods and discount rates
present_values <- 
  ___.___( n = 1:10, r = seq(0.05,0.12,0.01)) %>%
  mutate(pv = calc_pv(100, r, n))
     
# Plot present value versus time delay with a separate colored line for each rate
ggplot(present_values, aes(x = n, y = pv, col = ___)) +
  geom_line() +
  ylim(0,100) +
  labs(
    title = "Discounted Value of $100 by Year Received",
    x = "Number of Years in the Future",
    y = "Present Value ($)",
    col = "Discount Rate"
  )
```

`@solution`
```{r}
# Calculate present values over range of time periods and discount rates
present_values <- 
  expand.grid( n = 1:10, r = seq(0.05,0.12,0.01)) %>%
  mutate(pv = calc_pv(100, r, n))
     
# Plot present value versus time delay with a separate colored line for each rate
ggplot(present_values, aes(x = n, y = pv, col = factor(r))) +
  geom_line() +
  ylim(0,100) +
  labs(
    title = "Discounted Value of $100 by Year Received",
    x = "Number of Years in the Future",
    y = "Present Value ($)",
    col = "Discount Rate"
  )
```

`@sct`
```{r}
success_msg("Wow! As time period increases, large discount rates decrease our value much faster.")
```

---

## Effect of Rate on Discounting

```yaml
type: PureMultipleChoiceExercise
key: 4f378744b6
xp: 50
skills: 1
```

Based on the present value formula we have learned and the plot you just made, which of the following is true?

`@hint`
- Recall your plot: different lines (discount rates) were closer together at short time periods and "spread out" over larger time periods

`@possible_answers`


`@feedback`
```{r}
success_msg("You're getting great intuition on the time value of money!")
```

---

## Rates of Different Durations

```yaml
type: NormalExercise
key: e330791f36
lang: r
xp: 100
skills: 1
```

We've seen how sensitive valuations are to different discount rates. It's clearly important that we are always using the *correct* rate in our analysis. One common mistake is to use a discount rate that corresponds to a different unit of time than how our time unit is measured.

`@instructions`
- Assign the monthly discount rate (`r1_mth`) to 0.5%
- Given `r1_mth`, add the right exponents to the code to compute the corresponding quarterly (`r1_quart`), semiannual (`r1_semi`, and annual (`r1_ann`) rates
- Assign the annual discount rate (`r2_ann`) to 8.0%
- Given `r2_ann`, add the right exponents to the code to compute the corresponding monthly (`r2_month`) and quarterly (`r2_quart`)

`@hint`
- Remember to specify `r1_mth` and `r2_ann` as decimals (e.g. 0.08) not percentages (e.g. 8)
- Exponents need are the values that answer: how many (time periods of my current rate) fit into one (time period of my target rate)?

`@pre_exercise_code`
```{r}

```

`@sample_code`
```{r}
# Convert monthly to other time periods
r1_mth <-
r1_quart <- (1 + r1_mth)^___ - 1
r1_semi <- (1 + r1_mth)^___ - 1
r1_ann <- (1 + r1_mth)^___ - 1

# Convert years to other time periods
r2_ann <-
r2_mth <- (1 + r2_ann)^(___) - 1
r2_quart <- (1 + r2_ann)^(___) - 1
```

`@solution`
```{r}
# Convert monthly to other time periods
r1_mth <- 0.005
r1_quart <- (1 + r1_mth)^3 - 1
r1_semi <- (1 + r1_mth)^6 - 1
r1_ann <- (1 + r1_mth)^12 - 1

# Convert years to other time periods
r2_ann <- 0.08
r2_mth <- (1 + r2_ann)^(1/12) - 1
r2_quart <- (1 + r2_ann)^(1/4) - 1
```

`@sct`
```{r}
success_msg("Great work! Always make sure you're using the right rate.")
```

---

## Real versus Nominal Rates

```yaml
type: NormalExercise
key: 0b7cc4bde4
lang: r
xp: 100
skills: 1
```

Recall that we want to discount real (no inflation) cashflows with the real discount rate or nominal (with inflation) cashflows with the nominal discount rate. Generally, we get to work with real cashflows, but we might not always be so lucky.

`@instructions`
- Set the real discount rate (`r1_real`) to 8%, the inflation rate (`inflation1`) to 3%, and calulate the corresponding nominal discount rate (`r1_nom`)
- Set the nominal discount rate (`r2_nom`) to 20%, the inflation rate (`inflation2`) to 5%, and calculate the corresponding real discount rate (`r2_real`)
- Be sure to leave the parentheses around the lines defining `r1_nom` and `r2_real` so your results are also output to the console

`@hint`
- Remember to express any percentages in decimal form
- Recall that `Nominal Rate = (1 + Real Rate) * (1 + Inflation Rate) - 1`

`@pre_exercise_code`
```{r}

```

`@sample_code`
```{r}
# Convert real to nominal
r1_real <- 
inflation1 <- 
(r1_nom <- ) 

# Convert nominal to real
r2_nom <-
inflation2 <-
(r2_real <- )
```

`@solution`
```{r}
# Convert real to nominal
r1_real <- 0.08
inflation1 <- 0.03
r1_nom <- (1 + r1_real)*(1+inflation1) - 1

# Convert nominal to real
r2_nom <- 0.2
inflation2 <- 0.05
r2_real <- (1+r2_nom)/(1+inflation2) - 1
```

`@sct`
```{r}
success_msg("Cool! Now you know how to convert back and forth between all sorts of rates.")
```

---

## Discounting Multiple Cashflows

```yaml
type: VideoExercise
key: de68189af5
lang: r
xp: 50
skills: 1
```

`@projector_key`
60ef4abe4d69a50b8cd5d39a0885491f

---

## Selling a Car (Calculation)

```yaml
type: NormalExercise
key: f35750e0ee
lang: r
xp: 100
skills: 1
```

Imagine you are seeling your car and have received two offers:

- Buyer A will pay you $5,000 today
- Buyer B will pay you $1,000 per year for the next six years, starting *one year from now*

Regardless of which offer you take, you will reinvest your profits for a 6% annual return. Let's evaluate which offer is better.

`@instructions`
- Define `cashflow_b` as a vector with entries for cashflows for years 0 to 6 for option B. `cashflow_a` is provided.
- Use your preloaded `calc_pv()` function to calculate `disc_cashflow_b` as a vector where each entry is the present value of option B's discounted cashflows. `disc_cashflow_a` is provided.
- Calculate and report `pv_b`, the sum of your discounted cashflows for option B. `pv_a` is provided.

`@hint`
If you need to remember how your `calc_pv` function works, simply type `calc_pv` with *no arguments or parentheses* in the console

`@pre_exercise_code`
```{r}
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}
```

`@sample_code`
```{r}
# define cashflows
cashflow_a <- c(5000, rep(0,6))
cashflow_b <- c(0, rep(___,_))

# calculate pv for each time period
disc_cashflow_a <- calc_pv(cashflow_a, 0.06, 0:6)
disc_cashflow_b <- 

# calculate and report total present value for each option
(pv_a <- sum(disc_cashflow_a))
(pv_b <- sum(___))
```

`@solution`
```{r}
# define cashflows
cashflow_a <- c(5000, rep(0,6))
cashflow_b <- c(0, rep(1000,6))

# calculate pv for each time period
disc_cashflow_a <- calc_pv(cashflow_a, 0.06, 0:6)
disc_cashflow_b <- calc_pv(cashflow_b, 0.06, 0:6)

# calculate and report total present value for each option
(pv_a <- sum(disc_cashflow_a))
(pv_b <- sum(disc_cashflow_b))
```

`@sct`
```{r}
success_msg("Nice work! Isn't it easy to apply what you learned to one statement to many statements?")
```

---

## Selling a Car (Decision)

```yaml
type: MultipleChoiceExercise
key: 15fc7e7e3f
lang: r
xp: 50
skills: 1
```

Recall that you have the following options to sell your car:

- Buyer A will pay you $5,000 today
- Buyer B will pay you $1,000 per year for the next six years, starting *one year from now*

That is, in non-discounted dollar terms, buyer B will pay you $6,000 while buyer A will only pay you $5,000. However, you also know that any cash you receive, you can immediately invest at a 6% interest rate. 

In the last exercise, you calculated the present values of these options (`pv_a` and `pv_b`, respectively) which are saved in your environment. 

To whom should you sell your car and why?

`@possible_answers`
- Buyer B because I ultimately get $6,000 instead of $5,000 that Buyer A is offering
- [Buyer A because the present value of Buyer A's offer is higher]
- Buyer B because the present value of Buyer B's offer is higher

`@hint`
- We should make decisions based on present value and not just stated dollars

`@pre_exercise_code`
```{r}
pv_a <- 5000
pv_b <- 4917.324
```

`@sct`
```{r}
msg1 <- "Careful! We want to make decisions on the present value not the future value."
msg2 <- "Great job! It's always important to disount your cashflows before making a financial decision."
msg3 <- "Not quite... double check the values you computed in the console."
test_mc(2, feedback_msgs = c(msg1, msg2, msg3))
```

---

## Licensing a Software (Calculation)

```yaml
type: NormalExercise
key: e5fcd15fc7
lang: r
xp: 100
skills: 1
```

Your corporation is considering switching software vendors. For each license:

- the current software license costs $500 per year
- the new software has a one-time fixed cost of $2,200 per license in the present but only $300 per year in subsequent years

The two software products are substitutes (they do an equally good job at meeting the same need) and whichever one is chosen will be used for the next 10 years. After 10 years, either contact would expire.

Let's assume an 12% discount rate and consider which offer is better. We will do the following calculations on a *per-license* basis. To assist you, the `dplyr` library and your `calc_pv()` function have already been loaded to the environment.

`@instructions`
- Set `cashflow_new` to a vector representing cashflows of switching to the new vendor 
- Create a new column in the `options` dataframe which takes as its values the values of `cashflow_old` and `cashflow_new`
- Use `group_by()` function to group `options` by `option`
- `summarize` the cashflows of each option. Let `sum_cashflow` be the "naive" sum of raw values and `sum_disc_cashflow` be the sum of the present values, obtained with `calc_pv()`

`@hint`
- Remember to include both fixed and variable parts of the cost in `cashflow_new`
- Note that cashflows here are *negative* because they are *expenses* to the company
- Because cashflows are negative, we will prefer the option with the *smaller* absolute value

`@pre_exercise_code`
```{r}
library(dplyr)

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}
```

`@sample_code`
```{r}
cashflow_old <- rep(-500, 11)
cashflow_new <- ___
options <- 
    data.frame( time = rep(0:10, 2),
                option = c(rep("Old",11),rep("New",11)),
                cashflow = c(___, ___) )
                
# caculate total expenditure with and without discounting
options %>%
    group_by(___) %>%
    summarize( sum_cashflow = ___,
               sum_disc_cashflow = ___ )
```

`@solution`
```{r}
# define cashflows
cashflow_old <- rep(-500, 11)
cashflow_new <- c(-2200, rep(-300,10))
options <- 
    data.frame( time = rep(0:10, 2),
                option = c(rep("Old",11),rep("New",11)),
                cashflow = c(cashflow_old, cashflow_new) )
                
# caculate total expenditure with and without discounting
options %>%
    group_by(option) %>%
    summarize( sum_cashflow = sum(cashflow),
               sum_disc_cashflow = sum(calc_pv(cashflow, 0.12, time)) )
```

`@sct`
```{r}
success_msg("Super! As we start to compare more options, it can be really handy to keep everything in a dataframe.")
```

---

## Licensing a Software (Decision)

```yaml
type: MultipleChoiceExercise
key: 15fb520615
lang: r
xp: 50
skills: 1
```

The summary table you created in the last exercise - comparing the old versus new software vendors - is loaded in the enviornment as `options_summary`.

When you inspect the results, you will see that the new software looks "cheaper" on a naive basis when you directly sum the cashflows (`sum_cashflow`). However, it becomes the more expensive option after we account for discounting (`sum_disc_cashflow`). What causes this disparity?

`@possible_answers`
- The new software had greatest expenses backloaded (occuring further from present time) versus the current offering
- The new software had greatest expenses frontloaded (occuring closer to present time) versus the current offering
- The new software has the same flow of expenses as the current offering

`@hint`
- For revenues, we prefer *larger* (in absolute value) present values
- For expenses, we prefer *smaller* (in absolute value) present values

`@pre_exercise_code`
```{r}
library(tibble)

options_summary <- 
tribble(~option, ~sum_cashflow, ~sum_disc_cashflow,
    "New",        -5200,         -3895.067,
    "Old",        -5500,         -3325.112 )
```

`@sct`
```{r}
msg1 <- "Not quite! Based on the time value or money, would you rather have to pay more expenses earlier or later?"
msg2 <- "Correct! High costs or low profits at the beginning of a cashflow stream cause major swings in its overall value."
msg3 <- "Nope. Reread the description of the two cost structures."
test_mc(2, feedback_msgs = c(msg1, msg2, msg3))
```
