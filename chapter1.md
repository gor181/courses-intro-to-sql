---
title: 'Selecting columns'
description: 'This chapter provides a brief introduction to working with relational databases. You''ll learn about their structure, how to talk about them using database lingo, and how to begin an analysis by using simple SQL commands to select and summarize columns from database tables.'
---

## Welcome to the course!

```yaml
type: VideoExercise 
lang: sql
xp: 50 
skills: 1
key: dcdbb24914   
```

`@projector_key`
f05d06ad7807cf476fdb5f674174c9d5
---

## Onboarding | Tables

```yaml
type: MultipleChoiceExercise 
lang: sql
xp: 50 
skills: 1
key: e456699517   
```


If you've used DataCamp to learn [R](https://www.datacamp.com/courses/free-introduction-to-r) or [Python](https://www.datacamp.com/courses/intro-to-python-for-data-science), you'll be familiar with the interface. For SQL, however, there are a few new features you should be aware of. asdfasdf

For this course, you'll be using a database containing information on almost 5000 films. To the right, underneath the editor, you can see the data in this database by clicking through the tabs.

From looking at the tabs, who is the first person listed in the `people` table? gh edit 9


`@instructions`
- Kanye West
- Biggie Smalls

`@hint`
Look at the `people` tab under the editor! asdf adf

`@pre_exercise_code`

```{python}

connect('postgresql', 'films')

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

msg1 = 'Nope, look at the `people` table!'
correct = 'Correct!'

Ex().test_mc(3,[msg1, msg1, correct, msg1])

```


`@possible_answers`


`@feedback`


---

## Onboarding | Query Result

```yaml
type: MultipleChoiceExercise 
lang: sql
xp: 50 
skills: 1
key: 5314676aac   
```


Notice the **query result** tab in the bottom right corner of your screen. This is where the results of your SQL queries will be displayed.

Run the query in the editor and check out the resulting table in the query result tab! 

<hr>

Who is the second person listed in the query result? asdf adfa a adsfa sdf


`@instructions`
- Kanye West
- A. Michael Baldwin
- 50 Cent
- Jay Z

`@hint`
Run the code in the editor and look at the query result tab under the editor!

`@pre_exercise_code`

```{python}

connect('postgresql', 'films')

```


`@sample_code`

```{sql}

SELECT name FROM people;

```


`@solution`

```{sql}

```


`@sct`

```{python}

msg1 = 'Nope, look at the query result tab!'
correct = 'Correct!'

Ex().test_mc(2, [msg1, correct, msg1, msg1])

```


`@possible_answers`


`@feedback`


---

## Onboarding | Errors

```yaml
type: NormalExercise 
lang: sql
xp: 100 
skills: 1
key: 7d7e325a12   
```


If you submit the code to the right, you'll see that you get two types of errors.

_SQL_ errors are shown below the editor. These are errors returned by the _SQL_ engine. You should see:

```
syntax error at or near "'DataCamp <3 SQL'" LINE 2: 'DataCamp <3 SQL' ^
```
<br>
_DataCamp_ errors are shown in the **Instructions** box. These will let you know in plain English where you went wrong in your code! You should see:

```
You need to add SELECT at the start of line 2!
```


`@instructions`
Submit the code to the right, check out the errors, then fix them!

`@hint`
In the editor, change line 2 to `SELECT 'DataCamp <3 SQL'`.

`@pre_exercise_code`

```{python}

connect('postgresql', 'films')

```


`@sample_code`

```{sql}

-- Try running me!
'DataCamp <3 SQL'
AS result;

```


`@solution`

```{sql}

-- Try running me!
SELECT 'DataCamp <3 SQL'
AS result;

```


`@sct`

```{python}

Ex().test_student_typed('SELECT|select', msg='You need to add `SELECT` at the start of line 2!')
Ex().test_has_columns()
Ex().test_error()

```


`@possible_answers`


`@feedback`


---

## Beginning your SQL journey

```yaml
type: PlainMultipleChoiceExercise 
lang: sql
xp: 50 
key: a1f556e63f   
```


Now that you're familiar with the interface, let's get straight into it.

SQL, which stands for *Structured Query Language*, is a language for interacting with data stored in something called a *relational database*.

You can think of a relational database as a collection of tables. A table is just a set of rows and columns, like a spreadsheet, which represents exactly one type of entity. For example, a table might represent employees in a company or purchases made, but not both.

Each row, or *record*, of a table contains information about a single entity. For example, in a table representing employees, each row represents a single person. Each column, or *field*, of a table contains a single attribute for all rows in the table. For example, in a table representing employees, we might have a column containing first and last names for all employees.

The table of employees might look something like this:

