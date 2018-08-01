---
  title: "Aggregate Functions"
  description: "This chapter builds on the first two by teaching you how to use aggregate functions to summarize your data and gain useful insights. Additionally, you'll learn about arithmetic in SQL, and how to use aliases to make your results more readable!"
---

## Aggregate functions

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: b883e7079f   
```


Often, you will want to perform some calculation on the data in a database. SQL provides a few functions, called *aggregate functions*, to help you out with this.

some example edit.

For example,

```
SELECT AVG(budget)
FROM films;
```

gives you the average value from the `budget` column of the `films` table. Similarly, the `MAX` function returns the highest budget:

```
SELECT MAX(budget)
FROM films;
```

The `SUM` function returns the result of adding up the numeric values in a column:

```
SELECT SUM(budget)
FROM films;
```

You can probably guess what the `MIN` function does! Now it's your turn to try out some SQL functions.


`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```
***



```yaml
type: NormalExercise 
xp: 25 
key: 80fd462ae1   
```





`@instructions`
Use the `SUM` function to get the total duration of all films.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT SUM(duration)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: 7993b51268   
```





`@instructions`
Get the average duration of all films.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT AVG(duration)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: a03aeabbc6   
```





`@instructions`
Get the duration of the shortest film.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT MIN(duration)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: fabbc619c6   
```





`@instructions`
Get the duration of the longest film.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT MAX(duration)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

---

## Aggregate functions practice

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: e60103b3f1   
```


Good work. Aggregate functions are important to understand, so let's get some more practice!


`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```
***



```yaml
type: NormalExercise 
xp: 25 
key: c8173b7d3e   
```





`@instructions`
Use the `SUM` function to get the total amount grossed by all films.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT SUM(gross)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: 24c0ab68ad   
```





`@instructions`
Get the average amount grossed by all films.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT AVG(gross)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: 19838082cb   
```





`@instructions`
Get the amount grossed by the worst performing film.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT MIN(gross)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: a49b98de42   
```





`@instructions`
Get the amount grossed by the best performing film.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@solution`
```{sql}
SELECT MAX(gross)
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

---

