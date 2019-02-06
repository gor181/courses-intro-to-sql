---
title: 'Prioritizing Profitability (Financial Metrics)'
description: 'Understanding different ways to summarize cashflow output'
attachments:
    slides_link: 'https://s3.amazonaws.com/assets.datacamp.com/development/course_5555/slides/chapter3.pdf'
---

## Profitability Metrics, Payback Period

```yaml
type: VideoExercise
key: 95793b04fb
lang: r
xp: 50
skills: 1
```

`@projector_key`
9933412f232ad15e7a59a443ed0f0eb7

---

## Calculate Payback Period

```yaml
type: NormalExercise
key: 028b0ec367
xp: 100
```

In this exercise, you'll first calculate the payback period for a single stream of cashflows. In your environment, the variable `cashflow` contains the value of an initial investment and a stream of cash receipts that you expect over the next 10 years.

`@instructions`
- Inspect the `cashflows` vector. Each entry corresponds to one unit of time starting with time zero (the present).
- Use the `cumsum()` function to calculate the cumulative cashflow vector. Assign this to `cum_cashflows`.
- Calculate `payback_period` using the `min()` and `which()` functions to find the first instance where `cum_cashflows >= 0` and substract 1. 
- Check out the results. Does this match what you would have guessed?

`@hint`
- `which()` identifies the indices of vector elements for which a logical statement evaluates as `TRUE`
- Why subtract 1? Because in our vector, time starts at zero, so index 1 corresponds to time 0, index 2 to time 1, etc.

`@pre_exercise_code`
```{r}
cashflows <- c(-50000, 1000, 5000, 5000, 5000, 10000, 10000, 10000, 10000, 10000, 10000)
```

`@sample_code`
```{r}
# inspect variables
cashflows

# calculate cumulative cashflows
cum_cashflows <- cumsum(___)

# identify payback period
payback_period <- ___(___(cum_cashflows >= 0)) - 1

# view result
payback_period
```

`@solution`
```{r}
# inspect variables
cashflows

# calculate cumulative cashflows
cum_cashflows <- cumsum(cashflows)

# identify payback period
payback_period <- min(which(cum_cashflows >= 0)) - 1

# view result
payback_period
```

`@sct`
```{r}
success_msg("Nice work! You can run `payback_period` in the console to see at what period you would expect to break even. However, recall that this metric can be misleading because it isn't accounting for the factor that our future cashflows are worth less.")
```

---

## Write Payback Period Function

```yaml
type: NormalExercise
key: ef8b2d326b
lang: r
xp: 100
skills: 1
```

In Chapter 2, we wrote - and heavily used - our `calc_pv()` function. We will be writing many more functions in this chapter for each profitability metric. 

First, let's write our `calc_payback(cashflows)` function. Its takes one argument `cashflows` with represents a stream of cashflows with one entry per unit time, starting at time zero. The function should return the time period at which cashflows recoup the initial investment.

`@instructions`
- Calculate `cum_cashflows` using the `cumsum()` function
- Complete the calculation of `payback_period` by passing `cum_cashflows` to `which(...)`
- Test your function. Think about what value you expect and complete the logic to check if `calc_payback(cashflows) ==` returns it

`@hint`
- Remember that the payback period is how many time period from the present, i.e. the `i`-th value of your vector corresponds to time `i-1`

`@pre_exercise_code`
```{r}

```

`@sample_code`
```{r}
# Define function
calc_payback <- function(cashflows) {

  cum_cashflows <- cumsum(___)
  payback_period <- min(which(___)) - ___
  payback_period

}

# Test out our function
cashflows <- c(-100, 50, 50, 50)
calc_payback(cashflows) == ___
```

`@solution`
```{r}
# Define function
calc_payback <- function(cashflows) {

  cum_cashflows <- cumsum(cashflows)
  payback_period <- min(which(cum_cashflows >= 0)) - 1
  payback_period

}

# Test out our function
cashflows <- c(-100, 50, 50, 50)
calc_payback(cashflows) == 2
```