| id | name | age | nationality |
|----|----|----|----|
| 1 | Jessica | 22 | Ireland
| 2 | Gabriel | 48 | France |
| 3 | Laura | 36 | USA |

<hr>
How many fields does the employees table above contain?


`@instructions`
- 1
- 2
- 3
- 4

`@hint`
Remember that in database lingo, a column is called a *field*. How many fields does the table contain?

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

msg1 = "Incorrect, a table contains information about one type of entity, but generally has multiple fields."
msg2 = "Sorry, try again!"
msg3 = "Incorrect, the table contains three records, but how many fields does it have?"
success_msg = "Correct! The table contains four columns, or fields."

Ex().test_mc(4, [msg1, msg2, msg3, success_msg])

```


`@possible_answers`


`@feedback`


---

## Onboarding | Bullet Exercises

```yaml
type: BulletExercise 
lang: sql
xp: 100 
skills: 1
key: 81eb00a53d   
```


Another new feature we're introducing is the *bullet exercise*, which allows you to easily practice a new concept through repetition. Check it out below!


`@instructions`


`@hint`


`@pre_exercise_code`

```{python}

connect('postgresql', 'films')

```


`@sample_code`

```{sql}

SELECT 'SQL'
AS result;

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


***



```yaml
type: NormalExercise 
xp: 35 
key: 157ee8d1ad   
```





`@instructions`
Submit the query in the editor! Don't worry, you'll learn how it works soon.

`@hint`
Submit the query!

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT 'SQL'
AS result;

```


`@sct`

```{python}

Ex().test_error()

Ex().test_student_typed('SQL', msg="Don't modify the query!", fixed=True)

Ex().test_has_columns()
Ex().check_result()

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 35 
key: 764f82129d   
```





`@instructions`
Now change `'SQL'` to `'SQL is'` and click Submit!

`@hint`
Change the code and submit the query!

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT 'SQL is'
AS result;

```


`@sct`

```{python}

Ex().test_error()

Ex().test_student_typed('SQL is', msg="Did you change the query correctly?", fixed=True)

Ex().test_has_columns()
Ex().check_result()

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 30 
key: 1496605dac   
```





`@instructions`
Finally, change `'SQL is'` to `'SQL is cool!'` and click Submit!

`@hint`
Change the code and submit the query!

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT 'SQL is cool!'
AS result;

```


`@sct`

```{python}

Ex().test_error()

Ex().test_student_typed('SQL is cool!', msg="Did you change the query correctly?", fixed=True)

Ex().test_has_columns()
Ex().check_result()

```


`@possible_answers`


`@feedback`



---

## SELECTing single columns

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: c0bb58f7f9   
```


While SQL can be used to create and modify databases, the focus of this course will be *querying* databases. A *query* is a request for data from a database table (or combination of tables). Querying is an essential skill for a data scientist, since the data you need for your analyses will often live in databases.

In SQL, you can select data from a table using a `SELECT` statement. For example, the following query selects the `name` column from the `people` table:

```sql
SELECT name
FROM people;
```

In this query, `SELECT` and `FROM` are called keywords. In SQL, keywords are not case-sensitive, which means you can write the same query as:

```sql
select name
from people;
```

That said, it's good practice to make SQL keywords uppercase to distinguish them from other parts of your query, like column and table names.

It's also good practice (but not necessary for the exercises in this course) to include a semicolon at the end of your query. This tells SQL where the end of your query is!

Remember, you can see the results of executing your query in the __query result__ tab to the right!


`@instructions`


`@hint`


`@pre_exercise_code`

```{python}

connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


***



```yaml
type: NormalExercise 
xp: 35 
key: 4a74270ecd   
```





`@instructions`
Select the `release_year` column from the `films` table.

`@hint`
```
SELECT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT release_year
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