## Combining aggregate functions with WHERE

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: b44bd43288   
```


Aggregate functions can be combined with the `WHERE` clause to gain further insights from your data.

For example, to get the total budget of movies made in the year 2010 or later:

```
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;
```

Now it's your turn!


`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```
***



```yaml
type: NormalExercise 
xp: 25 
key: b986f33a10   
```





`@instructions`
Use the `SUM` function to get the total amount grossed by all films made in the year 2000 or later.

`@hint`
```
SELECT ___(___)
FROM ___
WHERE ___ >= ___;
```

`@solution`
```{sql}
SELECT SUM(gross)
FROM films
WHERE release_year >= 2000;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
sum_call = temp.check_field('name').has_equal_ast('Are you calling the `SUM` function?')
sum_args = temp.check_field('args').has_equal_ast('Are you using using `SUM` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

where_release_year = where_clause.has_equal_ast(sql='release_year >= 2000', start='expression', exact=False, msg='Did you check the `release_year` correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    where_release_year,
    sum_call,
    sum_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: 65e81175c5   
```





`@instructions`
Get the average amount grossed by all films whose titles start with the letter 'A'.

`@hint`
```
SELECT ___(___)
FROM ___
WHERE ___ LIKE 'A%';
```

`@solution`
```{sql}
SELECT AVG(gross)
FROM films
where title LIKE 'A%';
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
avg_call = temp.check_field('name').has_equal_ast('Are you calling the `AVG` function?')
avg_args = temp.check_field('args').has_equal_ast('Are you using using `AVG` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

left_like = where_clause.check_field('left').has_equal_ast('Are you using `title` with `LIKE`?')
op_like = where_clause.check_field('op').has_equal_ast('Are you using the `LIKE` operator in your `WHERE` clause?')

right_like = where_clause.check_field('right').has_equal_ast("Are you using `LIKE` with `'A%'`?")

Ex().test_correct(check_result(), [
    from_clause,
    left_like,
    op_like,
    right_like,
    avg_call,
    avg_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: 3ca90a8536   
```





`@instructions`
Get the amount grossed by the worst performing film in 1994.

`@hint`
```
SELECT ___(___)
FROM ___
WHERE ___ = ___;
```

`@solution`
```{sql}
SELECT MIN(gross)
FROM films
WHERE release_year = 1994;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
min_call = temp.check_field('name').has_equal_ast('Are you calling the `MIN` function?')
min_args = temp.check_field('args').has_equal_ast('Are you using using `MIN` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

where_release_year = where_clause.has_equal_ast(sql='release_year = 1994', start='expression', exact=False, msg='Did you check the `release_year` correctly?')

Ex().test_correct(check_result(), [
    from_clause,
    where_release_year,
    min_call,
    min_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 25 
key: d2e630e656   
```





`@instructions`
Get the amount grossed by the best performing film between 2000 and 2012, inclusive.

`@hint`
```
SELECT ___(___)
FROM ___
WHERE ___ BETWEEN ___ AND ___;
```

`@solution`
```{sql}
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

temp = sel.check_node('Call')
max_call = temp.check_field('name').has_equal_ast('Are you calling the `MAX` function?')
max_args = temp.check_field('args').has_equal_ast('Are you using using `MAX` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

where_clause = sel.check_field('where_clause')

between_left = where_clause.check_field('left').has_equal_ast('Are you using `release_year` with `BETWEEN`?')
between_op1 = where_clause.check_field('right', 0).has_equal_ast('Check the first part of your `BETWEEN`!')
between_op2 = where_clause.check_field('right', 1).has_equal_ast('Check the second part of your `BETWEEN`!')

Ex().test_correct(check_result(), [
    from_clause,
    between_left,
    between_op1,
    between_op2,
    max_call,
    max_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

---

## A note on arithmetic

```yaml
type: MultipleChoiceExercise 
lang: sql
xp: 50 
skills: 1
key: 7b8b54b64d   
```


In addition to using aggregate functions, you can perform basic arithmetic with symbols like `+`, `-`, `*`, and `/`.

So, for example, this gives a result of `12`:
 adsfasdf
```
SELECT (4 * 3);
```

However, the following gives a result of `1`:

```
SELECT (4 / 3);
```

What's going on here?

SQL assumes that if you divide an integer by an integer, you want to get an integer back. So be careful when dividing!

If you want more precision when dividing, you can add decimal places to your numbers. For example,

```
SELECT (4.0 / 3.0) AS result;
```

gives you the result you would expect: `1.333`.

<hr>
What is the result of `SELECT (10 / 3);`?


`@instructions`
- 2.333
- 3.333
- 3
- 3.0

`@hint`
Run a query in the editor to the right.

`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
```
`@sample_code`
```{sql}
-- You can test out queries here!
```
`@sct`
```{python}
success_msg = 'Correct!'
msg2 = "Incorrect, try out the query in the editor!"

Ex().test_mc(3,[msg2, msg2, success_msg, msg2])
```
---

## It's AS simple AS aliasing

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: 9f4b026fe7   
```


You may have noticed in the first exercise of this chapter that the column name of your result was just the name of the function you used. For example,

```
SELECT MAX(budget)
FROM films;
```

gives you a result with one column, named `max`. But what if you use two functions like this?

```
SELECT MAX(budget), MAX(duration)
FROM films;
```

Well, then you'd have two columns named `max`, which isn't very useful!

To avoid situations like this, SQL allows you to do something called _aliasing_. Aliasing simply means you assign a temporary name to something. To alias, you use the `AS` keyword, which you've already seen earlier in this course.

For example, in the above example we could use aliases to make the result clearer:

```
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;
```

Aliases are helpful for making results more readable!


`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films'])
```
***



```yaml
type: NormalExercise 
xp: 35 
key: ec33c2353b   
```





`@instructions`
Get the title and net profit (the amount a film grossed, minus its budget) for all films. Alias the net profit as `net_profit`.

`@hint`
```
SELECT ___, ___ - ___ AS ___
FROM ___;
```

`@solution`
```{sql}
SELECT title, gross - budget AS net_profit
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

title = test_column('title').has_equal_ast('Did you select the `title` column correctly?')

alias = test_column('net_profit', match='exact', msg='Did you alias your result as `net_profit`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left').has_equal_ast('Are you using the `gross` column?')

right_eqn = alias_eqn.check_field('right').has_equal_ast('Are you using the `budget` column?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you subtracting `budget` from `gross`?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    alias_eqn,
    left_eqn,
    op_eqn,
    right_eqn,
    alias,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 35 
key: 1351c6f6bb   
```





`@instructions`
Get the title and duration in hours for all films. The duration is in minutes, so you'll need to divide by 60.0 to get the duration in hours. Alias the duration in hours as `duration_hours`.

`@hint`
```
SELECT ___, ___ / 60.0 AS ___
FROM ___;
```

`@solution`
```{sql}
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')

alias = test_column('duration_hours', match='exact', msg='Did you alias your result as `duration_hours`?', digits=4)

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left').has_equal_ast('Are you using the `duration` column?')

right_eqn = alias_eqn.check_field('right').has_equal_ast('Are you dividing the `duration` column by `60.0`?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you dividing by `60.0`?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(alias, [
    from_clause,
    left_eqn,
    op_eqn,
    right_eqn,
    alias,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 30 
key: 497f8d2a8a   
```





`@instructions`
Get the average duration in hours for all films, aliased as `avg_duration_hours`.

`@hint`
```
SELECT ___(___) / 60.0 AS avg_duration_hours  
FROM ___;
```

`@solution`
```{sql}
SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;
```
`@sct`
```{python}
# TODO: come back to this with better solution once sqlwhat is patched
sel = check_node('SelectStmt')

alias = test_column('avg_duration_hours', match='exact', msg='Did you alias your result as `avg_duration_hours`?', digits=4)

avg1 = test_student_typed('AVG\(duration\)\s+\/\s+60.0', msg='Are you calling `AVG` correctly?')
avg2 = test_student_typed('AVG\(duration\s+\/\s+60.0\)', msg='Are you calling `AVG` correctly?')
avg3 = test_student_typed('AVG\(duration\/60.0\)', msg='Are you calling `AVG` correctly?')
avg4 = test_student_typed('AVG\(duration\/60.0\)', msg='Are you calling `AVG` correctly?')


avg_call = test_or(avg1, avg2, avg3, avg4)

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(alias, [
    from_clause,
    avg_call,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

---

## Even more aliasing

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: 7e3a93209c   
```


Let's practice your newfound aliasing skills some more before moving on!


**Recall:** SQL assumes that if you divide an integer by an integer, you want to get an integer back. 

This means that the following will erroneously result in `400.0`:

```
SELECT 45 / 10 * 100.0;
```

This is because `45 / 10` evaluates to an integer (`4`), and not a decimal number like we would expect.

So when you're dividing make sure at least one of your numbers has a decimal place:

```
SELECT 45 * 100.0 / 10;
```

The above now gives the correct answer of `450.0` as now the numerator of the division (`45 * 100.0`) is a decimal!


`@pre_exercise_code`
```{python}
connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])
```
`@sample_code`
```{sql}
-- get the count(deathdate) and multiply by 100.0
-- then divide by count(*)
```
***



```yaml
type: NormalExercise 
xp: 35 
key: e14dc7c1a2   
```





`@instructions`
Get the percentage of `people` who are no longer alive. Alias the result as `percentage_dead`. Remember to use `100.0` and not `100`!

`@hint`
```
SELECT ___(___) * 100.0 / ___(___) AS percentage_dead
FROM ___;
```

`@solution`
```{sql}
-- get the count(deathdate) and multiply by 100.0
-- then divide by count(*) 
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

alias = test_column('percentage_dead', match='exact', msg='Did you alias your result as `percentage_dead`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_node('BinaryExpr')

right_eqn = alias_eqn.check_node('Call').has_equal_ast('Are you dividing by `COUNT(*)`?')

temp = left_eqn.check_field('left')

count_call = temp.check_field('name').has_equal_ast('Are you using the `COUNT` function for the top of your fraction?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` on the right column?')

op_eqn = left_eqn.check_field('op').has_equal_ast('Are you multiplying `COUNT(deathdate)` by `100.00`?')

right_left_eqn = left_eqn.check_field('right').has_equal_ast('Make sure to multiply the top by `100.0`!')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    op_eqn,
    right_left_eqn,
    right_eqn,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 35 
key: c2bbd9a806   
```





`@instructions`
Get the number of years between the newest film and oldest film. Alias the result as `difference`.

`@hint`
```
SELECT ___(___) - ___(___)
AS difference
FROM ___;
```

`@solution`
```{sql}
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('difference', match='exact', msg='Did you alias your result as `difference`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left')
right_eqn = alias_eqn.check_field('right')

max_call = left_eqn.check_field('name').has_equal_ast('Did you use `MAX` function to get the oldest film?')
max_args = left_eqn.check_field('args').has_equal_ast('Are you using `MAX` on the right column?')

min_call = right_eqn.check_field('name').has_equal_ast('Did you use the `MIN` function to get the newest film?')
min_args = right_eqn.check_field('args').has_equal_ast('Are you using `MIN` on the right column?')

op_eqn = alias_eqn.check_field('op').has_equal_ast('Are you subtracting the most recent year from the least recent year?')

Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    op_eqn,
    min_call,
    min_args,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```

***



```yaml
type: NormalExercise 
xp: 30 
key: f272486b68   
```





`@instructions`
Get the number of decades the `films` table covers. Alias the result as `number_of_decades`. The top half of your fraction should be enclosed in parentheses.

`@hint`
```
SELECT (___(___) - ___(___)) / 10.0
AS number_of_decades
FROM ___;
```

`@solution`
```{sql}
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
```
`@sct`
```{python}
sel = check_node('SelectStmt')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

alias = test_column('number_of_decades', match='exact', msg='Did you alias your result as `number_of_decades`?')

alias_eqn = sel.check_node('AliasExpr').check_node('BinaryExpr')

left_eqn = alias_eqn.check_field('left')

max_node = left_eqn.check_field('left')

max_call = max_node.check_field('name').has_equal_ast('Did you use the `MAX` function to get the most recent year?')
max_args = max_node.check_field('args').has_equal_ast('Did you use `MAX` on the right column?')

min_node = left_eqn.check_field('right')

min_call = min_node.check_field('name').has_equal_ast('Did you use the `MIN` function to get the least recent year?')
min_args = min_node.check_field('args').has_equal_ast('Did you use `MIN` on the right column?')

op_eqn = left_eqn.check_field('op').has_equal_ast('Are you subtracting the newest year from the oldest year?')

other_op = alias_eqn.check_field('op').has_equal_ast("Don't forget to divide by `10.0`!")

ten = alias_eqn.check_field('right').has_equal_ast('Did you divide by `10.0`?')


Ex().test_correct(check_result(), [
    from_clause,
    max_call,
    max_args,
    op_eqn,
    min_call,
    min_args,
    other_op,
    ten,
    alias,
    test_has_columns(),
    test_ncols(),
    test_error()
])
```