`@sct`
```{r}
success_msg("Nice work! But payback period can be deceptive, what would change if we were considering discounting?")
```

---

## How would discounting change payback?

```yaml
type: NormalExercise
key: 82ce64c352
lang: r
xp: 100
skills: 1
```

As stated in the video, discounted payback period isn't a common metric. However, it is informative to see what difference this would make. Since we now have both `calc_payback()` and `calc_pv()` functions, it's also easy to do! 

Those functions have been loaded to your environment, along with the `cashflows` vector you saw in the first exercise.

`@instructions`
- Calculate normal `payback_period` by calling your `calc_payback()` function with `cashflows`
- Calculate `discounted_cashflows` by calling your `calc_pv()` function on your stream of `cashflows`
- Calculate `payback_period_disc` by calling your `calc_payback()` function on `discounted_cashflows` instead of `cashflows`
- Check out the output of `payback period`, `payback_period_disc`, and their difference

`@hint`
Function arguments have been provided to calculate the discounted payback period. You should provide the correct function names.

`@pre_exercise_code`
```{r}
calc_payback <- function(cashflows) {

  cum_cashflows <- cumsum(cashflows)
  payback_period <- min(which(cum_cashflows >= 0)) - 1
  payback_period

}

calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

cashflows <- c(-50000, 1000, 5000, 5000, 5000, 10000, 10000, 10000, 10000, 10000, 10000)
```

`@sample_code`
```{r}
# normal payback period
payback_period <- calc_payback(___)

# discounted payback period
discounted_cashflows <- ___(cashflows, r = 0.06, n = 0:(length(cashflows)-1) )
payback_period_disc <- ___(discounted_cashflows)

# compare results
payback_period
payback_period_disc
```

`@solution`
```{r}
# normal payback period
payback_period <- calc_payback(cashflows)

# discounted payback period
discounted_cashflows <- calc_pv(cashflows, r = 0.06, n = 0:(length(cashflows)-1) )
payback_period_disc <- calc_payback(discounted_cashflows)

# compare results
payback_period
payback_period_disc
```

`@sct`
```{r}
success_msg("Discounting makes quite a difference - even with a relatively low reinvement rate! Next, we will focus on some metrics that do include its impact natively.")
```

---

## NPV, IRR, and Profitability Index

```yaml
type: VideoExercise
key: 1e4f4f59ba
lang: r
xp: 50
skills: 1
```

`@projector_key`
41fafb045019482638ac2d89ce15df90

---

## Write NPV Function

```yaml
type: NormalExercise
key: 44051d3d4e
lang: r
xp: 100
skills: 1
```

Recall that we have previously defined a `calc_pv(fv, r, n)` function to discount a single future cashflow (`fv`) received in `n` time periods. We also learned in Chapter 2 how to apply our function not just to a single cashflow but to a stream of future cashflows. 

Now, we will define a `calc_npv(cashflows, r)` function to wrap these functionalities. It will discount a vector stream of future `cashflows` starting from time 0 (the present) using discount rate `r` and sum these values to arrive at the net present value.

`@instructions`
- Calculate `n`, the vector corresponding to the timeperiod of each element in `cashflows`
- Apply your `calc_pv()` function to the `cashflows` argument
- Calculate `npv` by summing the results of above
- Reference `npv` so that the function returns it

`@hint`
- Recall that since the first element of `cashflows` corresponds to present time (t = 0), `n` should range from 0 to the length of `cashflows` *minus 1*
- Be sure to explicitly return the value of `npv` so that it can be captured by the outside environment

`@pre_exercise_code`
```{r}
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}
```

`@sample_code`
```{r}
calc_npv <- function(cashflows, r) {

  n <- 0:(length(___) - 1)
  npv <- sum( calc_pv(___, r, n) )
  ___

}
```

`@solution`
```{r}
calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}
```