release_year = test_column('release_year', msg='Did you select the `release_year` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    release_year,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 35 
key: a41cc766d5   
```





`@instructions`
Select the `title` column from the `films` table.

`@hint`
```
SELECT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT title
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 30 
key: 323bd5ddf5   
```





`@instructions`
Select the `name` of each person in the `people` table.

`@hint`
```
SELECT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT name
FROM people;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

name = test_column('name', msg='Did you select the `name` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    name,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



---

## SELECTing multiple columns

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: 09f21bae4c   
```


Well done! Now you know how to select single columns.

In the real world, you will often want to select multiple columns. Luckily, SQL makes this really easy. To select multiple columns from a table, simply separate the column names with commas!

For example, this query selects two columns, `name` and `birthdate`, from the `people` table:

```sql
SELECT name, birthdate
FROM people;
```

Sometimes, you may want to select all columns from a table. Typing out every column name would be a pain, so there's a handy shortcut:

```sql
SELECT *
FROM people;
```

If you only want to return a certain number of results, you can use the `LIMIT` keyword to limit the number of rows returned:

```sql
SELECT *
FROM people
LIMIT 10;
```

Before getting started with the instructions below, check out the column names in the `films` table by clicking on the `films` tab to the right!


`@instructions`


`@hint`


`@pre_exercise_code`

```{python}

connect('postgresql', 'films')
set_options(visible_tables = ['films'])

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


***



```yaml
type: NormalExercise 
xp: 25 
key: d561b4df97   
```





`@instructions`
Get the title of every film from the `films` table.

`@hint`
```
SELECT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT title
FROM films;

```


`@sct`

```{python}

from sqlwhat_ext import check_result2

sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result2(), [
    from_clause,
    title,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 25 
key: 917d7dc533   
```





`@instructions`
Get the title and release year for every film.

`@hint`
```
SELECT ___, ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT title, release_year
FROM films;

```


`@sct`

```{python}

from sqlwhat_ext import check_result2

sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')

release_year = test_column('release_year', msg='Did you select the `release_year` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result2(), [
    from_clause,
    title,
    release_year,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 25 
key: eeba078a00   
```





`@instructions`
Get the title, release year and country for every film.

`@hint`
```
SELECT ___, ___, ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT title, release_year, country
FROM films;

```


`@sct`

```{python}

from sqlwhat_ext import check_result2

sel = check_node('SelectStmt')

title = test_column('title', msg='Did you select the `title` column correctly?')

release_year = test_column('release_year', msg='Did you select the `release_year` column correctly?')

country = test_column('country', msg='Did you select the `country` column correctly?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` cause correct?')

Ex().test_correct(check_result2(), [
    from_clause,
    title,
    release_year,
    country,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 25 
key: dac27d9aad   
```





`@instructions`
Get all columns from the `films` table.

`@hint`
```
SELECT *
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT *
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

star = sel.check_node('Star').has_equal_ast('Did you use `SELECT *` to get all columns?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    star,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



---

## SELECT DISTINCT

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: de52236965   
```


Often your results will include many duplicate values. If you want to select all the unique values from a column, you can use the `DISTINCT` keyword.

This might be useful if, for example, you're interested in knowing which languages are represented in the `films` table:

```sql
SELECT DISTINCT language
FROM films;
```

Remember, you can check out the data in the tables by clicking on the tabs to the right under the editor!


`@instructions`


`@hint`


`@pre_exercise_code`

```{python}

connect('postgresql', 'films')
set_options(visible_tables = ['films', 'roles'])

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


***



```yaml
type: NormalExercise 
xp: 35 
key: e6b81711f1   
```





`@instructions`
Get all the unique countries represented in the `films` table.

`@hint`
```
SELECT DISTINCT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT DISTINCT country
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

country = test_column('country', msg='Did you select the `country` column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    distinct,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 35 
key: 2cb9a4bf6a   
```





`@instructions`
Get all the different film certifications from the `films` table.

`@hint`
```
SELECT DISTINCT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT DISTINCT certification
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

certification = test_column('certification', msg='Did you select the `certification` column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    certification,
    distinct,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 30 
key: 26835d3029   
```





`@instructions`
Get the different types of film roles from the `roles` table.

`@hint`
```
SELECT DISTINCT ___
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT DISTINCT role
FROM roles;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

distinct = sel.check_field('pref').has_equal_ast("Don't forget to use the `DISTINCT` keyword!")

role = test_column('role', msg='Did you select the `role` column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    distinct,
    role,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



---

## Learning to COUNT

```yaml
type: MultipleChoiceExercise 
lang: sql
xp: 50 
key: 97f97f5766   
```


What if you want to count the number of employees in your employees table? The `COUNT` statement lets you do this by returning the number of rows in one or more columns.

For example, this code gives the number of rows in the `people` table:

```sql
SELECT COUNT(*)
FROM people;
```

<hr>
How many records are contained in the `reviews` table?


`@instructions`
- 9,468
- 8,397
- 4,968
- 9,837
- 9,864

`@hint`
Run a query to count the number of records in the `reviews` table!

`@pre_exercise_code`

```{python}

connect('postgresql', 'films')

```


`@sample_code`

```{sql}

-- You can test out queries here!

```


`@solution`

```{sql}

```


`@sct`

```{python}

success_msg = 'Correct!'
msg2 = "Use the syntax provided in the example. Be sure to swap out `people` for `reviews`!"

Ex().test_mc(3,[msg2, msg2, success_msg, msg2, msg2])

```


`@possible_answers`


`@feedback`


---

## Practice with COUNT

```yaml
type: BulletExercise 
lang: sql
xp: 100 
key: 7643365e67   
```


As you've seen, `COUNT(*)` tells you how many rows are in a table. However, if you want to count the number of *non-missing* values in a particular column, you can call `COUNT` on just that column.

For example, to count the number of birth dates present in the `people` table:

```sql
SELECT COUNT(birthdate)
FROM people;
```

It's also common to combine `COUNT` with `DISTINCT` to count the number of *distinct* values in a column.

For example, this query counts the number of distinct birth dates contained in the `people` table:

```sql
SELECT COUNT(DISTINCT birthdate)
FROM people;
```

Let's get some practice with `COUNT`!


`@instructions`


`@hint`


`@pre_exercise_code`

```{python}

connect('postgresql', 'films')
set_options(visible_tables = ['films', 'people'])

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


***



```yaml
type: NormalExercise 
xp: 20 
key: 4688067e3e   
```





`@instructions`
Count the number of rows in the `people` table.

`@hint`
```
SELECT COUNT(___)
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT COUNT(*)
FROM people;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

temp = sel.check_node('Call')

count_call = temp.check_field('name').has_equal_ast('Are you calling the `COUNT` function?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` on the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    count_call,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 20 
key: 497ffa962e   
```





`@instructions`
Count the number of (non-missing) birth dates in the `people` table.

`@hint`
```
SELECT ___(___)
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT COUNT(birthdate)
FROM people;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

temp = sel.check_node('Call')

count_call = temp.check_field('name').has_equal_ast('Are you calling the `COUNT` function?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` on the right column?')

from_clause = count_call.has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 20 
key: 50c903a00a   
```





`@instructions`
Count the number of unique birth dates in the `people` table.

`@hint`
```
SELECT ___(DISTINCT ___)
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT COUNT(DISTINCT birthdate)
FROM people;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

temp = sel.check_node('Call')

count_call = temp.check_field('name').has_equal_ast('Are you using `COUNT` with `DISTINCT`?')

# not urgent: this might need to be changed
# count_distinct_arg = temp.check_field('pref').has_equal_ast('Are you using `DISTINCT` with `COUNT()`?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` and `DISTINCT` with the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 20 
key: 511052cbbe   
```





`@instructions`
Count the number of unique languages in the `films` table.

`@hint`
```
SELECT ___(DISTINCT ___)
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT COUNT(DISTINCT language)
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

temp = sel.check_node('Call')

count_call = temp.check_field('name').has_equal_ast('Are you using `COUNT` with `DISTINCT`?')

# not urgent: this might need to be changed
# count_distinct_arg = temp.check_field('pref').has_equal_ast('Are you using `DISTINCT` with `COUNT()`?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` and `DISTINCT` with the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



***



```yaml
type: NormalExercise 
xp: 20 
key: 9e1147efe5   
```





`@instructions`
Count the number of unique countries in the `films` table.

`@hint`
```
SELECT ___(DISTINCT ___)
FROM ___;
```

`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

SELECT COUNT(DISTINCT country)
FROM films;

```


`@sct`

```{python}

sel = check_node('SelectStmt')

temp = sel.check_node('Call')

count_call = temp.check_field('name').has_equal_ast('Are you using `COUNT` with `DISTINCT`?')

# not urgent: this might need to be changed
# count_distinct_arg = temp.check_field('pref').has_equal_ast('Are you using `DISTINCT` with `COUNT()`?')

count_args = temp.check_field('args').has_equal_ast('Are you using `COUNT` and `DISTINCT` with the right column?')

from_clause = sel.check_field('from_clause').has_equal_ast('Is your `FROM` clause correct?')

Ex().test_correct(check_result(), [
    from_clause,
    count_call,
    count_args,
    test_has_columns(),
    test_ncols(),
    test_error()
])

```


`@possible_answers`


`@feedback`



---

## Insert exercise title here

```yaml
type: NormalExercise 
xp: 100 
key: f627c8eb1a   
```





`@instructions`
soemthing

`@hint`


`@pre_exercise_code`

```{python}

```


`@sample_code`

```{sql}

```


`@solution`

```{sql}

```


`@sct`

```{python}

```


`@possible_answers`


`@feedback`


---

## Testing again cus you never know

```yaml
type: VideoExercise 
xp: 50 
key: d91de87c17   
```

`@projector_key`
d7d38acc352eb4c7d19bf84a52a938d6
---

## Insert exercise title here

```yaml
type: VideoExercise 
xp: 50 
key: c7e305db49   
```

`@projector_key`
6de94be8faac1a73db092e7589cde70d