`@sct`
```{r}
success_msg("Nice work! NPV remains one of the 'gold standard' metrics for evaluating projects, and now you have your own function to do it. ")
```

---

## Write IRR Function

```yaml
type: NormalExercise
key: fc9cf58f11
lang: r
xp: 100
skills: 1
```

The base R function `stats::uniroot` can help find values between a lower bound (`lower`)  and an upper bound (`upper`) where the value of a function is zero. This can help us calculate the internal rate of return (`IRR`) for which NPV = 0.

Define a `calc_irr( cashflows)` function which calls `uniroot` and sets `f` to find the value of `r` on the `interval` from 0 to 1 which forces `calc_npv` to take a value of 0. After we set up the call to the `uniroot` function (see `?uniroot` to bring up documentation), we can extract this value by using the `$` to extract information contained in `root`.

`@instructions`
Complete the body of the `calc_irr()` function:
- Call the `uniroot` function to find the value in the interval from 0 to 1 for which `calc_npv()` is set to 0, when presented with the `cashflows` arguments
- Use the `$` operator to extract `root` from the result of `uniroot`

Test-drive our function:
- Call `calc_irr()` with the  `cashflows` variables provided

`@hint`
- Run `?uniroot` in the console to bring up documentation on this function

`@pre_exercise_code`
```{r}
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}
```

`@sample_code`
```{r}
# Define IRR function
calc_irr <- function(cashflows) {

    ___(calc_npv, 
        interval = c(0, 1), 
        cashflows = ___)$___
    
}

# Try out function on valid input
cashflows <- c(-100, 20, 20, 20, 20, 20, 20, 10, 5)
calc_irr(___)
```

`@solution`
```{r}
# Define IRR function
calc_irr <- function(cashflows) {

    uniroot(calc_npv, 
        interval = c(0, 1), 
        cashflows = cashflows)$root
    
}

# Try out function on valid input
cashflows <- c(-100, 20, 20, 20, 20, 20, 20, 10, 5)
calc_irr(cashflows)
```

`@sct`
```{r}
success_msg("Alright! Our function worked well on this example; however, IRR has some quirks. How will our function perform in less ideal circumstances?")
```

---

## Applying the IRR Decision Rule

```yaml
type: PureMultipleChoiceExercise
key: f8a9bf37ae
xp: 50
skills: 1
```

Previously, we calculated that the IRR for our first stream of cashflows was 8.3%. Which of the following is not suggested by the IRR decision rule?

`@hint`
- Recall that IRR is called the "hurdle" rate because its a hurdle that an initiative needs to *exceed* to be worthwhile

`@possible_answers`


`@feedback`
- This is incorrect. Please review slides to remember how IRR relates to discount rate.
- This is incorrect. Please review slides to remember how IRR relates to discount rate.
- This is incorrect. Please review slides to remember how IRR relates to discount rate.
- That's right! IRR essentially tells us the 'break-even' discount rate. We generally want to invest in projects with IRR that exceeds the discount rate.

---

## Write Profitability Index Function

```yaml
type: NormalExercise
key: 5a55280965
lang: r
xp: 100
skills: 1
```

The profitability index is defined as the ratio of the sum of discounted cashflow over the initial investment amount. 

We will now use our `calc_npv` function to help us write a function to compute the profitability index: `calc_profitability_index(init_investment, future_cashflows, r, n)`. 

We have provided the method signature for you. Here, again `init_investment` represents the intial investment, `future_cashflows` represents the stream of future cashflows due to the investment (represented as a vector), `r` is the discount rate, and `n` is the number of statements into the future that each future cashflow will be received.

`@instructions`
- Plug in the correct values to your `calc_npv()` function. Don't remember how it works? Pull up it's definition by simply typing `calc_npv` in the console!
- Divide `discounted_future_cashflows` by the absolute value (`abs()`) of `init_investment` to calculate the profitability index
- Test out you function by completing the call the `calc_profitability_index`

`@hint`
- The arguments to `calc_pv` in order are `cashflows`, `r`

`@pre_exercise_code`
```{r}
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}
```

`@sample_code`
```{r}
# Define Profitability Index function
calc_profitability_index <- function(init_investment, future_cashflows, r) {
    discounted_future_cashflows <- calc_npv(___,___)
    discounted_future_cashflows / abs(___)
}

# Try out function on valid input
init_investment <- -100
cashflows <- c(0, 20, 20, 20, 20, 20, 20, 10, 5)
calc_profitability_index(___, ___, 0.08)
```

`@solution`
```{r}
# Define Profitability Index function
calc_profitability_index <- function(init_investment, future_cashflows, r) {
    discounted_future_cashflows <- calc_npv(future_cashflows, r)
    discounted_future_cashflows / abs(init_investment)
}

# Try out function on valid input
init_investment <- -100
cashflows <- c(0, 20, 20, 20, 20, 20, 20, 10, 5)
calc_profitability_index(init_investment, cashflows, 0.06)
```

`@sct`
```{r}
success_msg("Great work! The profitability index here is greater than 1, so this looks like a value-creating investment!")
```

---

## Terminal value

```yaml
type: VideoExercise
key: fbca1623e8
xp: 50
```

`@projector_key`
0556f7896de1bd93216328c4d5970420

---

## Perpetuity growth model

```yaml
type: NormalExercise
key: 0382488103
xp: 100
```

We calculate **terminal value**, a single number to encapsulate all future cashflow beyond what we can reasonably forecast.  There are many different methods with their own pros and cons. Here we examine one "textbook" method: **perpetuity growth model**. 

Assume a discount rate of 15%. Let's try out the perpetuity growth model and find the *present value* of the terminal value for growth rates of 10%, 1%, and -5%. In your environment, the vector `cashflow` with our forecasted cashflows.

`@instructions`
- Complete the vector index to calculate the last year cashflow (`last_year_cashflow`) from the `cashflow` vector
- Calculate the last period ( `last_period_n`) by finding the `length()` of `cashflow` minus 1 (since the first entry is time 0)
- Calculate `terminal_value_(1,2,3)` by inserting growth rates of 0.10, 0.01, and -0.05 respectively 
- Inspect the results to see how sensitive our terminal value is to the growth rate assumption

`@hint`
- `length(cashflow)` will return the index of the final entry in `cashflow`
- Note that one of the cases requires a sign change: `0.20 - (-0.05) = 0.20 + 0.05`

`@pre_exercise_code`
```{r}
cashflow <- c(-1000, 100, 100, 200, 300, 400, 500, 600, 600, 600, 600, 500, 500)
```

`@sample_code`
```{r}
# pull last year cashflow from vector of cashflows
last_year_cashflow <- cashflow[length(___)]
last_period_n <- ___ - 1

# calculate terminal value for different discount raes
terminal_value_1 <- last_year_cashflow / ((0.15 - ___)*(1 + 0.15)^last_period_n)
terminal_value_2 <- last_year_cashflow / ((0.15 - ___)*(1 + 0.15)^last_period_n)
terminal_value_3 <- last_year_cashflow / ((0.15 - ___)*(1 + 0.15)^last_period_n)

# inspect results
terminal_value_1 
terminal_value_2
terminal_value_3
```

`@solution`
```{r}
# pull last year cashflow from vector of cashflows
last_year_cashflow <- cashflow[length(cashflow)]
last_period_n <- length(cashflow) - 1

# calculate terminal value for different discount raes
terminal_value_1 <- last_year_cashflow / ((0.15 - 0.10)*(1 + 0.15)^last_period_n)
terminal_value_2 <- last_year_cashflow / ((0.15 - 0.01)*(1 + 0.15)^last_period_n)
terminal_value_3 <- last_year_cashflow / ((0.15 + 0.05)*(1 + 0.15)^last_period_n)

# inspect results
terminal_value_1 
terminal_value_2
terminal_value_3
```

`@sct`
```{r}
success_msg("Nice work! Consider how much variation there is in the terminal value estimates. Relative to our final-year cashflow of $500 does this seem like a lot or a little? Are you surprised how different the values can be when we assume 10%, 1%, or -5% year-over-year change?")
```

---

## Comparing & Computing Metrics

```yaml
type: VideoExercise
key: 741b32198d
lang: r
xp: 50
skills: 1
```

`@projector_key`
e98e4ba58da5838c0547afb1f7885b51

---

## Relationship between NPV and IRR

```yaml
type: NormalExercise
key: 395b7d2f2c
lang: r
xp: 100
skills: 1
```

In the video, we made the claim and explored the intuition that IRR and NPV will always lead to the same conclusion regarding whether or not a potential project is profitable. In this exercise, we will test out this claim on a few cashflows. 

In your environment, we have loaded three hypothetical streams of cashflows: `cashflow1`, `cashflow2`, and `cashflow3`. Additionally, your `calc_pv()`, `calc_npv()`, and `calc_irr()` functions are loaded in the environment.

`@instructions`
- Use your `calc_irr()` function to compute `r1`, `r2`, and `r3` as the internal rates of return for `cashflow1`, `cashflow2`, and `cashflow3` respectively  
- Use your `calc_npv()` function to compute `npv1`, `npv2`, and `npv3`as the NPV for the respective cashflows, assuming `r1`, `r2`, and `r3` as the respective discount rates
- Examine the resulting values for `npv1`, `npv2`, and `npv3`. What do you expect them to be?

`@hint`
- For each `rI`, pass the corresponding `cashflowI` into `calc_irr()` (`I` = 1,2,3)
- For each `npvI`, pass the corresponding `rI` into `calc_npv()` (`I` = 1,2,3)

`@pre_exercise_code`
```{r}
# exercise data
cashflow1 <- c(-50000, 100, 2000, 2000, 5000, 10000, 10000, 10000, 10000, 10000, 10000)
cashflow2 <- c(-100000, rep(20000, 5))
cashflow3 <- c(-8000, seq(6000,0, -1000))

# reload former user-created functions
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}

calc_irr <- function(cashflows) {

    uniroot(calc_npv, 
        interval = c(0, 1), 
        cashflows = cashflows)$root
    
}
```

`@sample_code`
```{r}
# calculate internal rate of return (IRR) for each stream of cashflows
r1 <- calc_irr(___)
r2 <- calc_irr(___)
r3 <- calc_irr(___)

# calculate net present value (NPV) for each stream of cashflows, assuming r = irr
npv1 <- calc_npv(cashflow1, ___)
npv2 <- calc_npv(cashflow2, ___)
npv3 <- calc_npv(cashflow3, ___)

# examine results
npv1
npv2
npv3
```

`@solution`
```{r}
# calculate internal rate of return (IRR) for each stream of cashflows
r1 <- calc_irr(cashflow1)
r2 <- calc_irr(cashflow2)
r3 <- calc_irr(cashflow3)

# calculate net present value (NPV) for each stream of cashflows, assuming r = irr
npv1 <- calc_npv(cashflow1, r1)
npv2 <- calc_npv(cashflow2, r2)
npv3 <- calc_npv(cashflow3, r3)

# examine results
npv1
npv2
npv3
```

`@sct`
```{r}
success_msg("Note that they aren't exactly zero due to numerical approximation, but no CFO is going to make capital budgetting decisions on a numerical difference less than a cup of coffee!")
```

---

## Pitfalls of IRR

```yaml
type: NormalExercise
key: a13a2f8fea
lang: r
xp: 100
skills: 1
```

We learned that there are a couple of situations where IRR "breaks down": namely, when there are *multiple* break-even growth rates or when there are *no* break-even growth rates. Lets see both of these in action. 

In the environment are `init_investment`, `cf1`, and `cf2`, denoting two streams of cashflows for us to value. Additionally, there is a vector `rates` with values of discount rates ranging from 0% to 25%, by 0.5% intervals

In the console, test out `calc_irr(init_investment, cf1)` and `calc_irr(cf2)` to see what happens. 

Why do these return errors? Let's explore these cashflows to find out.

`@instructions`
- Calculate `npv1` and `npv2` with `group_by` and `mutate` calling `calc_npv()` with the arguments `cf1` and `cf2`, respectively
 - Plot line graphs of the results, setting the x-axis (`x=`) to be the possible rates, the first `y` to be `cf1` and the second `y` to be `cf2`
 - Analyze the results

`@hint`
- The first call to `geom_line()` inherits `x` and `y` from `aes()`. In the second call to `geom_line()`, we are overwriting the `y` selection.

`@pre_exercise_code`
```{r}
# load libraries
library(dplyr)
library(ggplot2)

# define example data
cf1 <-c(-5000, rep(450,10))
cf2 <-c(-5000, rep(2000,6), rep(-2000, 4))
rates <- seq(0,0.25,0.005)

# reload former user-created functions
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}

calc_irr <- function(cashflows) {

    uniroot(calc_npv, 
        interval = c(0, 1), 
        cashflows = cashflows)$root
    
}
```

`@sample_code`
```{r}
# create dataset of NPV for each cashflow and rate
npv_by_rates <- data.frame(rates) %>%
	group_by(rates) %>%
    mutate(
        npv1 = calc_npv(___, rates),
        npv2 = calc_npv(___, rates) 
        )
   
# plot cashflows over different discount rates     
ggplot(npv_by_rates, aes(x = ___, y = ___))+
  geom_line() +
  geom_line(aes(y = ___)) +
  labs( title = "NPV by Discount Rate", subtitle = "A Tale of Two Troubling Cashflows",
      y = "NPV ($)",x = "Discount Rate (%)") +
  annotate("text", x = 0.2, y = -500, label = "Two break-even points") +
  annotate("text", x = 0.2, y = -2500, label = "No break-even point")
```

`@solution`
```{r}
# create dataset of NPV for each cashflow and rate
npv_by_rates <- data.frame(rates) %>%
	group_by(rates) %>%
    mutate(
        npv1 = calc_npv(cf1, rates),
        npv2 = calc_npv(cf2, rates) 
        )
   
# plot cashflows over different discount rates     
ggplot(npv_by_rates, aes(x = rates, y = npv1))+
  geom_line() +
  geom_line(aes(y = npv2)) +
  labs( title = "NPV by Discount Rate", subtitle = "A Tale of Two Troubling Cashflows", 
       y = "NPV ($)",x = "Discount Rate (%)") +
  annotate("text", x = 0.2, y = -500, label = "Two break-even points") +
  annotate("text", x = 0.2, y = -2500, label = "No break-even point")
```

`@sct`
```{r}
success_msg("IRR can be a useful summary metric, but when there are either no roots or multiple roots, it's logic starts to break down.Also note that while our calc_irr() function has reasonable behavior in such cases, it would be much better to proactively check for possible errors within our function and provide users with a more helpful error message. This is outside of our scope, but do check out DataCamp's course on writing functions in R.")
```

---

## NPV vs. IRR Decision Making

```yaml
type: NormalExercise
key: b8db6f9c1a
lang: r
xp: 100
skills: 1
```

Previously, we said that IRR and NPV lead to the same decision about whether or not a project is profitable. However, they could lead to different decisions about which project to invest in. Why? The difference comes down to thinking in absolute versus relative terms. Let's explore this further.

Your environment contains the `cashflows` dataframe, which includes cashflow projects for four different projects. The `option` column contains an indicator variable denoting each of these projects, the `time` variable specifies the time of receipt of each future cashflow, and the `cashflow` column contains the actual projects. 

We will use your `calc_npv()` and `calc_irr()` functions to compute both metrics on each of the four options and compare the results.

`@instructions`
- Inspect `cashflows` in the console. Note the different timing and magnitudes of the cashflows. 
- Create `cashflow_comparison` grouping the `cashflows` dataframe by `option` and summarizing each `cashflow` using your `calc_npv()` and `calc_irr()` functions. 
- Plot the results by specifying axes of `x = npv` and `y = irr`

`@hint`
- Review the `group_by`, `summarize` workflow from the slides

`@pre_exercise_code`
```{r}
library(dplyr)
library(ggplot2)

# exercise data
cashflow1 <- c(-10, rep(4, 10))
cashflow2 <- c(-10, rep(3, 10))*100
cashflow3 <- c(-10, rep(2, 10))*10000
cashflow4 <- c(-10, rep(1, 10))


cashflows <-
  data.frame(
    option = sort(rep(1:4,11)),
    time = rep(0:10, 4),
    cashflow = c(cashflow1, cashflow2, cashflow3, cashflow4)
  )

# reload former user-created functions
calc_pv <- function(fv, r, n){
  
  pv <- fv / (1+r)^n
  pv
  
}

calc_npv <- function(cashflows, r) {
  
  n <- 0:(length(cashflows) - 1)
  npv <- sum( calc_pv(cashflows, r, n) )
  npv

}

calc_irr <- function(cashflows) {

    uniroot(calc_npv, 
        interval = c(0, 1), 
        cashflows = cashflows)$root
    
}
```

`@sample_code`
```{r}
# calculate summary metrics
cashflow_comparison <-
  cashflows %>%
  group_by(___) %>%
  summarize( npv = calc_npv(___, 0.1),
             irr = calc_irr(___) )
             
# inspect output
cashflow_comparison
             
# visualize summary metrics
ggplot(cashflow_comparison,
       aes(x = ___, y = ___, col = factor(option))) +
  geom_point(size = 5) +
  geom_hline(yintercept = 0.1) +
  scale_y_continuous(label = scales::percent) +
  scale_x_continuous(label = scales::dollar) +
  labs(title = "NPV versus IRR for Project Alternatives",
       subtitle = "NPV calculation assumes 10% discount rate",
       caption = "Line shows actual discount rate to asses IRR break-even",
       x = "NPV ($)", y = "IRR (%)",col = "Option")
```

`@solution`
```{r}
# calculate summary metrics
cashflow_comparison <-
  cashflows %>%
  group_by(option) %>%
  summarize( npv = calc_npv(cashflow, 0.1),
             irr = calc_irr(cashflow) )

# inspect output
cashflow_comparison
             
# visualize summary metrics
ggplot(cashflow_comparison,
       aes(x = npv, y = irr, col = factor(option))) +
  geom_point(size = 5) +
  geom_hline(yintercept = 0.1) +
  scale_y_continuous(label = scales::percent) +
  scale_x_continuous(label = scales::dollar) +
  labs(title = "NPV versus IRR for Project Alternatives",
       subtitle = "NPV calculation assumes 10% discount rate",
       caption = "Line shows actual discount rate to asses IRR break-even",
       x = "NPV ($)", y = "IRR (%)", col = "Option")
```

`@sct`
```{r}
success_msg("Good work! Based on this plot project 4 is never profitable, but any of projects 1, 2, and 3 would appear to be profitable. However, which is the most profitable depends on which metric we use. Project 1 has the highest IRR, but project 3 undoubtedly produces the largest NPV. However, this is because it requires the highest initial investment. This example shows how different metrics capture different aspects of value. It's always good to keep their strengths and weaknesses in mind and to examine multiple metrics.")
```

---

## Recap of Metrics

```yaml
type: VideoExercise
key: eaf36e6b87
lang: r
xp: 50
skills: 1
```

`@projector_key`
89a84970a02da6cf5017c582bb6dd839
